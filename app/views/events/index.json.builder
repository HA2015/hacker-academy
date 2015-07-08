json.array!(@events) do |event|
  json.extract! event, :id, :name
  json.start event.start
  json.end event.end
  json.url event_url(event, format: :html)
end