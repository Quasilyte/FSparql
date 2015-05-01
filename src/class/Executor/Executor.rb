class Executor
  require 'net/http'

  def initialize
    @db_url = 'http://dbpedia.org/sparql'
    @default_params = '&format=application/json&timeout=30000'
  end

  def run filename
    @buf = IO.read filename

    inquiry_db
  end

  def generate_url
    url = @db_url
    url << '?default-graph-uri=http://dbpedia.org'
    url << '&query=' << @buf
    url << @default_params
  end

  def inquiry_db
    # url = URI.parse URI::encode generate_url

    # resp = Net::HTTP.get(url)
    # puts resp
    generate_json
  end

  def generate_json
    (Formatter.new).run IO.read './resp.json'
    # @in = (JSON.parse )['results']['bindings']
    # @structure = @in[0].keys
    # puts @structure
  end
end

