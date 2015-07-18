class Event < ActiveRecord::Base
  
  # The objective of this function is to convert the Event model's data into json acceptable
  #  for FullCalendar.
  # The Event Object for FullCalendar is available at: http://fullcalendar.io/docs/event_data/Event_Object/
  # Right now, the start/end are somewhat hacked together. 
  def as_json(options = {})
    {
      :id => self.id,
      :title => self.name,
      :start => DateTime.new(self.date.year, 
                            self.date.month, 
                            self.date.day, 
                            self.start_time.in_time_zone("Eastern Time (US & Canada)").hour, 
                            self.start_time.in_time_zone("Eastern Time (US & Canada)").min, 
                            self.start_time.in_time_zone("Eastern Time (US & Canada)").sec),
      :end => DateTime.new(self.date.year, 
                            self.date.month, 
                            self.date.day, 
                            self.finish_time.in_time_zone("Eastern Time (US & Canada)").hour, 
                            self.finish_time.in_time_zone("Eastern Time (US & Canada)").min, 
                            self.finish_time.in_time_zone("Eastern Time (US & Canada)").sec),
      #:start => self.start_time.rfc822,
      #:end => self.finish_time.rfc822,
      #:start => self.start_time.strftime("%I:%M %p"),
      #:end => self.finish_time.strftime("%I:%M %p"),
      :description => self.desc,
      :allDay => false,
      # This is quite a hack, it would be nice to have a cleaner way to get /events/id
      :url => Rails.application.routes.url_helpers.events_path(self.id).gsub(/\./, '/'),
      # This is the HA $deep-red color
      :color => "#cc0000"
    }
  end
end
