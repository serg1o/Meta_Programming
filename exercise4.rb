# 1st solution
#class A
#  @@a = 1
#  @a = 2
#  a = 3
#  $b = binding
#end

#p eval('[@@a, @a, a]', $b)


# 2nd solution
#class A
#  @@a = 1
#  @a = 2
#  a = 3
#  @b = binding
#end

#p eval('[@@a, @a, a]', A.instance_variable_get(:@b))


# 3rd solution
class A
  @@a = 1
  @a = 2
  a = 3
  @b = binding
  
  class << self
    attr_reader :b
  end
end

p eval('[@@a, @a, a]', A.b)
