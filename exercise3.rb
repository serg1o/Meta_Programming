animal = 'dog'

# define singleton speak() method


    
    
# 1st way - def animal.speak
#def animal.speak
#  puts 'Dog says Woof!'
#end


# 2nd way - instance_eval
#animal.instance_eval do
#  def speak
#    puts 'Dog says Woof!'
#  end
#end


# 3rd way - module, extend
#module Bark
#  def speak
#    puts 'Dog says Woof!'
#  end
#end
#animal.extend(Bark)


# 4th way - module, include
#module Bark
#  def speak
#    puts 'Dog says Woof!'
#  end
#end
#animal.class.include(Bark)


# 5th way - singleton class
#class << animal
#  def speak
#    puts 'Dog says Woof!'
#  end
#end
#puts animal.singleton_methods


# 6th way - define_method
#def addMethod(object, m, &block)
#  object.class.send(:define_method, m, &block)
#end

#addMethod(animal, :speak) { puts 'Dog says Woof!' }


# 7th way - send, lambda
animal.class.send(:define_method, :speak, lambda{ puts( "#{self.capitalize} says Woof!")})


animal.speak  #=> 'Dog says Woof!'
