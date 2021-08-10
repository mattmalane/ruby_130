=begin

The Range#step method lets you iterate over a range of values where each 
value in the iteration is the previous value plus a "step" value. It returns 
the original range.

Write a method that does the same thing as Range#step, but does not 
operate on a range. Instead, your method should take 3 arguments: 
the starting value, the ending value, and the step value to be applied
to each iteration. Your method should also take a block to which 
it will yield (or call) successive iteration values.

**Rules/Requirements**

- method takes 3 arguments: start, end, step value
- method should take a block to which it will yield successive iteration values
- input: three integers

**Examples**

step(1, 10, 3) { |value| puts "value = #{value}" }

value = 1
value = 4
value = 7
value = 10

**Data Structures**



**Algorithm**

initialize start value
initialize end value
yield to block, with an argument of start value
reassign start value to start value plus step value
break if start value is greater then end value

=end

def step(starting, ending, step)
  current = starting
  end_value = ending

  loop do
    yield(current)
    break if current + step > end_value
    current += step
  end

  current
end

step(1, 10, 3) { |value| puts "value = #{value}" }