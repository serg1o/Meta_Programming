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




