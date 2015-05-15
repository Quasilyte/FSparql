require_relative '../inc'

class Bin
  @@input_filenames = ARGV.select { |arg| arg[0] != ?- }

  def self.execute handlers
    if nil_targets?
      handlers[:stdin].()
    elsif one_target?
      handlers[:one_f].(next_target)
    else
      Bin.each_input_filename { |filename|
        handlers[:multi_f].(filename)
      }
    end
  end

  def self.nil_targets?
    @@input_filenames.length == 0
  end

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
