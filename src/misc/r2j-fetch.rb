require_relative './utils'

$executor = Executor.new

each_input_filename { |filename|
  puts ($executor.run_f filename) + "\n"
}