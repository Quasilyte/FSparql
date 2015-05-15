require_relative './Bin'

config = ARGV.detect { |e| e[/-s=|--syntax=/] }

if config.nil?
  config = "#{ENV['FSPARQL_HOME']}/std/syntax.def"
else
  config = (config.split '=')[1]
end

$preprocessor = Preprocessor.new config

Bin.execute stdin: ->() { puts $preprocessor.run_s STDIN.read },
  one_f: ->(f) { puts $preprocessor.run_f f },
  multi_f: ->(f) { puts ($preprocessor.run_f f) + "##DELIMITER##" }
