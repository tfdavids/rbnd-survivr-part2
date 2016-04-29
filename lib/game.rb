require_relative 'tribe'

class Game
  attr_reader :tribes

  def initialize(tribe1, tribe2)
    @tribes = [tribe1, tribe2]
  end

  def add_tribe(tribe)
    @tribes << tribe
  end

  def immunity_challenge
    loser = @tribes.sample
    puts "Tribe #{loser} loses a round"
    voted_off = loser.tribal_council(options: nil)
    puts "#{voted_off} is voted off"
    loser
  end

  def clear_tribes
    @tribes = []
  end

  def merge(new_tribe)
    members = []
    @tribes.each {|tribe| members += tribe.members}
    clear_tribes
    add_tribe(Tribe.new(name: new_tribe, members: members))
    @tribes.first
  end

  def individual_immunity_challenge
    immune = @tribes.first.members.sample
    puts "#{immune} wins a round and is immune"
    voted_off = @tribes.first.tribal_council(immune: immune)
    puts "#{voted_off} is voted off"
    voted_off
  end
end
