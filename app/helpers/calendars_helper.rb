module CalendarsHelper
  def days_in_month(year, month)
    # Initialize a hash to hold the days of the week
    days_of_week = {
      "Sunday"    => { days: [], symbolEN: "Sun", symbolBR: "Dom" },
      "Monday"    => { days: [], symbolEN: "Mon", symbolBR: "Seg" },
      "Tuesday"   => { days: [], symbolEN: "Tue", symbolBR: "Ter" },
      "Wednesday" => { days: [], symbolEN: "Wed", symbolBR: "Qua" },
      "Thursday"  => { days: [], symbolEN: "Thu", symbolBR: "Qui" },
      "Friday"    => { days: [], symbolEN: "Fri", symbolBR: "Sex" },
      "Saturday"  => { days: [], symbolEN: "Sat", symbolBR: "Sáb" }
    }

    # Current date
    current_day = Date.today

    # First and last days of the given month
    first_day = Date.new(year, month, 1)
    last_day = first_day.next_month.prev_day

    # Determine the day of the week for the first day of the month
    first_day_index = first_day.wday

    # Fill in the days from the previous month if necessary
    if first_day_index > 0
      prev_month_last_day = first_day.prev_day
      prev_month_days = first_day_index.times.map do |i|
        prev_day = prev_month_last_day - (first_day_index - 1 - i)
        { day: prev_day.day, current: false, from_previous_month: true }
      end

      # Add the previous month's days to the correct day slots
      prev_month_days.each_with_index do |day_info, i|
        day_name = Date::DAYNAMES[i]
        days_of_week[day_name][:days] << day_info
      end
    end

    # Add the current month's days
    (first_day..last_day).each do |date|
      day_name = date.strftime("%A")
      is_current_day = date == current_day
      days_of_week[day_name][:days] << { day: date.day, current: is_current_day, from_previous_month: false, from_next_month: false }
    end

    days_of_week
  end
end
