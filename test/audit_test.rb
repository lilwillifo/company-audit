require './test/test_helper'
require './lib/audit'

class AuditTest < Minitest::Test
  def test_it_exists
    audit = Audit.new
    assert_instance_of Audit, audit
  end

  def test_it_can_load_a_company
    audit = Audit.new
    assert_nil audit.company

    company = Company.new

    company.load_employees('./data/employees.csv')
    company.load_projects('./data/projects.csv')
    company.load_timesheets('./data/timesheets.csv')

    assert_equal company, audit.load_company(company)
    assert_equal company, audit.company
  end
end
