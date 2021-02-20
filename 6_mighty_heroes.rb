=begin
Input: heads, n, swings (all integers)
Output: integer
Rules: what if any of the numbers is 0?
Problem: iterate over range of numbers starting from 1 to swings, each time reassigning the heads lv to the result of this equation: heads = heads - 1 + ((1 multiplied by all numbers up to current swing) * muliplier), incrementing swing as well

DS: integers, range

Algo:
def a method count of heads with three params
  swing = 1
  call a loop
    find 1 up to swing multiplied together
    reassign heads to the return value of heads - 1 + (n * s)
    reassign swing to itself plus 1
    break out of loop if swing is greater than swings
  return heads
=end

def count_of_heads(heads, n, swings)
  swing = 1
  until swing > swings
    s = (1..swing).reduce(:*)
    heads = heads - 1 + (n * s)
    swing += 1
  end
  heads
end

def count_of_heads(heads, n, swings)
  1.upto(swings) { |s| heads = heads - 1 + ((1..s).reduce(:*) * n) }
  heads
end

p count_of_heads(2, 1, 1) == 2

p count_of_heads(5, 10, 3) == 92