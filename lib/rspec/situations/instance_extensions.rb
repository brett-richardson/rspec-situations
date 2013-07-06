module RSpec::Situations::InstanceExtensions

	# Generate a string for describe_situation call
	def _rsits_describe_name
		self.class._rsits_describe_name
	end


	# Get an array of situations (from the combined hash) depending on the keys we provide
	def _rsits( *keys ) # Go up the example parents and get the situations requested, whereever they may be defined
		_rsits_combined_hash.select do |key, _|
			keys.include? key # Then filter out only the keys we are using
		end.map{ |_, situation| situation } # Now return an array of situations instead of a hash
	end


	# ===========================================================================
		private
	# ===========================================================================


	# A hash of the current context, merged with parent contexts
	def _rsits_combined_hash
		self.class.instance_variable_get(
			:@parent_groups # For each item in @parent_groups
		).reduce( {} ) do |final, pg|
			final.merge pg._rsits # Merge the _rsits hash into 'final'
		end
	end

end
