$LOAD_PATH.unshift File.expand_path( '../lib', __FILE__ )
require 'rspec/situations/version'


Gem::Specification.new do |s|
	s.name          = 'rspec-situations'
	s.summary       = 'Situations for chained Rspec conditions'
	s.description   = 'Adds a super simple method to describe RSpec situations in terms of smaller situation blocks.'
	s.version       =  RSpec::Situations::VERSION
	s.date          = '2013-07-04'
	s.homepage      = 'http://www.dablweb.com'
	s.authors       = [ 'Brett Richardson' ]
	s.email         = [ 'Brett.Richardson.NZ@gmail.com' ]
	s.require_path  =  'lib'
	s.files         = Dir.glob( 'lib/**/*' ) + %w{ Gemfile Guardfile MIT-LICENSE README.md }

	s.add_dependency 'rspec'

	s.add_development_dependency 'bundler'
	s.add_development_dependency 'rake'
	s.add_development_dependency 'guard'
	s.add_development_dependency 'guard-rspec'
	s.add_development_dependency 'growl'
end
