require 'colorizr'
require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

#After your tests pass, uncomment this code below
#=========================================================
# Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!

# Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))

# Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
	# 20 contestants divided into 2 tribes
	# 8 challenges in an "immunity challenge"
	# one contestant from losing tribe is eliminated after every challenge "Tribal Council"
	# 12 contestants remains at the end
	# merge together to form new tribe
	puts "Phase 1 of game".blue
	8.times do 
		losing_tribe = @borneo.immunity_challenge
		puts "Tribe #{losing_tribe.to_s.red} lost the Immunity Challenge."
		eliminate_contestant = losing_tribe.tribal_council
	end
end

def phase_two
	# merge tribe of 12 contestants	
	# 3 challenges in an "immunity challenge"
	# each challenge there is an immune contestant
	# each challenge removes a contestant
	# 9 contestants remains at the end
	puts "Phase 2 of game".blue
	3.times do
		immune_contestant = @borneo.individual_immunity_challenge
		eliminate_contestant = @merge_tribe.tribal_council({immune: immune_contestant})
	end	
end

def phase_three
	# 7 challenges
	# each challenge there is an immune contestant
	# each challenge removes a contestant that becomes a jury
	# 7 contestants becomes Jury and 2 contestants remains
	# Jury votes for the 2 contestants to determine winner
	puts "Phase 3 of game".blue
	7.times do
		immune_contestant = @borneo.individual_immunity_challenge
		eliminate_contestant = @merge_tribe.tribal_council({immune: immune_contestant})
		@jury.add_member(eliminate_contestant)
	end
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
@jury.announce_winner(vote_results) #Jury announces final winner
