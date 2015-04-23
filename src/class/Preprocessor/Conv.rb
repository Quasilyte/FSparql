class Conv
  def self.purge input
    (input.sub /\#.*/, '').strip
  end

  def self.add_word_boundary input
    input[0] = '\b' if input[0] == ?(
    input[-1] = '\b' if input[-1] == ?)

    input
  end

  def self.pattern_esc input
    input.gsub(/[\[\]\{\}\^\\\?\-\+\*\.\!\|\&\<\>]/) { |m|
      '\\' + m
    }
  end
end