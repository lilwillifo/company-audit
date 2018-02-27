class Employee
  attr_reader :employee_id,
              :name,
              :role,
              :start_date,
              :end_date
  def initialize(employee_id, name, role, start_date, end_date)
    @employee_id = employee_id.to_i
    @name = name
    @role = role
    start_year = start_date.split('-')[0].to_i
    start_month = start_date.split('-')[1].to_i
    start_day = start_date.split('-')[2].to_i
    @start_date = Date.new(start_year, start_month, start_day)
    # @end_date = Date.new(end_date)
  end
end
