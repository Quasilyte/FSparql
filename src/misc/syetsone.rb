require_relative './Bin'

config = ARGV.detect { |e| e[/-s=|--syntax=/] }
config = config.nil? ? './std/syntax.def' : (config.split '=')[1]

$preprocessor = Preprocessor.new config

if Bin.one_target?
  puts $preprocessor.run_f Bin.next_target
else
  Bin.each_input_filename { |filename|
    puts ($preprocessor.run_f filename) + "##DELIMITER##"
  }
end

