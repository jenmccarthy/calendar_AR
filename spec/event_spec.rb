require 'spec_helper'

describe Event do
  describe '.future_events' do
    it 'lists all events in the future' do
      event_1 = Event.create({start_date: '2014-08-25', end_date: '2014-08-31'})
      event_2 = Event.create({start_date: '2013-08-25', end_date: '2013-08-31'})
      expect(Event.future_events).to eq [event_1]
    end
  end
end
