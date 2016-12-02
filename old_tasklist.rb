require_relative 'task'
require_relative 'date_task'

class TaskList

  def initialize
    @list = []
    @list_date = []
  end

  def add(task)
    @list << task
  end

  def list
    @list
  end

  def add_date(task)
    @list_date << task
  end

  def list_date
    @list_date
  end

  def completed #Returns list of completed tasks
    @completed = []
    @list.each do |each_task|
      if each_task.done? == true
        @completed << each_task
      end
    end
    @completed
  end

  def completed_select
    @list.select{|item| item.done?}
  end

  def not_completed #Returns list of not completed tasks
    @not_completed = []
    @list.each do |each_task|
      if each_task.done? == false
        @not_completed << each_task
      end
    end
    @not_completed
  end

  def not_completed_select #Returns list of not completed tasks
    @list.select{|item| !item.done?}
  end

##TASKS NOW HAVE DATES ALSO
  def not_completed_date #Returns list of not completed tasks THAT ARE DUE TODAY
    not_completed = []
    @list_date.each do |each_task|
      if each_task.done? == false && each_task.printDate == Date.today
        not_completed << each_task
      end
    end
    not_completed
  end
#return list of notcompleted task sorted by due date
  def not_completed_date_order
    @not_completed_date = []
    @list_date.each do |each_task|
      if each_task.done? == false
        @not_completed_date << each_task
      end
    end
    @not_completed_date.sort_by! {|a| a.printDate}
  end

#returns list of not completed task sorted by due date (this list includes task without due dates)
  def not_completed_all
    not_completed_date_order
    not_completed
    puts @not_completed
    @not_completed.each do |each_task|
      @not_completed_date << each_task
    end
    @not_completed_date
  end

# returns list of not completed task by month and sorted
  def not_completed_all_by_month

    not_completed_date_order
    not_completed
    puts @not_completed
    @not_completed.each do |each_task|
      @not_completed_date << each_task
    end
    @not_completed_date
  end

end
