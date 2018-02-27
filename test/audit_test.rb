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

  def test_were_invalid_days_worked
    audit = Audit.new
    company = Company.new
    company.load_employees('./data/employees.csv')
    company.load_projects('./data/projects.csv')
    company.load_timesheets('./data/timesheets.csv')
    audit.load_company(company)
    expected = "Invalid employee ID 3.  Susan Smith worked on More Widgets " + 
                "outside of billing period."

    assert_equal expected, audit.were_invalid_days_worked
  end

  def test_check_employee_id
    audit = Audit.new
    company = Company.new
    company.load_employees('./data/employees.csv')
    company.load_projects('./data/projects.csv')
    company.load_timesheets('./data/timesheets.csv')
    audit.load_company(company)

    assert_equal 'Invalid employee ID 3.', audit.check_employee_id
  end

  def test_check_project_id
    audit = Audit.new
    company = Company.new
    company.load_employees('./data/employees.csv')
    company.load_projects('./data/projects.csv')
    company.load_timesheets('./data/timesheets.csv')
    audit.load_company(company)

    assert_nil audit.check_project_id
  end

  def test_check_billing_dates
    audit = Audit.new
    company = Company.new
    company.load_employees('./data/employees.csv')
    company.load_projects('./data/projects.csv')
    company.load_timesheets('./data/timesheets.csv')
    audit.load_company(company)

    expected = 'Susan Smith worked on More Widgets outside of billing period.'

    assert_equal expected, audit.check_billing_dates
  end

  def test_find_billing_errors
    audit = Audit.new
    company = Company.new
    company.load_employees('./data/employees.csv')
    company.load_projects('./data/projects.csv')
    company.load_timesheets('./data/timesheets.csv')
    audit.load_company(company)

    assert_instance_of Array, audit.find_billing_errors
    assert_instance_of Timesheet, audit.find_billing_errors[0]
  end
end
