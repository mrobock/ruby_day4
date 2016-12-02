require 'rspec'
require_relative 'date_task'

# Story: As a developer, I can create a DueDateTask, which is-a Task that has-a due date.
# Hint: Use the built-in Ruby Date class
#
# Story: As a developer, I can print an item with a due date with labels and values.
# Hint: When implementing to_s, use super to call to_s on the super class.
#
# Story: As a developer, I can add items with due dates to my TaskList.
# Hint: Consider keeping items with due dates separate from the other items.
#
# Story: As a developer with a TaskList, I can list all the not completed items that are due today.
#
# Story: As a developer with a TaskList, I can list all the not completed items in order of due date.
#
# Story: As a developer with a TaskList with and without due dates, I can list all the not completed items in order of due date, and then the items without due dates.

describe DueDateTask do

  #creates a single task with a date before each test
  before(:each) do
    @date_1 = DueDateTask.new("first date task", 2990, 9, 11)
  end

  #makes sure that the creation of @date_1 does not raise an error
  it "can be initialized" do
  expect{@date_1}.to_not raise_error
  end

  #makes sure that the printout function works
  it "can print out date" do
    expect(@date_1.date).to eq "2990-09-11"
  end

end
