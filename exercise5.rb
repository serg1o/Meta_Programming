=begin
Define the following class without class MaskedString, def tr_vowel and def self.tr_vowel

class MaskedString < String
  def tr_vowel
    tr 'aeiou', '*'
  end
  def self.tr_vowel str
    str.tr 'aeiou', '*'
  end
end

Hints:

    instance_eval, class_eval, define_method
    module, extend, extended
    module, include, included
=end



=begin

# Solution 1

Object.const_set("MaskedString", Class.new(String))
class_name = Object.const_get("MaskedString")
class_name::module_eval{ define_method(:tr_vowel){tr 'aeiou', '*'}} #tambem pode ser instance_eval ou class_eval
class_name::module_eval{ define_singleton_method(:tr_vowel) do |str| 
  str.tr 'aeiou', '*'
end }



puts MaskedString.tr_vowel "saeiouf" #=> s*****f
puts MaskedString.superclass
puts MaskedString.instance_methods(false).sort.to_s
puts MaskedString.singleton_methods(false).sort.to_s #class methods

=end


#=begin

# Solution 2
module InstanceMethod
  define_method :tr_vowel do
    tr 'aeiou', '*'
  end
end

module ClassMethod
  self.instance_eval do
    define_method :tr_vowel do |str|
      str.tr 'aeiou', '*'
    end
  end
end

class_name = Class.new(String)
class_name.module_eval { extend ClassMethod }
class_name.instance_eval { include InstanceMethod }

puts class_name.tr_vowel "saeiouf" #=> s*****f
#=end

