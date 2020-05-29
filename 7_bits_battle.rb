# for each number, find the binary representation.
#   for odd numbers, count number of 1's
#   for even numbers, count number of 0's
#   0 is neutral
#   winner has higher score
#   tie if equal or if list empty
# prefix that appears in binary rep not counted


# Example:
# For an input list of [5, 3, 14]:

# odds: 5 and 3 => 101 and 11 => four 1s
# evens: 14 => 1110 => one 0
# Result: odds win the battle with 4-1

def bitsBattle(ary)
  odd_score = 0
  even_score = 0
  ary.each do |num|
    bin_num = num.to_s(2)
    if num.odd?
      odd_score += bin_num.count('1')
    elsif num.even? && num != 0
      even_score += bin_num.count('0')
    end
  end
  return "tie" if odd_score == even_score
  odd_score > even_score ? "odds win" : "evens win"
end

# p bitsBattle([5, 3, 14]) == 'odds win'
# p bitsBattle([3, 8, 22, 15, 78]) == 'evens win'
# p bitsBattle([]) == 'tie'
# p bitsBattle([1, 13, 16]) == 'tie'
p bitsBattle([6,0,1]) == 'tie'