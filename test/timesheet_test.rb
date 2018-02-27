require './test/test_helper'
require './lib/timesheet'

class TimesheetTest < Minitest::Test
  def test_it_exists
    employee_id = '5'
    project_id = '7'
    date = '2015-01-01'
    minutes = '120'
    timesheet = Timesheet.new(employee_id, project_id, date, minutes)

    assert_instance_of Timesheet, timesheet
  end

  def test_attributes
    employee_id = '5'
    project_id = '7'
    date = '2015-01-01'
    minutes = '120'
    timesheet = Timesheet.new(employee_id, project_id, date, minutes)

    assert_equal 5, timesheet.employee_id
    assert_equal 7, timesheet.project_id
    assert_instance_of Date, timesheet.date
    assert_equal 120, timesheet.minutes
  end
end
