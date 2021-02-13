=begin
Input: string
Output: string in this format: "Range: hh|mm|ss Average: hh|mm|ss Median: hh|mm|ss"
Rules: There are a certain amount of runners. Numbers will be positive or null. In return value, use 0's, 01 or 00. If given string is '', return ''. Convert seconds float to integer
Problem: find range, average, and median of values.

Extract values themselves - return array of integers
- array of arrays called all_results
- given strings don't always have two numbers between each |
- change string into array form divided by commas and space, iterate over each element.
  - remove spaces, divide into three elements by '|' character
- return all_results

Make given format of times into floats
- Make integer nums in array into seconds
  - initialize lv seconds
  - multiply first int by 60*60 and add to seconds. Multiply second int by 60 and add to seconds. add third value to seconds.
  - return seconds

Range: highest value - lowest value.
- will there be values that are nill that I have to worry about?

Average: add all numbers together and then divide by total number count

Median: find if total number of numbers is even or odd. If odd, find value in the middle (...). If even, find average of two middle numbers.

Algo:
#stat
- extract_values => array of arrays of integers
- format_values => seconds float
- reverse_format => string
- seconds array should be sorted from low to high.
- count number of values, lv count
- Interpolate reverse_format of range, median, and average in final results string
=end

def extract_values(str)
  str.split(',').map do |set|
    set.split('|').map { |n| n.to_i }
  end
end

def format_values(arr)
  seconds = 0
  seconds += (arr[0].to_i * 60 * 60)
  seconds += (arr[1].to_i * 60)
  seconds += (arr[2].to_i)
end

def reverse_format_values(value)
  s, m, h = value % 60, value / 60 % 60, value / 60 / 60 % 60
  [h, m, s].map { |num| sprintf("%02d", num)}.join('|')
end

def range(arr)
  arr[-1] - arr[0]
end

def average(arr)
  arr.sum / arr.size
end

def median(arr)
  count = arr.size
  count.odd? ? arr[count / 2] : arr[(count / 2) - 1, 2].sum / 2
end

def stat(strg)
  return '' if strg.empty?
  all_results = extract_values(strg)
  seconds_arr = all_results.map { |race| format_values(race)}.sort
  total_range = reverse_format_values(range(seconds_arr))
  total_average = reverse_format_values(average(seconds_arr))
  total_median = reverse_format_values(median(seconds_arr))
  "Range: #{total_range} Average: #{total_average} Median: #{total_median}"
end

p stat("01|15|59, 1|47|16, 01|17|20, 1|32|34, 2|17|17") == "Range: 01|01|18 Average: 01|38|05 Median: 01|32|34"

p stat("02|15|59, 2|47|16, 02|17|20, 2|32|34, 2|17|17, 2|22|00, 2|31|41") == "Range: 00|31|17 Average: 02|26|18 Median: 02|22|00"

p stat("02|15|59, 2|47|16")

p stat("02|15|59")

p stat('')