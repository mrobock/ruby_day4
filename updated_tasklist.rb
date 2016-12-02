require_relative 'task'
require_relative 'date_task'

class TaskList

  def initialize
    @list = []
  end

  #adds a task to the instance list
  def add(task)
    @list << task
  end

  #returns the current instance list
  def list
    @list
  end

  def completed #Returns a list of completed tasks
    @completed = []
    @list.each do |each_task|
      if each_task.done? == true
        @completed << each_task
      end
    end
    @completed
  end

  def not_completed #Returns a list of not completed tasks sorted by due date. To get around having items with and without dates we first find the incomplete items that have dates, put them into their own list, sort that list, then find the incomplete items that do not have dates, put them into their own list, and return the concatenation of the first (dated) list and the second (undated) list. This means that tasks without dates come last!
    @not_completed_no_date = []
    @not_completed_with_date = []
    @list.each do |each_task|
      if each_task.done? == false && each_task.date != nil
        @not_completed_with_date << each_task
      end
      @not_completed_with_date.sort_by! {|a| a.date}
      if each_task.done? == false && each_task.date == nil
        @not_completed_no_date << each_task
      end
    end
      @not_completed_with_date + @not_completed_no_date
  end

  def not_completed_today #Returns list of not completed tasks THAT ARE DUE TODAY
    return_list = []
    @list.each do |each_task|
      if each_task.done? == false && each_task.date == Date.today
        return_list << each_task
      end
    end
    return_list
  end

# Purpose: returns list of not completed tasks sorted by date and due during the current month - DOES NOT WORK BECAUSE OF MIXED LISTS
#Signature: if month of item in @list (returned/edited by not_complete method) equals today's month, then add it to a new list that will be returned at the end of this method
  def not_completed_all_by_month
    #calls the not_completed function to hopefully set a not_completed_with_date list containing a sorted list of tasks that HAVE dates
    not_completed
    return_list = []
    #check if each item in the list is in the current month
    @not_completed_with_date.each do |a|
      b = Date.strptime("#{a.date}")
      if b.mon == Date.today.mon
        return_list << a
      end
    end
    return_list
  end

end
