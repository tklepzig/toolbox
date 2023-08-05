#!/usr/bin/env ruby
# frozen_string_literal: true

require 'yaml'
commands = YAML.load_file('scripts/index.yaml')

if ARGV[0] == '--list'
  puts commands.keys
  exit 0
end

cmd_id = ARGV[0]

unless commands.key?(cmd_id)
  puts "Unknown script #{cmd_id}"
  exit 1
end

if ARGV[1] == '-h'
  puts(commands[cmd_id].key?('help') ? commands[cmd_id]['help'] : "No help for #{cmd_id}")
  exit 1
end

if commands[cmd_id].respond_to?(:key?) && commands[cmd_id].key?('params')
  params = commands[cmd_id]['params']
  args = ARGV[1..]

  if params.length != args.length
    puts 'Missing params:'
    puts params[args.length..]
    exit 1
  end
end

if ARGV[ARGV.length - 1] == '-n'
  File.readlines("./scripts/#{cmd_id}").drop(1).each do |line|
    puts line unless line.strip.empty?
  end
  exit 1
end

puts cmd_id
