require_relative 'tribe'

class Game
  attr_reader :tribes
  @merge_tribe

  def initialize(tribe1, tribe2)
    @tribes = [tribe1, tribe2]
  end

  def add_tribe(tribe)
    @tribes << tribe
  end

  def immunity_challenge
    loser = @tribes.sample
    puts "Tribe #{loser} loses a round"
    voted_off = loser.members.sample
    loser.members.delete(voted_off)
    puts "#{voted_off} is voted off"
    loser
  end

  def clear_tribes
    @tribes = []
  end

  def merge(new_tribe)
    members = []
    @tribes.each {|tribe| members += tribe.members}
    @merge_tribe = Tribe.new(name: new_tribe, members: members)
  end

  def individual_immunity_challenge
    immune = @merge_tribe.members.sample
    puts "#{immune} wins a round and is immune"
    voted_off = @merge_tribe.tribal_council(immune: immune)
    puts "#{voted_off} is voted off"
  end
end
