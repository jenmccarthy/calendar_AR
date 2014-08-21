class Event < ActiveRecord::Base

  def self.future_events
    Event.where ("start_date > ?", Time.now.strftime("%Y-%m-%d"))
  end

  # def self.future_events
  #   Event.where(start_date: (Time.now.stf))
  # end

end
