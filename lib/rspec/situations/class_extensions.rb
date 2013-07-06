require 'rspec/situations/situation'

module RSpec::Situations
	module ClassExtensions

		# Public API method for defining a situation
		def situation( key, description = nil, &block ) # RSpec extention method to add a Situation object to the hash cache
			_rsits_hash[key] = Situation.new( key, description, &block )
		end


		# Public API method for describing a set of situations
		def describe_situation( *keys, &block ) # Describe and invoke all relevant situations
			if keys.last.kind_of? String # If the last argument is a string
				description = keys.last # Use it as the description
				keys = keys[0..-1]
			else
				description = _rsits_describe_name *keys # Otherwise, generate a description
			end

			describe description do
				before do
					_rsits( *keys ).each do |situation| # For each situation we request,
						example.instance_eval &situation.block # Execute its block in the context of an example
					end
				end

				instance_eval &block # Execute the describe block in the current context
			end
		end


		# Get situations defined by the given keys
		def _rsits( *keys ) # Array of all situation objects pertaining to current context
			if keys.length > 0
				_rsits_combined_hash.select{ |k,v| keys.include? k }
			else
				_rsits_combined_hash
			end
		end


		# Combine each situation's description into a string
		def _rsits_describe_name( *keys )
			'when ' + _rsits( *keys ).map{ |k,v| v.description }.join( ' and ' )
		end


		# ========================================================================
			private
		# ========================================================================


		def _rsits_combined_hash
			_rsits_hash # TODO: Combine with parents, not needed until you want parent and local situations to interact directly with each other.
		end


		# Getter / setter for the hash that stores all our situations
		def _rsits_hash # Cache by key of all situations in the current describe/context block.
			@_rsits_hash ||= {}
		end

	end
end
