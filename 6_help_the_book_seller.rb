=begin
Input: array of strings (stocklist) and array of strings(category list). Each string element in stocklist array contains a set of characters followed by space followed by integer in string form.
Output: String with the following format for each category: (C : 11) and each separated by a -
Rules: Return '' if stocklist or categories is empty. Result must be ordered according to M order.
Problem: Iterate over category array and use each element to then iterate over the elements in the stocklist. Every time the string starts with that letter, extract the numbers and then add them together for that letter's final sum.
Format the final output correctly.

DS: array, hash?

Algo: 
def method called stockList(list_of_art, list_of_cat)
  iterate (transformation) over list_of_cat, parameter: c
    initialize lv sum, set to 0
    iterate over list_of_art, parameter: a
      if a starts with c, then extract numbers, convert to integers, add to sum (reassign sum to itself plus integer)
    return the formatted string with c and sum interpolated
  join together final version with a ' - '


Notes: based on final tests, it seems like they also want you to return an empty string if all of the sums are zero. I could extract all nums from final string above to check for this, but that's not going to be very readable

Hash-based alternative
def method called stockList(list_of_art, list_of_cat)
  initialize a lv results, set to empty hash
  iterate over list_of_cat, parameter: c
    add hash-value pair with key c and value integer 0 to results
    iterate over list_of_art, a
      check to see if a starts with c. If so, 
        extract numbers from string, turn into integer
        reassign value at that c to value itself plus integer
    end list_of_art iteration 
  end list_of_cat iteration
  check sum of all values. If sum is greater than 0, convert hash to array and transform each inside array to string formatted correctly, then join together with spaces and hyphen
=end

# Version 1
def stockList(list_of_art, list_of_cat)
  return '' if list_of_art == '' || list_of_cat == ''

  list_of_cat.map do |c|
    sum = 0

    list_of_art.each do |a|
      if a.start_with?(c)
        sum += a.chars.select { |i| i if ('0'..'9').include?(i) }.join.to_i
      end
    end

    "(#{c} : #{sum})"
  end.join(' - ')

end

# Version 2
def stockList(list_of_art, list_of_cat)
  return '' if list_of_art == '' || list_of_cat == ''
  results = {}

  list_of_cat.each do |c|
    results[c] = 0
    list_of_art.each { |a| results[c] += a.scan(/\d/).join.to_i if a.start_with?(c) }
  end
  
  return '' if results.values.sum == 0
  results.map { |k, v| "(#{k} : #{v})" }.join(' - ')
end

b = ["ABAR 200", "CDXE 500", "BKWR 250", "BTSQ 890", "DRTY 600"]
c = ["A", "B"]
res = "(A : 200) - (B : 1140)"

p stockList(b, c) #== res