=begin

**Rules/Requirements**

- a linked list a fundamental data structure in computer science
  and is often used in implementation of other data structures
- simplest kind of linked list is a singly linked list
- each element in the list contains data and a next field, pointing to the next element
  in the list of elements.
- Last in, First out
- create a singly linked list whose elements may contain a range of data such as
  the numbers 1-10.
- provide functions to reverse the linked list and convert a linked list
  to and from an array

**Examples**

looking at the test cases we need the following;

`Element` class
datum
tail?
next

`SimpleLinkedList` class
size
empty?
push
peek
head
pop
from_a([]) (class method)
to_a
reverse

**Data Structures**

building a singly linked list where each element has two instance variables;
datum assigned to an integer
next assigned to the next element in the list

**Algorithm**

First off, we need to create an `Element` class.
This class will house behaviors that each Element obj has access to
Each element obj will have a state of datum and next

constructor
- assigns instance variable `datum` to an integer
- assigns instance variable `next` to the next element

datum
- returns the value assigned to the instance variable datum

tail?
- returns true if the value assigned to next is nil

next
- returns the value assigned to the instance variable next

We also need a `SimpleLinkedList` class
In this class we need the following;

size
- returns an integer based on the amount of elements in the linked list
- start at the element assigned to head
- increment a counter for the current valid element
- break if current element is invalid
- return the counter

empty?
- returns true if the list is empty
- return true if value assigned to `head` instance variable is nil

push
- takes an integer argument
- appends a new `Element` obj to the list
- assign the this new `Element` obj to head with arguments;
  integer arguments, the old head obj

peek
- returns the datum of head obj

head
- returns the value assigned to head instance variable

pop
- intialize a temp local variable to the obj assigned to `head`
- reassign head to the temp objs `next` instance variable
- return the datum of the temp obj

from_a(array) (class method)
- takes an array as an argument
- creates a linked list from elements of the array
- if we have an array of integers 1 - 10 stored in the arg array
- the list should end up having the integer 1 as the head and 10 as the tail
- to do this we need to first reverse the array so that we push 10 into the array and
  push the rest of the integers down. (push-down stack LIFO)
- iterate through the reversed array
- push each element to a new SimpleLinkedList
- return the new list

to_a
- turn a linked list into an array
- initialize a local variable to an empty array
- assign the head element to local variable current element
- append the current element's datum to the array
- reassign current element to current elemnets next instance variable
- repeat untill current element's datum is nil
- return the array

reverse
- convert linked list to an array
- reverse the array
- turn array into linked list


=end

class Element
  attr_reader :datum, :next

  def initialize(datum, next_element=nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :head

  def size
    counter = 0
    current_element = head

    while !current_element.nil?
      counter += 1
      current_element = current_element.next
    end

    counter
  end

  def empty?
    @head.nil?
  end

  def push(num)
    temp_head = @head
    @head = Element.new(num, temp_head)
  end

  def peek
    @head ? @head.datum : nil
  end

  def pop
    temp = @head
    @head = temp.next
    temp.datum
  end

  def self.from_a(arr)
    arr = [] if arr.nil?

    list = SimpleLinkedList.new
    arr.reverse.each do |num|
      list.push(num)
    end
    list
  end

  def to_a
    arr = []
    current_element = @head

    while !current_element.nil?
      arr << current_element.datum
      current_element = current_element.next
    end

    arr
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end
end



