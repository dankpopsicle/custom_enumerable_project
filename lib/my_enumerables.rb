module Enumerable

  def my_each
    i = 0
    while i < self.length
      yield self[i]
      i += 1
    end
    self
  end

  def my_all?
    my_each do |x|
      if (yield x) == false
        return false
      end
    end
    return true
  end

  def my_any?
    my_each do |x|
      if (yield x) == true
        return true
      end
    end
    return false
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