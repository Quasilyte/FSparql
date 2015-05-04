require './src/inc'
require './src/FSparql'
require './test/testkit'

$api = FSparql.new './std/syntax.def'

launch_test 'preprocessor',
  i_filename: './test/in.fsparql',
  o_filename: './test/preprocessor/result.txt'


launch_test 'translator',
  i_filename: './test/preprocessor/result.txt',
  o_filename: './test/translator/result.txt',
  flags: {limit: 3, offset: 1}

launch_test 'executor',
  i_filename: './test/translator/result.txt',
  o_filename: './test/executor/result.txt'

puts 'all tests passed'