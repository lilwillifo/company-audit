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

    expected = {success: true, error: nil}
    assert_equal expected, company.load_employees('./data/employees.csv')
  end
end

#### company.load_employees(filename)

# - Parameters: String
# - Returns: Hash
#
# Read all data from `filename` in CSV format.
#Only add its contents to `company.employees` if ALL data in the file is valid.
#If any data is invalid, you should immediately return an error INSTEAD of saving the data.
#A test file for bad employee data has been provided.
