class Preprocessor
  include Agent

  def initialize filename
    @buf = IO.read filename
    @defLines = []

    @buf.each_line { |line|
      line = Conv.purge line

      @defLines.push(DefLine.new (Conv.purge line)) unless line == ""
    }
  end

  def run_s buf
    @buf = buf
    @buf << "\n" unless @buf[-1] == ?\n

    line_by_line

    @buf
  end

private

  def line_by_line
    @defLines.each { |defLine|
      @buf.gsub!(/.*\n/) { |rawLine|
        defLine.expand rawLine
      }
    }
  end
end