=begin

**Rules/Requirements**

- program manages robot factory settings
- when robots come off the factory floor, they have no name
- first time you boot them up, a random name is generated
  such as RX837 or BC811
- robot name is a string with 2 letters and 3 digits (all random)
- sometimes we need to reset a robot to its factory settings
  - their name gets wiped, and assigned a new name
- names must be random
- solution should not allow the use of the same name twice when avoidable

**Examples**

looking at the test suite, we need the methods;
name
reset

**Data Structures**

string for the name of the robot
list of used names in an array

**Algorithm**

we need a Robot class

class variable
  - keeps track of used names

constructor
- assign @name instance variable to a random name if the random name 
  has not been used

name
- returns the value of the name instance variable

reset
- wipes the robots name

=end

class Robot
  @@names = []

  def name
    return @name if @name
    @name = generate_name while @@names.include?(@name) || @name.nil?
    @@names << @name
    @name
  end

  def generate_name
    random_name = ''
    2.times { random_name << ('A'..'Z').to_a.sample}
    3.times { random_name << ('0'..'9').to_a.sample}
    random_name
  end

  def reset
    @@names.delete(@name)
    @name = nil
  end
end
