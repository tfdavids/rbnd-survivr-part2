require 'colorizr'

class Tribe
  attr_reader :name, :members
  @color

  def initialize(options)
    @name = options[:name] || ""
    @members = options[:members] || []
    @color = String.colors.sample
    puts "Created tribe #{self}"
  end

  def to_s
    @name.send(@color)
  end

  def tribal_council(options)
    immune = options[:immune]
    @members.shuffle!
    member = @members[0] == immune ? @members[1] : @members[0]
    @members.delete(member)
    member
  end
end
