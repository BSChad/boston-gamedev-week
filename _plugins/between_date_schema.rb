require 'liquid'
require 'time'
require 'date'

module BetweenDateFilters
	def between_dates(events, date)
		events.reject { |event| DateTime.parse(event.start_date).to_date > date.to_date or DateTime.parse(event.end_date).to_date < date.to_date or (DateTime.parse(event.end_date).to_date == date.to_date and DateTime.parse(event.end_date).hour < 3) }
	end
end

module AddDayFilter
	def add_day(date, days)
		DateTime.parse(date).next_day(days)
	end
end

Liquid::Template.register_filter(BetweenDateFilters)
Liquid::Template.register_filter(AddDayFilter)