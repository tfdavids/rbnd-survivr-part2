class Jury
  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member(member)
    @members << member
  end

  def cast_votes(finalists)
    votes = Hash.new
    finalists.each do |finalist|
      votes[finalist] = 0
    end
    @members.each do |member|
      vote = finalists.sample
      puts "#{member} votes for #{vote}"
      votes[vote] += 1
    end
    votes
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
