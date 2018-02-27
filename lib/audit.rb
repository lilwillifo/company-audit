require './modules/date_handler'
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
    check_project_id
    check_billing_dates
    checK_weekend_work
  end

  def check_employee_id
    timesheet_ids = @company.timesheets.map(&:employee_id).uniq
    employees = @company.employees.map(&:employee_id).uniq
    error = timesheet_ids.find_all do |id|
      !employees.include?(id)
    end
    "Invalid employee ID #{error[0]}" unless error.empty?
  end

  def check_project_id
    timesheet_ids = @company.timesheets.map(&:project_id).uniq
    projects = @company.projects.map(&:project_id).uniq
    error = timesheet_ids.find_all do |id|
      !projects.include?(id)
    end
    "Invalid project ID #{error[0]}" unless error.empty?
  end

  # def check_billing_dates
  #   @company.timesheets.map do |timesheet|
  #     project = @company.find_project_by_id(timesheet.project_id)
  #     start_date = project.start_date
  #     end_date = project.end_date
  #     bill_date = timesheet.date
  #     dh = DateHandler::DHDate(bill_date)
  #     dh.date_between(start_date, end_date)
  #   end
  # end

  def check_weekend_work
    @company.timesheets.map(&:date).length
  end
end
