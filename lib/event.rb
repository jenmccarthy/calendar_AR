class Event < ActiveRecord::Base

  def self.future_events
    Event.where("start_date > ?", Time.now.strftime("%Y-%m-%d"))
  end

  def self.current_month
    self.all.select { |event| event.start_date.month == Time.now.month }
  end


  def self.current_day
    self.all.select do |event|
      if event.start_date.month == Time.now.month && event.end_date.month == Time.now.month
        (event.start_date.day == Time.now.day) && (event.end_date.day == Time.now.day)
      end
    end
  end

  def self.current_week
    self.all.select do |event|
      if event.start_date.month == Time.now.month && event.end_date.month == Time.now.month
        start_day = event.start_date.to_date
        end_day = event.end_date.to_date
        day_of_week = start_day.wday
        if day_of_week == 0
          event.start_date.day + 6
          # print event from this date plus 6 for end_date

          end
        binding.pry
      end
    end
  end


end
