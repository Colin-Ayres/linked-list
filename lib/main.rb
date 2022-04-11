# frozen_string_literal: true

require_relative 'node'
require_relative 'linked_list'

my_list = LinkedList.new
my_list.append('1') 
# => <LinkedList:0x..a8 @head=#<Node:0x..90 @data="1", @next_node=nil>, @tail=#<Node:0x..90 @data="1", @next_node=nil>>
my_list.append('2') 
# => <LinkedList:0x..a8 @head=#<Node:0x..90 @data="1", @next_node=#<Node:0x..00 @data="2", @next_node=nil>>, @tail=#<Node:0x..00 @data="2", @next_node=nil>>
my_list.prepend('first') 
# => <LinkedList:0x..a8 @head=#<Node:0x..48 @data="first", @next_node=#<Node:0x..90 @data="1", @next_node=#<Node:0x..00 @data="2", @next_node=nil>>>, @tail=#<Node:0x..00 @data="2", @next_node=nil>>
p my_list.size
# => 3
p my_list.head.data
# => "first"
p my_list.tail.data
# => "2"
p my_list.at(1) # Note: index starts at 0; 1 is the second element
# => "1"
my_list.pop
# => #<LinkedList:0x000056298f22af10 @head=#<Node:0x..40 @data="first", @next_node=#<Node:0x..448 @data="1", @next_node=nil>>, @tail=#<Node:0x..48 @data="1", @next_node=nil>
p my_list.contain?('1')
# => True
p my_list.contain?('5')
# => False
p my_list.find('1')
# => 1
p my_list.find('5')
# => nil
my_list.append('3')
my_list.append('7')
p my_list.to_s
# => ( first ) -> ( 1 ) -> ( 3 ) -> ( 7 ) -> nil

