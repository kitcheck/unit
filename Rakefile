require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = "test/*_test.rb"
end

namespace :build do
  desc "Generate Lexer"
  task :lexer do
    `rex lib/unit/lexer_definition.rex -o lib/unit/lexer.rb`
  end

  desc "Generate Parser"
  task :parser => :lexer do
    `racc lib/unit/parser_definition.y -o lib/unit/parser.rb`
  end
end
