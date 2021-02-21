=begin
Input: array
Output: array with one extra item, 0
Rules: if given empty array, return array with 0 in it. be aware of performance.
Problem: the easiest way is to just iterate transformatively over elements and find sum of remaining elements each time. But this seems slow since the sum method will need to be called each time.
initialize lv results pointing to array of given array's size plus one more element, containing all zeroes.?
initialize lv, sum, set to 0.
iterate over results transformatively, with param n and idx
increment sum by itself plus element at ls[idx] unless idx is 0. next?
set item at index of results to point to current sum value
return results reversed

DS: array
=end

def parts_sums(ls)
  sum = 0
  results = Array.new(ls.size + 1, 0)
  results.map.with_index do |n, i|
    if i == 0
      0
    else
      sum += ls[-i]
      n = sum
    end
  end.reverse
end

def parts_sums(ls)
  sum = 0
  results = Array.new(ls.size + 1, 0)
  results.map.with_index { |n, i| i == 0 ? 0 : sum += ls[-i] }.reverse
end

ls = [1, 2, 3, 4, 5, 6] 
p parts_sums(ls) == [21, 20, 18, 15, 11, 6, 0]

ls = [744125, 935, 407, 454, 430, 90, 144, 6710213, 889, 810, 2579358]
p parts_sums(ls) == [10037855, 9293730, 9292795, 9292388, 9291934, 9291504, 9291414, 9291270, 2581057, 2580168, 2579358, 0]