require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('pseudo_date', '0.1.0') do |p|
  p.description = 'Date parser and container for partial or incomplete dates.'
  p.url = 'http://github.com/PatrickTulskie/pseudo_date'
  p.author = 'Patrick Tulskie'
  p.email = 'PatrickTulskie@gmail.com'
  p.ignore_pattern = ['tmp/*', 'script/*', 'lib/main.rb']
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }