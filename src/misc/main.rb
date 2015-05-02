require_relative '../FSparql'
require_relative './utils'

$api = FSparql.new './std/syntax.def'

each_input_filename { |filename|
  puts $api.executor.run_s(
    $api.translator.run_s(
      $api.preprocessor.run_f filename
    )
  ) + "\n"
}
