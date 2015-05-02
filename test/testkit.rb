def check_result unit
  out_lines = (IO.read "./test/#{unit}/result.txt").split "\n"
  expected_out_lines = (IO.read "./test/#{unit}/expected.txt").split "\n"

  for line_no in 0..(out_lines.length)
    if out_lines[line_no] != expected_out_lines[line_no]
      puts "#{unit} has output mismatch at line #{line_no+1}!"
      puts "'#{out_lines[line_no]}'"
      puts "\tnot equal to"
      abort "'#{expected_out_lines[line_no]}'"
    end
  end

  puts "#{unit}: ok."
end

def launch_test agent, args
  $api.send agent + '_run', args
  check_result agent
end