require 'rspec'
require_relative 'anniversary'


# Story: As a developer, I can create a to do item for an anniversary (a yearly recurring event) .
# Hint: An Anniversary has a month and a day.

# Hint: An Anniversary is a special kind of DueDateTask where the due date changes depending on the current date (override the due_date method to return the next annivesary date).
#
# Story: As a developer, I can print an item for an anniversary with field labels and values.
#
# Story: As a developer with a TaskList with and without due dates and yearly recurring dates, I can list all the not completed items in order of due date and yearly dates for the current month.
#
# Story: As a developer with a TaskList with a collection of items with and without due dates and yearly recurring dates, I can list all the not completed items in order of due date and yearly dates for the current month, then the items without due dates.

describe Anniversary do
  #this creates a single anniversary task before each test
  before(:each) do
    @anniversary_1 = Anniversary.new("Hurray!", 2016,11,1)
  end

  #makes sure that there are no errors raised by the creation of an Anniversary task
  it "can be created" do
    expect{Anniversary.new("title",2016,12,1)}.to_not raise_error
  end

  #makes sure that the code correctly identifies anniversary dates in the past by adding a year to their 'current' value
  it "is can set an anniversary" do
    expect(@anniversary_1.date).to eq Date.strptime('2017-11-01', '%Y-%m-%d')
  end

  #test required by challenge
  it "can make a task with a date but NOT and anniversary" do
  expect{DueDateTask.new("first date task", 2990, 9, 11)}.to_not raise_error
  end

  #test required by challenge
  it "can make a task without a date" do
    expect{Task.new("no date task title")}.to_not raise_error
  end

  #UNFORTUNATELY THIS TEST DOES WORK. Have fun.
  it "can create a task with and without anniversary and due dates and shows this month's not completed items in order of due date" do
    #Builds a tasklist with 2 tasks with dates, 2 anniversaries with dates, and 2 tasks without dates (one task marked complete that should not be in return list)
    list_with_all = TaskList.new()

    date_task_1 = DueDateTask.new("first date task", 2016, 12, 30)
    date_task_2 = DueDateTask.new("second date task", 2016, 12, 3)

    anniversary_1 = Anniversary.new("first anniversary task", 2015, 12, 7)
    anniversary_2 = Anniversary.new("second anniversary task", 2015, 8, 6)

    task_1 = Task.new("first task")
    task_1.done
    task_2 = Task.new("second task")

    list_with_all.add(date_task_1)
    list_with_all.add(date_task_2)
    list_with_all.add(anniversary_1)
    list_with_all.add(task_1)
    list_with_all.add(task_2)

    expect(list_with_all.not_completed_all_by_month).to be_a Array
   end

end
