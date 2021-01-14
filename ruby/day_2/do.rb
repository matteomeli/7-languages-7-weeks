array = [*(16..31)]
index = 0
array.each do |_a|
  p array[(index - 4)...index] if ((index > 0) && (index % 4 == 0)) || index == array.count - 1
  index += 1
end

array.each_with_index do |_a, i|
  p array[(i - 4)...i] if ((i > 0) && (i % 4 == 0)) || i == array.count - 1
end

array.each_slice(4) { |a| p a }

class Tree
  attr_accessor :children, :node_name

  #def initialize(name, children = [])
  #  @children = children
  #  @node_name = name
  #end

  # Modify initialise so it takes a hash
  def initialize(hash)
    @node_name = hash.keys.first
    @children = []
    hash[@node_name].each { |key, value| @children.push(Tree.new(key => value)) }
  end

  def visit_all(&block)
    visit(&block)
    children.each { |c| c.visit_all(&block) }
  end

  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new({'Ruby' => { 'Reia' => {'MacRuby' => {}}}})
puts 'visiting entire tree'
ruby_tree.visit_all { |node| puts node.node_name }

hsh = {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {},
'child 4' => {} } } }
ruby_tree = Tree.new(hsh);
puts 'visiting entire tree'
ruby_tree.visit_all { |node| puts node.node_name }

def grep(file, str)
    f = File.open("foo.txt")
    r = Regexp.new(str)
    f.each { |line| puts "#{f.lineno}: #{line}" if r.match(line) }
end

grep("foo.txt", "lamb")
grep("foo.txt", "school")