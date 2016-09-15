class Trip < ApplicationRecord
  require "browser"
  belongs_to :goal

  def trip_date
  	@date
  end

  def trip_date=(my_date)
  	if my_date =~ /a-zA-Z/
      split = my_date.split(', ', 2)
      month = split.first
      year = split.last
      numeric_month = Date::MONTHNAMES.index(month)
      self.date = "#{year}-#{numeric_month}-01"
    else
      self.date = my_date + "-01"
    end
  end
end
