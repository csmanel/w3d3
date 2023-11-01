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



