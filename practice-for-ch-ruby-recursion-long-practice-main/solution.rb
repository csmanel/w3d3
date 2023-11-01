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


