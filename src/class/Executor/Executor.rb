class Executor
  require 'net/http'

  def initialize
    @formatter = Formatter.new

    @db_url = 'http://dbpedia.org/sparql'
    @default_params = '&format=application/json&timeout=30000'
  end

  def run sparql
    @sparql = sparql

    inquiry_db
  end

  def generate_url
    url = @db_url
    url << '?default-graph-uri=http://dbpedia.org'
    url << '&query=' << @sparql
    url << @default_params
  end

  def query_remote_exec
    url = URI.parse URI::encode generate_url
    Net::HTTP.get(url)
  end

  def inquiry_db
    generate_json query_remote_exec
  end

  def generate_json resp
    @formatter.run resp
  end
end

