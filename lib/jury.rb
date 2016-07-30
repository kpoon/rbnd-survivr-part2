class Jury
	attr_accessor :members

	def initialize
		@members = []
	end	

	def add_member(member)
		@members << member
	end	

	def cast_votes(finalists)
		jury_vote = Hash.new(0)
		@members.each do |member|
			finalist = finalists.sample
			jury_vote[finalist] += 1
			puts "#{member.to_s.capitalize} cast their vote for #{finalist.to_s.capitalize}."
		end	
  		return jury_vote
	end	

	def report_votes(final_votes)
		final_votes.each do |key, value|
			puts key.name.capitalize + ' received ' + value.to_s + ' votes.'
		end	
	end	

	def announce_winner(final_votes)
		winner = final_votes.max_by{|k, v| v}[0]
		puts "The winner is #{winner.to_s.capitalize}!"
	end	
end

