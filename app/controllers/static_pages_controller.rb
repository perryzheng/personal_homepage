class StaticPagesController < ApplicationController
  def home
  end

  def about
    @items = [ "Javascript", "C#", "Mandarin", "Java", 
               "Fujian", "Duke University", "Ruby on Rails", "Chinese"
               ]
  end

  def contact
  end

  def projects
    
  end

  def diana
    time = Time.now.utc.in_time_zone("Pacific Time (US & Canada)")
    if time.wday == 6
      working = TimeRange.new("18:00","21:00").include?(time)    
    elsif time.wday == 2
      working = TimeRange.new("17:30","22:00").include?(time)
    elsif time.wday == 4
      if time.year == 2013 && time.month == 2 && time.day == 28
        working = false
      else
        working = TimeRange.new("12:30","17:00").include?(time)
      end
    end
    @isworking = working ? "Yes!" : "No" 
  end
end

class TimeRange
    private

    def coerce(time)
        time.is_a? String and return time
        return time.strftime("%H:%M")
    end

    public

    def initialize(start,finish)
        @start = coerce(start)
        @finish = coerce(finish)
    end

    def include?(time)
        time = coerce(time)
        @start < @finish and return (@start..@finish).include?(time)
        return !(@finish..@start).include?(time)
    end
end
