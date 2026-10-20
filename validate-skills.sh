#!/usr/bin/env bash
set -euo pipefail

ruby <<'RUBY'
require "json"
require "yaml"

skill_dirs = Dir["skills/*"].select { |path| File.directory?(path) }.sort
abort "No skill directories found." if skill_dirs.empty?

failures = []

required_tool_files = [
  "tools/aso-dev-local-mcp.md",
  "tools/asodev-product-surface-map.md",
  "tools/asodev-public-api.md"
]

required_tool_files.each do |file|
  if !File.file?(file)
    failures << "#{file}: missing repository tool reference"
  elsif File.read(file).strip.empty?
    failures << "#{file}: repository tool reference is empty"
  end
end

skill_dirs.each do |dir|
  file = File.join(dir, "SKILL.md")
  unless File.file?(file)
    failures << "#{dir}: missing SKILL.md"
    next
  end

  text = File.read(file)
  parts = text.split(/^---\s*$/, 3)
  if !text.start_with?("---\n") || parts.length < 3 || parts[1].to_s.strip.empty?
    failures << "#{file}: missing YAML frontmatter"
    next
  end

  begin
    frontmatter = YAML.safe_load(parts[1])
  rescue Psych::SyntaxError => e
    failures << "#{file}: invalid YAML frontmatter: #{e.message}"
    next
  end
  unless frontmatter.is_a?(Hash)
    failures << "#{file}: YAML frontmatter must be a mapping"
    next
  end

  name = frontmatter["name"].to_s
  description = frontmatter["description"]
  folder = File.basename(File.dirname(file))
  body = parts[2].to_s.strip

  failures << "#{file}: missing name" if name.empty?
  failures << "#{file}: missing description" if description.to_s.empty?
  failures << "#{file}: description must be a string" unless description.is_a?(String)
  failures << "#{file}: name must match folder (#{name.inspect} != #{folder.inspect})" if name != folder
  failures << "#{file}: name must use lowercase letters, digits, and hyphens" unless name.match?(/\A[a-z0-9-]+\z/)
  failures << "#{file}: name must be under 64 characters" if name.length >= 64
  failures << "#{file}: body is empty" if body.empty?
end

marketplace_files = ["marketplace.json", ".claude-plugin/marketplace.json"]

if marketplace_files.all? { |path| File.file?(path) } &&
   File.read(marketplace_files[0]) != File.read(marketplace_files[1])
  failures << "#{marketplace_files[1]} must mirror #{marketplace_files[0]}"
end

marketplace_files.each do |marketplace_file|
  next unless File.file?(marketplace_file)

  begin
    marketplace = JSON.parse(File.read(marketplace_file))
  rescue JSON::ParserError => e
    failures << "#{marketplace_file}: invalid JSON: #{e.message}"
    marketplace = nil
  end

  if marketplace
    failures << "#{marketplace_file}: missing name" if marketplace["name"].to_s.empty?
    failures << "#{marketplace_file}: missing owner.name" if marketplace.dig("owner", "name").to_s.empty?
    marketplace_version = marketplace["version"].to_s
    marketplace_version = marketplace.dig("metadata", "version").to_s if marketplace_version.empty?
    failures << "#{marketplace_file}: missing version" if marketplace_version.empty?

    plugins = marketplace["plugins"]
    if !plugins.is_a?(Array) || plugins.empty?
      failures << "#{marketplace_file}: plugins must be a non-empty array"
    else
      plugins.each_with_index do |plugin, index|
        unless plugin.is_a?(Hash)
          failures << "#{marketplace_file}: plugins[#{index}] must be an object"
          next
        end

        source = plugin["source"]
        failures << "#{marketplace_file}: plugins[#{index}].source is required" if source.to_s.empty?

        skills = plugin["skills"]
        next if skills.nil?

        unless skills.is_a?(Array) || skills.is_a?(String)
          failures << "#{marketplace_file}: plugins[#{index}].skills must be a string or array when present"
          next
        end

        skills = [skills] if skills.is_a?(String)
        expected_skills = skill_dirs.map { |dir| "./#{dir}" }
        explicit_skill_paths = skills.select { |path| path.end_with?("/SKILL.md") || File.file?(File.join(path, "SKILL.md")) }
        unknown_skills = explicit_skill_paths - expected_skills
        missing_skills = expected_skills - explicit_skill_paths

        unknown_skills.each do |skill_path|
          failures << "#{marketplace_file}: plugins[#{index}].skills references missing path #{skill_path}"
        end
        if explicit_skill_paths.any?
          missing_skills.each do |skill_path|
            failures << "#{marketplace_file}: plugins[#{index}].skills is missing #{skill_path}"
          end
        end
      end
    end
  end
end

plugin_file = ".claude-plugin/plugin.json"
if File.file?(plugin_file)
  begin
    plugin = JSON.parse(File.read(plugin_file))
  rescue JSON::ParserError => e
    failures << "#{plugin_file}: invalid JSON: #{e.message}"
    plugin = nil
  end

  if plugin
    failures << "#{plugin_file}: missing name" if plugin["name"].to_s.empty?
    failures << "#{plugin_file}: missing version" if plugin["version"].to_s.empty?

    skills = plugin["skills"]
    if skills
      unless skills.is_a?(Array) || skills.is_a?(String)
        failures << "#{plugin_file}: skills must be a string or array when present"
        skills = []
      end

      skills = [skills] if skills.is_a?(String)
      expected_skills = skill_dirs.map { |dir| "./#{dir}" }
      explicit_skill_paths = skills.select { |path| path.end_with?("/SKILL.md") || File.file?(File.join(path, "SKILL.md")) }
      unknown_skills = explicit_skill_paths - expected_skills
      missing_skills = expected_skills - explicit_skill_paths

      unknown_skills.each do |skill_path|
        failures << "#{plugin_file}: skills references missing path #{skill_path}"
      end
      if explicit_skill_paths.any?
        missing_skills.each do |skill_path|
          failures << "#{plugin_file}: skills is missing #{skill_path}"
        end
      end
    end
  end
end

if failures.empty?
  puts "All skills look valid."
else
  warn failures.join("\n")
  exit 1
end
RUBY
