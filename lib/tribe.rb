class Tribe
  attr_reader :name, :members

  def initialize(options)
    @name = options[:name] || ""
    @members = options[:members] || []
    puts "Created tribe #{self}"
  end

  def to_s
    @name
  end

  def tribal_council(options)
    immune = options[:immune]
    @members.shuffle!
    member = @members[0] == immune ? @members[1] : @members[0]
    @members.delete(member)
    member
  end
end
