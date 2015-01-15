#get the values from outside the class A

val = class A
  def initialize
    @a = 11
    @@a = 22
    a = 33
  end
  @a = 1
  @@a = 2
  a = 3
end

puts A.instance_variable_get(:@a)
puts A.class_variable_get(:@@a)
puts val
x = A.new
puts x.instance_variable_get(:@a)
puts A.class_variable_get(:@@a)

puts x.send(:initialize)



# another solution to get a
class A2
  def initialize
    @a = 11
    a = 33
    @@a = 22
    
    $b2 = binding
  end
  @a = 1
  @@a = 2
  a = 3
  $b = binding
end

val = eval 'a', $b 
puts val
a2 = A2.new
val = eval 'a', $b2 
puts val

