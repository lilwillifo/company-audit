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
      return {success: false, error: 'bad data'} if data.length != 5
    end

    CSV.foreach(filename) do |data|
      @employees << Employee.new(data[0], data[1], data[2], data[3], data[4])
    end
    {success: true, error: nil}
  end

  def load_projects(filename)
    CSV.foreach(filename) do |data|
      return {success: false, error: 'bad data'} if data.length != 4
    end

    CSV.foreach(filename) do |data|
      @projects << Project.new(data[0], data[1], data[2], data[3])
    end
    {success: true, error: nil}
  end

  def load_timesheets(filename)
    CSV.foreach(filename) do |data|
      return {success: false, error: 'bad data'} if data.length != 4
    end

    CSV.foreach(filename) do |data|
      @timesheets << Timesheet.new(data[0], data[1], data[2], data[3])
    end
    {success: true, error: nil}
  end
end
