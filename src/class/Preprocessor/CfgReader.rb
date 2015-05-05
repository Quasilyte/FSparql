class CfgReader
  def initialize filename
    @buf = IO.read filename
  end

  def each_cfg_line
    @buf.each_line { |line|
      yield CfgLine.new line.strip unless comment_line? line
    }
  end

private

  def comment_line? line
    line[/\S/] != ?(
  end
end