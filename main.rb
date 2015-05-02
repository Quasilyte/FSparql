require './src/FSparql'

$api = FSparql.new './std/syntax.def'

input_filenames = ARGV.select { |arg| arg[0] != ?- }

input_filenames.each { |filename|
  puts $api.executor.run_s(
    $api.translator.run_s(
      $api.preprocessor.run_f filename
    )
  ) + "\n"
}