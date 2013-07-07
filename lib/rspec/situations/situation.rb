module RSpec::Situations

	class Situation # Simple value-object to respresent a situation
		attr_reader :description, :block

		def initialize( key, description = nil, &block )
			@key         = key
			@description = description || key.to_s
			@block       = block
		end

		def to_s; @description; end
	end

end
