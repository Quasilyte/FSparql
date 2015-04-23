class DefLine
  def initialize line
    parts = /\((.*)\)\s?(.*)/.match line

    @in, @out = parts[1], parts[2]
    @swp = ''
    @slots = []

    compilate
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
        newLine = @out

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