# Contains everything needed to generate Sparql query.
module Query
  # Overall catch.
  @@fetch_cols = []

  # What we are returning from the query (SELECT clause)?
  @@inc_prop_syms = []

  # Lines for OPTIONAL clause.
  @@opt_cols = []

  # Lines for FILTER applications.
  @@filters = []
end