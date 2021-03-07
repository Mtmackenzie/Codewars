=begin
Input: integer
Output: 
Rules: 
Problem:
find fibonacci number with given number
find # of times each digit is present in fib number
  iterate over range of numbers 0 to 9 converted to array and find count for each number present in string version of fib number. transform values at each index to count.
find maxcount, the digit with highest count and its count (if ties, find first)
  find max number in count array, find its index
break up fib number into chunks of 25, find last chunk (could be less than 25)
  find size of fib number converted into a string
  use remainder method to find size of remainder chunk
  use string reference to only reference that amount of characters from the end of the string
    str[-(str.size % 25)..-1] if size is not evenly divisible by 25. Otherwise, string reference for last 25 letters. str[-25..-1]
return: "Last chunk 56699078708088; Max is 18 for digit 8"
DS: range, string
Algo: 
=end
    
# Find fib of value
def fibonacci(n)
  n1, n2 = 0, 1
  n.times { n1, n2 = n2, n1 + n2 }
  n1
end

def around_fib(n)
  fib = fibonacci(n).to_s
  cnt = ('0'..'9').map { |n| fib.count(n) }
  last = fib.size % 25
  last = 25 if last == 0
  "Last chunk #{fib[-last..-1]}; Max is #{cnt.max} for digit #{cnt.index(cnt.max)}"
end

p around_fib(666) == "Last chunk 56699078708088; Max is 18 for digit 8"
p around_fib(934) == "Last chunk 78863403327510987087; Max is 30 for digit 7"