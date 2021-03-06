module Argv
  @@flags = {}

  def merge_flags flags
    @@flags.merge! flags
  end

  def parse_args
    debug_flag = Flag.new 'debug'
    distinct_flag = Flag.new 'distinct'
    limit_flag = Flag.new 'limit', /\d+/
    offset_flag = Flag.new 'offset', /\d+/

    expected_flags = {
      '-D' => debug_flag, '--debug' => debug_flag,
      '-d' => distinct_flag, '--distinct' => distinct_flag,
      '-l' => limit_flag, '--limit' => limit_flag,
      '-o' => offset_flag, '--offset' => offset_flag
    }

    match_against_args expected_flags
  end

  def match_against_args expected_flags
    ARGV.each { |arg|
      keyval = arg.split '='
      keyval[1] = true if keyval[1].nil?

      if expected_flags.key? keyval[0]
        @@flags[(expected_flags[keyval[0]].hash_key keyval).to_sym] = keyval[1]
      end
    }
  end
end