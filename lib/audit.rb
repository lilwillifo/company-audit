class Audit
  attr_reader :company
  def initialize
    @company = nil
  end

  def load_company(company)
    @company = company
  end

  def were_invalid_days_worked
    check_employee_id
    #check for wrong project id
    #bill before project start/end
    #weekend
  end

  def check_employee_id
    timesheet_ids = @company.timesheets.map(&:employee_id).uniq
    employees = @company.employees.map(&:employee_id).uniq
    error = timesheet_ids.find_all do |id|
      !employees.include?(id)
    end
    "Invalid employee ID #{error[0]}"
  end
end
