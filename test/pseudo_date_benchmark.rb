require 'rubygems'
require 'benchmark'
require '../lib/pseudo_date'
include Benchmark

bm do |bench|
  bench.report('null         ') { 1000.times { |i| i } }
  bench.report('19850625     ') { 1000.times { PseudoDate.new('19850625') } }
  bench.report('1985-25-06   ') { 1000.times { PseudoDate.new('1985-25-06') } }
  bench.report('06-25-1985   ') { 1000.times { PseudoDate.new('06-25-1985') } }
  bench.report('25-06-1985   ') { 1000.times { PseudoDate.new('25-06-1985') } }
  bench.report('06/25/1985   ') { 1000.times { PseudoDate.new('06/25/1985') } }
  bench.report('06/1985      ') { 1000.times { PseudoDate.new('06/1985') } }
  bench.report('85           ') { 1000.times { PseudoDate.new('85') } }
  bench.report('1985         ') { 1000.times { PseudoDate.new('1985') } }
  bench.report('Jun 25, 1985 ') { 1000.times { PseudoDate.new('Jun 25, 1985') } }
end