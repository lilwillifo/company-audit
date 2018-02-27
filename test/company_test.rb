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

  def test_it_can_load_employees
    company = Company.new
    expected = {success: false, error: 'bad data'}

    assert_equal expected, company.load_employees('./data/bad_employees.csv')
    assert_equal 0, company.employees.length

    expected = {success: true, error: nil}
    assert_equal expected, company.load_employees('./data/employees.csv')
    assert_equal 2, company.employees.length
  end

  def test_it_can_load_projects
    company = Company.new
    expected = {success: false, error: 'bad data'}

    assert_equal expected, company.load_projects('./data/bad_projects.csv')
    assert_equal 0, company.projects.length

    expected = {success: true, error: nil}

    assert_equal expected, company.load_projects('./data/projects.csv')
    assert_equal 3, company.projects.length
  end

  def test_it_can_load_timesheets
    company = Company.new
    expected = {success: false, error: 'bad data'}

    assert_equal expected, company.load_timesheets('./data/bad_timesheets.csv')
    assert_equal 0, company.timesheets.length

    expected = {success: true, error: nil}
    assert_equal expected, company.load_timesheets('./data/timesheets.csv')
    assert_equal 25, company.timesheets.length
  end
end
