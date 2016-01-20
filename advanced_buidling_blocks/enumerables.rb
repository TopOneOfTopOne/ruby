#apologies could be clearer
#basic function of each method replicated here

module Enumerable

  def my_each
    return self unless block_given?
    for index in 0...length
      yield self[index]
    end
  end

  def my_each_with_index
    return self unless block_given?
    for index in 0...length
      yield self[index],index
    end
  end

  def my_select
    return self unless block_given?
    result = []
    self.my_each do |elem|
      result << elem if yield elem
    end
    result
  end

  def my_all?
    return self unless block_given?
    self.my_each do |elem|
      return false unless yield elem
    end
    return true
  end

  def my_any?
    return self unless block_given?
    self.my_each do |elem|
      return true if yield elem
    end
    return false
  end

  def my_none?
    return self unless block_given?
    self.my_each do |elem|
      return false if yield elem
    end
    return true
  end

  def my_count
    count = 0
    self.my_each do |elem|
      count += 1 if yield elem
    end
    return count
  end

  def my_map(proc=nil)
    res = []
    self.my_each do |elem|
      if proc
        res << (proc.call elem)
      else
        res << (yield elem)
      end
    end
    return res
  end

  def my_inject(start_num = 0)
    total = start_num
    self.my_each do |elem|
      total = (yield total,elem)
    end
    return total
  end
end

#tf is point of multiply_els????

proc = Proc.new do |x|
  x + 2
end

p([1,1,2,2,4].my_map {|x| x+2})#debugging

