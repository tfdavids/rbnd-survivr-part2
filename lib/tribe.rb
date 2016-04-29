require 'colorizr'

class Tribe
  attr_reader :name, :members, :color

  def initialize(options)
    @color = String.colors.sample
    @name = options[:name].send(@color) || ""
    @members = options[:members] || []
    puts "Created tribe #{self}"
  end

  def to_s
    @name
  end

  def tribal_council(options)
    members_except_immune = @members.reject{|member| member == options[:immune]}
    eliminated_member = members_except_immune.sample
    @members.delete(eliminated_member)
    eliminated_member
  end
end
