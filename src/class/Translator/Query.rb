class Query
  def initialize
    @inc_cols = []
  end

  def select_extend val
    @inc_cols << "?#{val}"
  end

  def build
    %Q(
      SELECT #{@inc_cols.join ', '} {

    )
  end
end