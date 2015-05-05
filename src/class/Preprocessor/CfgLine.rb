class CfgLine < Inout
  def initialize line
    parts = /\((.*)\)\s?(.*)/.match line

    abort "invalid config line: #{line}" if parts.nil?

    @in, @out = (regexp_build parts[1]), parts[2]
  end

private

  def regexp_build pattern
    pattern.gsub!(/[\(\)\[\]\{\}\^\\\?\-\+\*\.\!\|\&\<\>]/) { |m| '\\' + m}
    pattern[/[^\w\-]/] ? pattern : '\b' + pattern + '\b'
  end
end