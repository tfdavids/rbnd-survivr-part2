class Jury
  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member(member)
    @members << member
  end

  def cast_votes(finalists)
    h = Hash.new
    finalists.each do |finalist|
      h[finalist] = 0
    end
    @members.each do |member|
      vote = finalists.sample
      puts "#{member} votes for #{vote}"
      h[vote] += 1
    end
    h
  end

  def report_votes(votes)
    votes.each do |finalist, score|
      puts "#{finalist} received #{score} votes"
    end
  end

  def announce_winner(votes)
    winner = votes.max_by{|k,v| v}[0]
    puts "#{winner} is the winner!"
    winner
  end
end
