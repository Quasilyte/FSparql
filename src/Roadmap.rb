require_relative './Keyval'
class Roadmap
  def initialize hash
    @proto = {}
    @path = []

    generate_proto hash
    puts @path
    # puts @proto.inspect
  end

  # Should be called only once. Consequent hashes should be cloned from proto.
  def generate_proto hash
    hash.each { |keyval|
      @path << keyval[0]
      recur_walk Keyval.new keyval
    }
  end

  def decode_hash hash

  end

  # Walk input hash recursively to build prototype of required format.
  def recur_walk keyval, proto = @proto
    return if keyval.k_empty?

    key = keyval.k_shift
    proto[key] = (keyval.k_empty? ? keyval.val : {}) unless proto.has_key? key

    recur_walk keyval, proto[key]
  end
end