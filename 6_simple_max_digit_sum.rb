=begin
Input: integer
Output: integer
Rules: digits must have highest sum
Problem:

DS:

Algo:


if the last num is greater than zero, subtract 1 from it
if last num is zero, subtract 1 from second to last num unless num array's size is less than 2
make all other numbers 9 unless num array's size is less than 2

if num_array's size is greater than or equal to 2
  - subtract 1 from last digit
    - if last digit is equal to 0, subtract 1 from second to last digit
      - make all other digits equal to 9
    - if the array's size is greater than 2, make all other digits equal to 9
if less than 2, return num

check to see if new num's sum is greater than original num's sum

=end
require 'pry'

def solve(n)

  current_array = n.digits.reverse
  highest_num = n
  highest_sum = n.digits.sum
  
  return n if n < 10

  index = -1

  loop do
    if current_array[index - 1] == nil
      break
    elsif current_array[index] <= current_array[index - 1]
      current_array[index - 1] -= 1
      current_array[index] = 9
      loop do
        index += 1
        break if index == 0
        current_array[index] = 9
        if current_array.sum > highest_sum
          highest_num = current_array.join.to_i
          highest_sum = 
        end
      end
      index = -1
    end
    
    index -= 1
    break if index.abs > current_array.size
  end
  if current_array.sum > highest_num.digits.sum
     highest_num = current_array.join.to_i
  end
  highest_num
end



p solve(10)
p solve(58)
p solve(120)
p solve(79000) #== 78999,   getting 69999
p solve(99900) # 99899      89999
p solve(2220) # 1999 instead of 2219