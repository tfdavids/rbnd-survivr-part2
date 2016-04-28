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
    loser.members.delete(loser.members.sample)
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
    @merge_tribe.members.delete(@merge_tribe.members.sample)
  end
end
