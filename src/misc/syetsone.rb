require_relative './Bin'

config = ARGV.detect { |e| e[/-s=|--syntax=/] }

if config.nil?
  config = "#{ENV['FSPARQL_HOME']}/std/syntax.def"
else
  config = (config.split '=')[1]
end

$preprocessor = Preprocessor.new config

if Bin.one_target?
  puts $preprocessor.run_f Bin.next_target
else
  Bin.each_input_filename { |filename|
    puts ($preprocessor.run_f filename) + "##DELIMITER##"
  }
end

