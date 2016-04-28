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
    @tribes.sample
  end

  def clear_tribes
    @tribes = []
  end

  def merge(new_tribe)
    members = []
    @tribes.each {|tribe| members += tribe.members}
    Tribe.new(name: new_tribe, members: members)
  end

  def individual_immunity_challenge
    return @tribes.sample.members.sample
  end
end
