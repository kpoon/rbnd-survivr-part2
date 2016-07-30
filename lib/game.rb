class Game
	attr_reader :tribes

	def initialize(*tribes)
		@tribes = tribes
	end	

	def add_tribe(tribe)
		@tribes.push tribe
	end	

	def immunity_challenge
		@tribes.sample
	end

	def clear_tribes
		@tribes.clear
	end	

	def merge(new_tribe_name)
		# merge members of tribe 1 and tribe 2
		merge_members = @tribes.first.members + @tribes.last.members
		# delete tribes
		clear_tribes
		# create new tribe with new_tribe_name and combined members
		new_tribe = Tribe.new({name: new_tribe_name, members: merge_members})
		add_tribe(new_tribe)
		return @tribes.first
	end

	def individual_immunity_challenge
		# test a random member to make sure they are an instance of contestant
		immunity_challenge.members.sample
	end	

end