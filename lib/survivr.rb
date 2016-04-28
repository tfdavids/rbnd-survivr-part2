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
  num_eliminations = 0
  while num_eliminations < 8 do
    @borneo.immunity_challenge
    num_eliminations += 1
  end
  num_eliminations
end

def phase_two
  num_eliminations = 0
  while num_eliminations < 3 do
    @borneo.individual_immunity_challenge
    num_eliminations += 1
  end
  num_eliminations
end

def phase_three
  while @jury.members.length < 7 do
    immune = @merge_tribe.members.sample
    puts "#{immune} wins a round and is immune"
    voted_off = @merge_tribe.tribal_council(immune: immune)
    puts "#{voted_off} is voted off and joins the jury"
    @jury.add_member(voted_off)
  end
  @jury.members.length
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
