require 'Date'

def new_date_time_between_8_and_18(future = true)
  if future
    date = Time.now.to_date.to_s
    hour = " at #{rand(8..18)}H00"
    # date_time = DateTime.strptime(date + hour)
  end
  p date + hour
end

new_date_time_between_8_and_18
