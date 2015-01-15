class I
  def like arg
    puts "%s %s %s" % [self.class, self.class.instance_methods(false), arg]
  end
end

c, m, arg = gets.split  # input 'I like metaprogramming.'

# write your code here to display 'I like metaprogramming.'
# Hints: const_get, send

class I
  def self.instance_methods(search_superclass = true)
    methods = super(search_superclass)
    methods[0].to_s
  end
end

Object.const_get(c).new.send(m, arg)

