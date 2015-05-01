class Formatter
  require 'json'

  def initialize
    @out = []
  end

  def each_json_keyval json_hash
    json_hash.each { |keyval|
      @keyval = keyval

      yield keyval
    }
  end

  def run json_s
    @in = (JSON.parse json_s)['results']['bindings']

    @in.each { |json_hash|
      each_json_keyval(json_hash) { |keyval|
        puts keyval.inspect
      }
      puts '-------'
    }
  end

  # def r_dive keyval,
  # end
end

# lang__name
# lang__year
# lang__author__name
# lang__author__depiction

# [
#   {
#     "lang": {
#       "name", "year",
#       "author": {
#         "name", "depiction"
#       }
#     }
#   }
# ]