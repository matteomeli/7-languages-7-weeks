file = File.open("tmp.txt", "w+")
file.puts "Accessing a file without blocks. Need to remember to close it!"
file.close

File.open("tmp.txt", "a") { |file|
    file.puts "Much better with block, if you're forgetful like me."
}

puts 'Can you transform a hash into a array?'
hash = {1 => "one", 2 => "two", 3 => "three"}
array = Array.new
hash.each_pair { |key, value| array.push([key, value]) }
p array
array2 = hash.to_a
p array
array3 = hash.to_a.flatten
p array3
puts 'Yes.'

puts 'Can you transform array into hash?'
hash = array2.to_h
p hash
puts 'Yes.'

puts 'Can you iterate through a hash?'
hash.each_pair { |key, value|
    puts "#{key} => #{value}"
}
puts 'Yes.'

# Array as stack
stack = [1, 2, 3]
stack.push 4
stack.push 5
stack.pop
p stack # => [1, 2, 3, 4]
puts 'Array can be a stack (or LIFO queue).'

# Array as FIFO queue
queue = [1, 2, 3]
queue.unshift 0
queue.pop
p queue # => [0, 1, 2]
puts 'Array can be a FIFO queue also.'

# Array as dequeue
dequeue = []
dequeue.push(3).push(4)
dequeue.unshift(2).unshift(1)
p dequeue  # => [1, 2, 3, 4]
puts 'Array can be a dequeue.'

# Array as list
list = [1, 2, 4]
list.insert(2, 3)
list.delete_at(3)
p list # => [1, 2, 3]
puts 'Array can be lists'
