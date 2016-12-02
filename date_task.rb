require_relative 'updated_tasklist'

class DueDateTask < Task

  def initialize(title, year, month, day)
    super(title)
    if (Date.strptime("#{year}-#{month}-#{day}", '%Y-%m-%d') >= Date.today)
      @date = Date.strptime("#{year}-#{month}-#{day}", '%Y-%m-%d')
    else
      @date = nil
      # puts "You are an idiot. This is invalid. Try again with a correct date"
    end
  end

  #returns the date of your date task
  def date
    @date
  end

end
