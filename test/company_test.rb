require './test/test_helper'
require './lib/company'

class CompanyTest < Minitest::Test
  def test_it_exists
    company = Company.new
    assert_instance_of Company, company
    assert_equal [], company.employees
    assert_equal [], company.projects
    assert_equal [], company.timesheets
  end
end
