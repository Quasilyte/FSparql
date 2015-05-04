require_relative './Bin'

$translator = Translator.new

if Bin.one_target?
  puts $translator.run_f Bin.next_target
else
  Bin.each_input_filename { |filename|
    puts ($translator.run_f filename) + "\n##DELIMITER##"
  }
end