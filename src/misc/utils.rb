require_relative '../inc'

def each_input_filename
  input_filenames = ARGV.select { |arg| arg[0] != ?- }

  input_filenames.each { |filename|
    yield filename
  }
end