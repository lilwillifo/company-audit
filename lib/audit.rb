class Audit
  attr_reader :company
  def initialize
    @company = nil
  end

  def load_company(company)
    @company = company
  end
end
