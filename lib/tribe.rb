class Tribe
	attr_accessor :name, :members

	def initialize(options={})
		@name = options[:name]
		@members = options[:members]

		puts "#{@name} tribe."
	end	

	def to_s
		@name
	end

  def tribal_council(options={})
    #one memeber is immune
    immune = options[:immune]
    #need to vote one person off (randomly) but keep immune member
    voted_off_list = @members.select {|member| member != immune}
    voted_off = voted_off_list.sample
    @members.delete(voted_off)
    puts "#{voted_off.to_s.capitalize} got eliminated!"
    return voted_off
  end
end