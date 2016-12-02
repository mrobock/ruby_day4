require 'rspec'
require_relative 'updated_tasklist'

# Story: As a developer, I can add all of my Tasks to a TaskList.
# Hint: A TaskList has-many Tasks
#
# Story: As a developer with a TaskList, I can get the completed items.
#
# Story: As a developer with a TaskList, I can get the incomplete items.

describe TaskList do

  #Builds a two tasklists before EACH test. One tasklist has only tasks WITH dates, the other tasklist has only tasks WITHOUT dates
  before(:each) do
    #below is tasklist WITHOUT dates
    @list_1 = TaskList.new
    @task_1 = Task.new("First Task")
    @task_1.description=("Descrip")
    @task_1.done
    @task_2 = Task.new("Second Task")
    @task_2.description=("Descrip")
    @task_3 = Task.new("Third Task")
    @task_3.done
    @task_3.description=("Descrip")
    @list_1.add(@task_1)
    @list_1.add(@task_2)
    @list_1.add(@task_3)
    #below is tasklist WITH dates
    @list_date_1 = TaskList.new
    @task_date_1 = DueDateTask.new("First Date Task", 2016, 12, 1)
    @task_date_1.description=("Descrip")
    @task_date_1.done
    @task_date_2 = DueDateTask.new("Second Date Task", 2016, 12, 2)
    @task_date_2.description=("Descrip")
    @task_date_3 = DueDateTask.new("Third Date Task", 2016, 12, 3)
    @task_date_3.description=("Descrip")
    @task_date_4 = DueDateTask.new("Fourth Date Task", 2016, 12, 1)
    @task_date_4.description=("Descrip")
    @task_date_4.done
    @list_date_1.add(@task_date_1)
    @list_date_1.add(@task_date_2)
    @list_date_1.add(@task_date_3)
    @list_date_1.add(@task_date_4)
  end

  #Tests whether a tasklist can be created without an error
  it "can be initialized" do
    expect{TaskList.new}.to_not raise_error
  end

  #expect the list that we create before each test to be/return an array
  it "returns tasklist" do
    expect(@list_1.list).to be_a Array
  end

  #Expect the add function to work by adding a task to a LOCAL list and watch the list to change from being empty to containing that task!
  it "can add a task" do
    list = TaskList.new
    task = Task.new("Test Task")
    expect{list.add(task)}.to change{list.list}.from([]).to([task])
  end

  #Test that our method that checks whether or not each task in a list is complete works!
  it "will return all completed items using an each loop" do
    expect(@list_1.completed).to eq [@task_1, @task_3]
  end

  #Test that our method that checks if tasks are complete works!
  it "will return all not completed items using an each loop" do
    expect(@list_1.not_completed).to eq [@task_2]
  end

##The below tests have tasklists that contain tasks with dates
  it "can add a task with a date to a separate list than the list with tasks that do not have dates" do
    test_list = TaskList.new
    task = DueDateTask.new("first date task", 2990, 9, 11)
    expect{test_list.add(task)}.to change{test_list.list}.from([]).to([task])
  end

  it "will return all not completed items THAT ARE DUE TODAY using an each loop" do
    expect(@list_date_1.not_completed_today).to eq [@task_date_2]
  end

  it "will return all not completed items SORTED BY DATE" do
    expect(@list_date_1.not_completed).to eq [@task_date_2, @task_date_3]
  end

  it "will return all not completed items sorted by date THEN without date" do
    @list_date_1.add(@task_1)
    @list_date_1.add(@task_2)
    @list_date_1.add(@task_3)
    expect(@list_date_1.not_completed).to eq [@task_date_2, @task_date_3, @task_2]
  end

end
