require './lib/employee'
require './lib/project'
require './lib/timesheet'
require 'CSV'

class Company
  attr_reader :employees, :projects, :timesheets
  def initialize
    @employees = []
    @projects = []
    @timesheets = []
  end

  def load_employees(filename)
    CSV.foreach(filename) do |data|
      # return {success: false, error: 'bad data'} if data.length != 4
      @employees << Employee.new(data[0], data[1], data[2], data[3], data[4])
    end
    {success: true, error: nil}
  end

  def load_projects(filename)
    CSV.foreach(filename) do |data|
      # return {success: false, error: 'bad data'} if data.length != 4
      @projects << Project.new(data[0], data[1], data[2], data[3])
    end
    {success: true, error: nil}
  end

  def load_timesheets(filename)
    CSV.foreach(filename) do |data|
      # return {success: false, error: 'bad data'} if data.length != 4
      @timesheets << Timesheet.new(data[0], data[1], data[2], data[3])
    end
    {success: true, error: nil}
  end
end
