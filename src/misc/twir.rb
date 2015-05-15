require_relative './Bin'

$translator = Translator.new

Bin.execute stdin: ->() { puts $translator.run_s STDIN.read },
  one_f: ->(f) { puts $translator.run_f f },
  multi_f: ->(f) { puts ($translator.run_f f) + "\n##DELIMITER##" }