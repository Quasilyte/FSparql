class Executor
  include Agent
  require 'net/http'

  def initialize timeout = 30000
    @url = 'http://dbpedia.org/sparql?' + ([
      'default-graph-uri=http://dbpedia.org',
      'format=application/json',
      "timeout=#{timeout}",
      'query='
    ].join '&')

    @formatter = Formatter.new
  end

  def run_s query_s
    generate_json query_remote_exec query_s
  end

private

  def query_remote_exec query_s
    Net::HTTP::get URI::parse URI::encode @url + query_s
  end

  def generate_json resp
    @formatter.run resp
  end
end

