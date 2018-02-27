require './test/test_helper'
require './lib/employee'

class EmployeeTest < Minitest::Test
  def test_instantiation
    employee = Employee.new
  end

  def test_attributes
  end
end
