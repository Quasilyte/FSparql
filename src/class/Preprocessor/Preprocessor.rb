class Preprocessor
  def initialize filename
    @buf = IO.read(filename)
    @defLines = []

    @buf.each_line { |line|
      @defLines.push(DefLine.new line)
    }
  end

  def run filename
    @buf = IO.read(filename)
    @buf << "\n" unless @buf[-1] == ?\n

    lineByline

    puts @buf
  end

private

  def lineByline
    @defLines.each { |defLine|
      @buf.gsub!(/.*\n/) { |rawLine|
        defLine.expand rawLine
      }
    }
  end
end