require_relative './utils'

$translator = Translator.new

each_input_filename { |filename|
  puts ($translator.run_f filename) + "\n##DELIMITER##"
}