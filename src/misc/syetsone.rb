require_relative './utils'

config = ARGV.detect { |e| e[/-s=|--syntax=/] }
config = config.nil? ? './std/syntax.def' : (config.split '=')[1]

$preprocessor = Preprocessor.new config

each_input_filename { |filename|
  puts ($preprocessor.run_f filename) + "##DELIMITER##"
}