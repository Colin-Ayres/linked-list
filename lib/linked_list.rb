# frozen_string_literal: true

require_relative 'node'

# This class recreates the functionality of a Linked List
class LinkedList
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  # Adds a new node containing value to the end of the list
  def append(value)
    new_node = Node.new(value)
    @head ||= new_node # Set head to new node if it is falsey
    if !@tail
      @tail = new_node # Set tail to new node if it falsey
    else
      @tail.next_node = new_node # Else, there are elements in the array. Set the current tail's pointer towards the new appended node
    end
    @tail = new_node
    @size += 1
  end

  # Adds a new node containing value to the start of the list
  def prepend(value)
    new_node = Node.new(value, @head) # Next node points to current node, new head points to new node
    @head = new_node
    @size += 1
  end

  # Returns data at given index (List begins at index 0)
  def at(index)
    current_node = @head
    index.times do
      current_node = current_node.next_node
    end
    current_node.data
  end

  # Gets rid of last element in list
  def pop
    nil if @size < 1
    current_node = @head
    current_node = current_node.next_node until current_node.next_node == @tail
    current_node.next_node = nil
    @tail = current_node
  end

  # If value is in list, returns true by iterating through each element and comparing
  def contain?(value)
    return false if @size < 1
    current_node = @head
    iteration = 0
    until current_node.nil?
      if current_node.data == value
        return true
      end
      current_node = current_node.next_node
    end
    return false
  end

  # If value is in list, returns its index by iterating through each element and comparing
  def find(value)
    return nil if @size < 1
    current_node = @head
    index = 0
    until current_node.nil?
      if current_node.data == value
        return index
      end
      index += 1
      current_node = current_node.next_node
    end
    return nil
  end

  # Prints contents of linked list
  def to_s
    current_node = @head
    until current_node.nil?
      print "( #{current_node.data} ) -> "
      current_node = current_node.next_node
    end
  end
end