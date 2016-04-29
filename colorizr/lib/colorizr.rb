class String
  @@colors = {'red' => 31, 'green' => 32, 'yellow' => 33, 'blue' => 34,
    'pink' => 35, 'light_blue' => 36, 'white' => 97, 'light_grey' => 37,
    'black' => 30}
  def self.create_colors
    @@colors.each do |color, value|
      self.send(:define_method, "#{color}") do
        return "\e[#{value}m#{self}\e[0m"
      end
    end
  end
  def self.colors
    @@colors.keys
  end
  def self.sample_colors
    self.create_colors
    s = ''
    @@colors.each do |color, _|
      s += "This is " + "#{color}\n".send(color)
    end
    return s
  end
end

String.create_colors
