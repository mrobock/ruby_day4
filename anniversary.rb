require_relative 'date_task'

class Anniversary < Task

  def initialize(title, year, month, day)
    super(title)
    @year = year
    @month = month
    @day = day
    #if the supplied date is equal to or later than today then it's set. Otherwise we add a year to the date, representing the next instance of your anniversary.
    if (Date.strptime("#{@year}-#{@month}-#{@day}", '%Y-%m-%d') >= Date.today)
      @date = Date.strptime("#{@year}-#{@month}-#{@day}", '%Y-%m-%d')
    else
      @date = Date.strptime("#{Date.today.year+1}-#{@month}-#{@day}", '%Y-%m-%d')
      # puts "You are an idiot. Stop living in the past. Luckily for you, I'm smarter than you and fixed your date!"
    end
  end

  #this method is called at the beginning of every following method. It confirms that your anniversary is still in the future. If not, it adds a year to your anniversary, which represents the next time it will be your anniversary!
  def checkDate
    if @date == Date.today
      "Congrats! Its your anniversary"
    elsif
      @date < Date.today
      @date = Date.strptime("#{@year+1}-#{@month}-#{@day}", '%Y-%m-%d')
    end
  end

  #returns the date of your anniversary task
  def date
    checkDate
    @date
  end

end
