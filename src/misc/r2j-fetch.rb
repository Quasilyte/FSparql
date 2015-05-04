require_relative './Bin'

$executor = Executor.new

if Bin.one_target?
  puts $executor.run_f Bin.next_target
else
  Bin.each_input_filename { |filename|
    puts ($executor.run_f filename) + "\n"
  }
end