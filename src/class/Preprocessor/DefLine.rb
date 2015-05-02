class DefLine
  def initialize line
    parts = /\((.*)\)\s?(.*)/.match line

    abort "invalid config line: #{line}" if parts.nil?

    @in = regexp_build parts[1]

    @out = parts[2]
    @slots = []

    compilate
  end

  def regexp_build pattern
    pattern.gsub!(/[\[\]\{\}\^\\\?\-\+\*\.\!\|\&\<\>]/) { |m| '\\' + m}
    (pattern.include? ' ') ? pattern : '\b' + pattern + '\b'
  end

  def compilate
    @in.gsub!(/\$[\w\-]+/) { |var|
      if (idx = @slots.index var).nil?
        @slots.push var

        '([\w\-]+)'
      else
        "\\#{idx+1}"
      end
    }

    @in = Regexp.new @in
  end

  def expand rawLine
    rawLine.gsub(@in) { |newLine|
      if (vals = @in.match newLine)
        newLine = @out.dup

        vals[1..-1].each_with_index { |val, idx|
          newLine.gsub! @slots[idx], val
        }

        newLine
      else
        rawLine
      end
    }
  end

  attr_accessor :in, :out
end