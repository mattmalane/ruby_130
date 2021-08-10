=begin

Create a clock that is independent of date.

You should be able to add minutes to and subtract minutes from 
the time represented by a given clock object. Two clock objects 
that represent the same time should be equal to each other.

You may not use any built-in date or time functionality; just use arithmetic operations.

**Rules/Requirements**

- create a clock, independent of date
- able to add minutes to and subtract minutes from the time
- two clock objects that represent the same time should be equal to each other
- may not use build in date or time functionality, only arithmetic operations
- 60 minutes in an hour
- 24 hours in a day
- clock will be based on 24 hour time
- how many minutes in a day?
  - 1440 minutes in a day
- given an integer
- need to return a string, representing the time
- the first integer argument is the hour
- the second integer argument is the minutes
- if no second integer argument given, default it to 0 minutes
- how do we format the return string of the `at` method

**Example**

looking at test cases , we see that we need an `at` instance method
we also need a to_s method
to_s will format the time
`at` will have the correct hours and minutes (unformatted)

**Data Structures**

integers
string represenation of those integers

**Algorithm**

`at` (class method)
- given two integer arguments, (hours, minutes)
  - convert hours and minutes to total minutes
  - should create a clock obj with hours and minutes


`to_s` (instance method)
- convert total minutes into a formated string, with hours and minutes

`+` (instance method)
- add the integer argument to total mintues

`-` (instance method)
- subtract the integer argument from total minutes

=end

class Clock
  ONE_DAY = 24 * 60
  attr_reader :hours, :minutes

  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes=0)
    new(hours, minutes)
  end

  def to_s
    format('%02d:%02d', hours, minutes);
  end

  def +(num)
    minutes_since_midnight = compute_minutes_since_midnight + num
    while minutes_since_midnight >= ONE_DAY
      minutes_since_midnight -= ONE_DAY
    end

    compute_time_from(minutes_since_midnight)
  end

  def -(num)
    minutes_since_midnight = compute_minutes_since_midnight - num
    while minutes_since_midnight < 0
      minutes_since_midnight += ONE_DAY
    end

    compute_time_from(minutes_since_midnight)
  end

  def ==(other_time)
    hours == other_time.hours && minutes == other_time.minutes
  end

  def compute_minutes_since_midnight
    total_minutes = 60 * hours + minutes
    total_minutes % ONE_DAY
  end

  def compute_time_from(minutes_since_midnight)
    hour, minute = minutes_since_midnight.divmod(60)
    hour %= 24
    Clock.new(hour, minute)
  end
end