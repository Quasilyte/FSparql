require_relative './Bin'

$executor = Executor.new

Bin.execute stdin: ->() { puts $executor.run_s STDIN.read },
  one_f: ->(f) { puts $executor.run_f f },
  multi_f: ->(f) { puts ($executor.run_f f) + "\n" }