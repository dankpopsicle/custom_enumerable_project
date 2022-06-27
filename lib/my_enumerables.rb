module Enumerable

  def my_each
    for num in self do
      yield num
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

  def my_count
    if block_given?
      count = 0
      my_each do |x|
        if (yield x) == true
          count += 1
        end
      end
      return count
    else
      return self.length
    end
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield((self[i]), i)
      i += 1
    end
    self
  end

  def my_inject(init_value)
    sum = init_value
    my_each do |x|
      sum = (yield(sum, x))
    end
    sum
  end

  def my_map
    array = []
    my_each do |x|
      array << (yield x)
    end
    array
  end
  
  def my_none?
    my_each do |x|
      if (yield x) == true
        return false
      end
    end
    return true
  end

  def my_select
    array = []
    my_each do |x|
      if (yield x) == true
        array << x
      end
    end
    array
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