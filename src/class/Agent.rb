module Agent
  def run_f filename
    # Module wrapping class must define run_s method.
    run_s IO.read filename
  end
end