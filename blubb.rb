#!/usr/bin/env ruby
# frozen_string_literal: true

# class String
# def description
# colorize "\e[38;5;28m"
# end

# private

# def colorize(color)
# "#{color}#{self}\e[0m"
# end
# end

# indent = ' ' * 4
# current_name = ''
# File.readlines('./docs/pacman.md').each do |line|
# next if line.strip.empty? || line.start_with?('>')

# if !line.start_with?(indent)
# current_name = line.strip
# else
# puts("\"#{line.strip} #{"\# #{current_name}".description}\"")
# end
# end
# cmd=$(./blubb.rb | fzf --ansi) && echo ${cmd%#*} | xargs
# cmd=$(./blubb.rb | fzf --ansi) && cmd=$(echo ${cmd%#*} | xargs) && $cmd

# def get_command(string_or_hash)
# return string_or_hash if string_or_hash.is_a?(String)

# string_or_hash['cmd']
# end

require 'yaml'
commands = YAML.load_file('some.yaml')

if ARGV[0] == '--list'
  puts commands.keys
  exit 0
end

# Discarded idea descriptions
# if ARGV[0] == '-d' || ARGV[0] == '--descs'
# commands.each_key do |key|
# puts "#{key} -- #{get_command(commands[key]).sub(/\n.*/m, '...')}"
# end
# exit 0
# end

cmd_id = ARGV[0]

unless commands.key?(cmd_id)
  puts "Unknown script #{cmd_id}"
  exit 1
end

if commands[cmd_id].is_a?(String)
  if ARGV[1] == '-h'
    puts "No help for #{cmd_id}"
    exit 1
  end
  puts(commands[cmd_id])
  exit 1 if ARGV[ARGV.length - 1] == '-n'
  exit 0
end

cmd = commands[cmd_id]['cmd']

if ARGV[1] == '-h'
  puts(commands[cmd_id].key?('help') ? commands[cmd_id]['help'] : "No help for #{cmd_id}")
  exit 1
end

if commands[cmd_id].key?('params')
  params = commands[cmd_id]['params']
  args = ARGV[1..]

  if params.length != args.length
    puts 'Missing params:'
    puts params[args.length..]
    exit 1
  end

  params.each_with_index do |_param, index|
    cmd.sub!("$#{index + 1}", args[index])
  end
end

puts cmd
exit 1 if ARGV[ARGV.length - 1] == '-n'
