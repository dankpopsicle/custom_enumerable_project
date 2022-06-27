module Enumerable
  def my_all?
    i = 0
    while i < self.length
      yield self[i]
      if (yield self[i]) == false
        return false
        i = self.length
      elsif i == (self.length - 1) && (yield self[i]) == true
        return true
      else 
        i += 1
      end
    end
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    i = 0
    while i < self.length
      yield self[i]
      i += 1
    end
    self
  end
end