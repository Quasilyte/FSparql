class Conv
  def self.purge input
    (input.sub /\#.*/, '').strip
  end

  def self.pattern_esc input
    input.gsub(/[\[\]\{\}\^\\\?\-\+\*\.\!\|\&\<\>]/) { |m|
      '\\' + m
    }
  end
end