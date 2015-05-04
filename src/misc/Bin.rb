require_relative '../inc'

class Bin
  @@input_filenames = ARGV.select { |arg| arg[0] != ?- }

  def self.one_target?
    @@input_filenames.length == 1
  end

  def self.next_target
    @@input_filenames.shift
  end

  def self.each_input_filename
    @@input_filenames.each { |filename|
      yield filename
    }
  end
end
