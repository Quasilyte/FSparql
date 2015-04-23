class Conv
  def self.pattern_esc input
    input.gsub(/[\?\-\+\*\.\!]/) { |m|
      '\\' + m
    }
  end
end