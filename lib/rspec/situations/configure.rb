require 'rspec'

RSpec.configure do |c|
  c.extend  RSpec::Situations::ClassExtensions
  c.include RSpec::Situations::InstanceExtensions
end
