# Story: As a developer, I can create a Task.
#
# Story: As a developer, I can give a Task a title and retrieve it.
#
# Story: As a developer, I can give a Task a description and retrieve it.
#
# Story: As a developer, I can mark a Task done.
#
# Story: As a developer, when I print a Task that is done, its status is shown.
# Hint: Implement to_s have it return the features of a Task with labels (for instance, "Title: Buy Food Description: Bananas, milk").
#
# Story: As a developer, I can add all of my Tasks to a TaskList.
# Hint: A TaskList has-many Tasks
#
# Story: As a developer with a TaskList, I can get the completed items.
#
# Story: As a developer with a TaskList, I can get the incomplete items.

require 'rspec'
require_relative 'task'

describe Task do

  before(:each) do
    @task = Task.new("Things to learn about Ruby")
  end

  it "can be instanciated" do
    expect{Task.new("Title")}.to_not raise_error
  end

  it "can have a title" do
    @task.title=("This is the title")
    expect(@task.title).to eq "This is the title"
  end

  it "have a description for my task" do
    @task.description=("title description")
    expect(@task.description).to eq "title description"
  end

  it "can be marked done or not done" do
    expect(@task.done?).to eq false
    expect{@task.done}.to change{@task.done?}.from(false).to(true)
    expect{@task.not_done}.to change{@task.done?}.from(true).to(false)
  end

  it "will print out the task info ONLY when done" do
    expect(@task.print_if_done).to eq "This task is incomplete dummy"
    @task.done
    @task.description=("How to code in Ruby")
    expect(@task.done?).to be true
    expect(@task.print_if_done).to be_a String
  end

end
