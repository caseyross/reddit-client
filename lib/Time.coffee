export default
	# Mar 20 2020, 14:03
	absolute: (date) ->
		month = switch date.getMonth()
			when 0 then 'Jan'
			when 1 then 'Feb'
			when 2 then 'Mar'
			when 3 then 'Apr'
			when 4 then 'May'
			when 5 then 'Jun'
			when 6 then 'Jul'
			when 7 then 'Aug'
			when 8 then 'Sep'
			when 9 then 'Oct'
			when 10 then 'Nov'
			when 11 then 'Dec'
		day = date.getDate().padStart(2, '0')
		year = date.getFullYear().padStart(4, '0')
		hours = date.getHours().padStart(2, '0')
		minutes = date.getMinutes().padStart(2, '0')
		return "#{month} #{day} #{year}, #{hours}:#{minutes}"
	# about 1 hours ago
	relative: (seconds_since_epoch, format = 'short') ->
		seconds_ago = Math.trunc(Date.now() / 1000) - seconds_since_epoch
		if seconds_ago < 60
			if format is 'long' then return "#{seconds_ago} seconds ago" else return "#{seconds_ago}s"
		minutes_ago = Math.trunc(seconds_ago / 60)
		if minutes_ago < 60
			if format is 'long' then return "#{minutes_ago} minutes ago" else return "#{minutes_ago}m"
		hours_ago = Math.trunc(minutes_ago / 60)
		if hours_ago < 24
			if format is 'long' then return "about #{hours_ago} hours ago" else return "#{hours_ago}h"
		days_ago = Math.trunc(hours_ago / 24)
		if days_ago < 7
			if format is 'long' then return "about #{days_ago} days ago" else return "#{days_ago}d"
		weeks_ago = Math.trunc(days_ago / 7)
		if weeks_ago < 5
			if format is 'long' then return "about #{weeks_ago} weeks ago" else return "#{weeks_ago}w"
		months_ago = Math.trunc(weeks_ago / 4)
		if months_ago < 12
			if format is 'long' then return "about #{months_ago} months ago" else return "#{months_ago}mo"
		years_ago = Math.trunc(months_ago / 12)
		if format is 'long' then return "about #{years_ago} years ago" else return "#{years_ago}y"
	# 01 59 52
	duration: (seconds) ->
		remaining = seconds
		hours = 0
		while remaining >= 3600
			hours += 1
			remaining -= 3600
		minutes = 0
		while remaining >= 60
			minutes += 1
			remaining -= 60
		seconds = 0
		while seconds >= 1
			seconds += 1
			remaining -= 1
		frac_seconds = remaining
		return "#{hours.toString().padStart(2, '0')} #{minutes.toString().padStart(2, '0')} #{seconds.toString().padStart(2, '0') + (if frac_seconds then '.' + frac_seconds else '')}"