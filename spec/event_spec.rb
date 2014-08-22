require 'spec_helper'

describe Event do
  describe '.future_events' do
    it 'lists all events in the future' do
      event_1 = Event.create({start_date: '2014-08-25', end_date: '2014-08-31'})
      event_2 = Event.create({start_date: '2013-08-25', end_date: '2013-08-31'})
      expect(Event.future_events).to eq [event_1]
    end
  end

  describe '.current_month' do
    it 'lists all events within the current month' do
      event_1 = Event.create({start_date: '2014-08-25', end_date: '2014-08-25'})
      event_2 = Event.create({start_date: '2014-08-30', end_date: '2014-08-31'})
      event_3 = Event.create({start_date: '2014-12-30', end_date: '2014-12-31'})
      expect(Event.current_month).to eq [event_1, event_2]
    end
  end

  describe '.current_day' do
    it 'lists all events within the current day' do
      event_1 = Event.create({start_date: '2014-08-22', end_date: '2014-08-22'})
      event_2 = Event.create({start_date: '2014-08-22', end_date: '2014-08-22'})
      event_3 = Event.create({start_date: '2014-08-22', end_date: '2014-08-26'})
      event_4 = Event.create({start_date: '2014-12-30', end_date: '2014-12-31'})
      expect(Event.current_day).to eq [event_1, event_2]
    end
  end

  describe '.current_week' do
    it 'lists all events within the current week' do
      event_1 = Event.create({start_date: '2014-08-17', end_date: '2014-08-23'})
      event_2 = Event.create({start_date: '2014-08-20', end_date: '2014-08-22'})
      event_3 = Event.create({start_date: '2014-08-22', end_date: '2014-08-26'})
      event_4 = Event.create({start_date: '2014-12-30', end_date: '2014-12-31'})
      expect(Event.current_week).to eq [event_1, event_2]
    end
  end

end
