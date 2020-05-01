require "Date"

 class Birthdate
  attr_reader :birthday

  def initialize(birthday, today)
    @birthday = birthday
    @today = today
  end

  def date
    Date.parse(@birthday)
  end

  def calculate_days
    if @today.month <= date.month
      birthday = "#{@today.year}-#{date.month}-#{date.day}"
      (Date.parse(birthday) - @today).to_i
    else
      birthday = "#{@today.year + 1}-#{date.month}-#{date.day}"
      (Date.parse(birthday) - @today).to_i
    end
  end

  def birthday?
    @birthday.slice(5..9) == @today.strftime("%m-%d") ? true : false
  end
end
