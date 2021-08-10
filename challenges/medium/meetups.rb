=begin

**Rules/Requirements**

- in the program, construct objects that represent a meetup date
- each object takes a month number (1-12) and a year (e.g. 2021)
- 2nd wednesday of May 2021, the obj should be able to determine that the meetup
  wil occur on the 12th of May, 2021
- descriptors that may be given are strings 'first', 'second'...
- guaranteed that each day of the week will have exactly one date that is the 'teenth'
  of that day in every month
- days of week are given by strings 'Monday', 'Tuesday'......
- if we are given the year, month, day of week, and schedule,
  how do we calculate the date?
    - we need information on which days (monday, tuesday, wed,...) occur on certain days
- 

**Examples**

looking at the test cases, we need an instance method `day`, that takes the day of the week
and the schedule (first, second, third)

the instance method `day` should know the objects state (year and month) and use
this data along with the methods arguments of day of the week and schedule to calculate
the date of the meetup.

meetup = Meetup.new(2013, 3)
meedup.day('Monday', 'first') => Date.civil(2013, 3, 4)

**Data Structures**

working with Date objects

**Algorithm**

Determine the 7 day period in which the meetup will occur. See the PEDAC: Understanding 
the Problem section for the appropriate date ranges.
Search the range of dates that contain the meetup date for 
the date that matches the desired day of week.

*constructor*

- save the year and month
- determine the last day of the month (28-31)

*instance method*
day
- convert the weekday and schedule descriptor to lowercase
- calculate the first possible day of the month for the meetup
- calculate the last possible day of the month for the meetup
- search the range of possible days for the date that occurs on
  the desired day of the week
- return a date object for the first matching day or a value that
  indicates that a meetup date couldnt be found.

=end

class Meetup
  SCHEDULE_START_DAY = {
    'first' => 1,
    'second' => 8,
    'third' => 15,
    'fourth' => 22,
    'fifth' => 29,
    'teenth' => 13,
    'last' => nil
  }.freeze

  def initialize(year, month)
    @year = year
    @month = month
    @days_in_month = Date.civil(@year, @month, -1).day
  end

  def day(weekday, schedule)
    weekday = weekday.downcase
    schedule = schedule.downcase
    
    first_possible_day = first_day_to_search(schedule)
    last_possible_day = [first_day_to_search(schedule) + 6, @days_in_month].min

    (first_possible_day..last_possible_day).detect do |day|
      date = Date.civil(@year, @month, day)
      break date if day_of_week_is?(date, weekday)
    end
  end

  def first_day_to_search(schedule)
    SCHEDULE_START_DAY[schedule] || (@days_in_month - 6)
  end

  def day_of_week_is?(date, weekday)
    case weekday
    when 'monday'    then date.monday?
    when 'tuesday'   then date.tuesday?
    when 'wednesday' then date.wednesday?
    when 'thursday'  then date.thursday?
    when 'friday'    then date.friday?
    when 'saturday'  then date.saturday?
    when 'sunday'    then date.sunday?
    end
  end
end
