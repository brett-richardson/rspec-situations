Gem::Specification.new do |s|
	s.name        = 'rspec-situations'
	s.summary     = 'Situations for chained Rspec conditions'
	s.description = ''
	s.version     = '0.0.1'
	s.date        = '2013-07-04'
	s.homepage    = 'http://www.dablweb.com'
	s.authors     = [ 'Brett Richardson' ]
	s.email       = [ 'Brett.Richardson.NZ@gmail.com' ]
	s.files       = [ 'lib/situations.rb' ]

	s.add_dependency 'rspec'

	s.add_development_dependency 'bundler'
	s.add_development_dependency 'rake'
end
