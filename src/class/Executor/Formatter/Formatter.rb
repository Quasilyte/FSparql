class Formatter
  require 'json'

  def run json_s
    @out = []
    @in = (JSON.parse json_s)['results']['bindings']

    @in.each { |json_hash|
      collect_hash json_hash
    }

    @out.to_json
  end

private

  def collect_hash json_hash
    proto = {}
    json_hash.each { |json_prop|
      json_recur_walk (Keyval.new json_prop), proto
    }

    @out << proto
  end

  def json_recur_walk keyval, proto
    return if keyval.k_empty?

    key = keyval.k_shift
    proto[key] = (keyval.k_empty? ? keyval.val : {}) unless proto.key? key

    json_recur_walk keyval, proto[key]
  end
end