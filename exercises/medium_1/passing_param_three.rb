items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

=begin

Fill out the following method calls for gather so that they 
produce the corresponding output shown in numbers 1-4 listed below:

=end

gather(items) do |*produce, wheat|
  puts produce.join(', ')
  puts wheat
end

=begin

Let's start gathering food.
apples, corn, cabbage
wheat
We've finished gathering!

=end

gather(items) do |fruit, *veg, wheat|
  puts fruit
  puts veg.join(", ")
  puts wheat 
end

gather(items) do | apple, *non_apple |
  puts apple
  puts non_apple.join(", ")
end

gather(items) do | apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, #{wheat}"
end
