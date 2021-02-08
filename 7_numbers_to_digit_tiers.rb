# 7 Number to digit tiers
# Create a function that takes a number and returns an array of strings containing the number cut off at each digit.

# Examples
# 420 should return ["4", "42", "420"]
# 2017 should return ["2", "20", "201", "2017"]
# 2010 should return ["2", "20", "201", "2010"]
# 4020 should return ["4", "40", "402", "4020"]
# 80200 should return ["8", "80", "802", "8020", "80200"]
# PS: The input is guaranteed to be an integer in the range [0, 1000000]

=begin
Input: integer
Output: array of string integers
Rules: between 0 and a million. if just one number, will only convert that one number to string, add to array, and stop
Problem: take given number, convert to string, prepend to array, remove last digit, repeat until no more digits
DS: integer, strings, array

Algo: 
initialize a result array, []
initialize lv string_num, assign to the return value of converting a given num to a string
until the string_num is equal to "", prepend string_num to result
remove last character from string_num
- convert to array, remove last character
  - call pop on return value of chars called on string, convert back to string with .to_s, reassign string_num to this new value

Return results array
=end

# def create_array_of_tiers(num)
#   result = []
#   string_num = num.to_s
#   until string_num == ''
#     result.prepend(string_num)
#     string_num = string_num.chars[0..-2].join
#   end
#   result  
# end

# Vic's solution
# def create_array_of_tiers(num)
#   (1..num.to_s.size).map { |len| num.to_s[0, len] }
# end

# broken down

def create_array_of_tiers(num)
  length = num.to_s.size

  (1..length).map do |n|
    ns = num.to_s
    ns[0, n]
  end
end

p create_array_of_tiers(420)