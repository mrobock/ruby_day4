
class Task

  def initialize(title)
    @title = title
    @done = false
  end

  #sets the task to 'done'/'complete'
  def done
    @done = true
  end

  #returns whether or not the task is 'done'/'complete'
  def done?
    @done
  end

  #sets the task to 'not done'/'not complete'
  def not_done
    @done = false
  end

  #re-sets the title of the task
  def title=(title)
    @title = title
  end

  #returns the title of the task
  def title
    @title
  end

  #sets the description of the task
  def description=(description)
    @description = description
  end

  #returns the description of the task
  def description
    @description
  end


  def date #empty method to allow sorting by date on lists containing tasks with AND without dates
    nil
  end


  # Purpose: Show all information about a Task only when done (and the task has a title and description)
  # Signature: -> String
  # Examples: Task.new.print -> "Title: Description: Not Done"
  def print_if_done
    if @done == true && @title.class == String && @description.class == String
      "#{@title}: #{@description}: Done"
    else
      "This task is incomplete dummy"
    end
  end


end
