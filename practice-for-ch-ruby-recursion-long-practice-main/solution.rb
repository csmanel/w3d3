def range(first, last)
  return [] if last <= first
  return [first] + range(first + 1, last)
end

# p range(1, 25)

def array_sum(array)
  return 0 if array.empty?
  return array[0] + array_sum(array[1..-1])
end

# p array_sum([1, 2, 3, 4, 5])

def exp(base, power)
  return 1 if power == 0
  return base * exp(base, power - 1)
end

def exp_two(base, power)
  return 1 if power == 0
  return base if power == 1

  if power.even?
    result = exp_two(base, power / 2)
    return result * result
  else
    result = exp_two(base, (power - 1))
    base * ((result / 2) * result )
  end
end

# p exp_two(2, 2)
# p exp_two(2, 3)


class Array
  def deep_dup
    new_arr = []
    self.each do |el|
      if el.is_a?(Array)
        new_arr << el.deep_dup
      else
        new_arr << el
      end
    end
    new_arr
  end
end


# array = [1, [2], [3, [4]]]
# p array.deep_dup


def fib(n)
  return [1, 1].take(n) if n <= 2

  result = fib(n-1)
  return result << result[-2] + result[-1]
end

# p fib(40)

def bsearch(arr, target)
  middle_idx = arr.length / 2
  return middle_idx if target == arr[middle_idx] 
  return nil if arr.length <= 1
  left = bsearch(arr[0...middle_idx], target)
  right = bsearch(arr[middle_idx + 1..-1], target) 

  if !left && !right 
    return nil
  elsif target < arr[middle_idx]
    left
  else
    right + middle_idx + 1
  end
end

p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
p bsearch([1, 2, 3], 1) # => 0
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
