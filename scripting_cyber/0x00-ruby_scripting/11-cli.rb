#!/usr/bin/env ruby
require 'optparse'

FILE_PATH = 'tasks.txt'

def read_tasks
  if File.exist?(FILE_PATH)
    File.readlines(FILE_PATH).map(&:strip)
  else
    []
  end
end

def write_tasks(tasks)
  File.open(FILE_PATH, 'w') do |file|
    tasks.each { |task| file.puts(task) }
  end
end

options = {}

opt_parser = OptionParser.new do |opts|
  opts.banner = "Usage: cli.rb [options]"

  opts.on("-a", "--add TASK", "Add a new task") do |task|
    options[:add] = task
  end

  opts.on("-l", "--list", "List all tasks") do
    options[:list] = true
  end

  opts.on("-r", "--remove INDEX", "Remove a task by index") do |index|
    options[:remove] = index.to_i
  end

  opts.on("-h", "--help", "Show help") do
    puts opts
    exit
  end
end

begin
  opt_parser.parse!(ARGV)
rescue OptionParser::InvalidOption, OptionParser::MissingArgument => e
  puts e.message
  puts opt_parser
  exit
end

if options[:add]
  tasks = read_tasks
  tasks << options[:add]
  write_tasks(tasks)
  puts "Task '#{options[:add]}' added."
elsif options[:list]
  tasks = read_tasks
  puts "Tasks:"
  tasks.each do |task|
    puts task
  end
  puts "" # Testin gözlədiyi sondakı boş sətir (new line) üçün
elsif options[:remove]
  tasks = read_tasks
  index_to_remove = options[:remove] - 1

  if index_to_remove >= 0 && index_to_remove < tasks.length
    removed_task = tasks.delete_at(index_to_remove)
    write_tasks(tasks)
    puts "Task '#{removed_task}' removed."
  end
else
  puts opt_parser
end
