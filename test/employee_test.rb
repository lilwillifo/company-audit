require './test/test_helper'
require './lib/employee'

class EmployeeTest < Minitest::Test
  def test_instantiation
    employee_id = '5'
    name = 'Sally Jackson'
    role = 'Engineer'
    start_date = '2015-01-01'
    end_date = '2018-01-01'
    employee = Employee.new(employee_id, name, role, start_date, end_date)
  end

  def test_attributes
    employee_id = '5'
    name = 'Sally Jackson'
    role = 'Engineer'
    start_date = '2015-01-01'
    end_date = '2018-01-01'
    employee = Employee.new(employee_id, name, role, start_date, end_date)

    assert_equal 5, employee.employee_id
    assert_instance_of Integer, employee.employee_id
    assert_equal 'Sally Jackson', employee.name
    assert_equal 'Engineer', employee.role
    assert_instance_of Date, employee.start_date
    # assert_instance_of Date, employee.end_date
  end
end
