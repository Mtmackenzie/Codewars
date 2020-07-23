=begin
Input: string
Output: string
Problem: 
rotate, direction method  - 3 params: string, direction, n
- if direction is to the right
  - pop off last character and add to the front
- if direction is to the left
  - pop off first character and add to the end

remove all spaces from a copy string. remove last 10 characters and add to the front OR rotate to right n times
insert spaces by comparing to original
  - iterate over the comparison string and every time there's a space, add a space to the index of the new string
split up the string by spaces
iterate over each set of chars and rotate characters to the right n times, convert back into a string

complete whole process 10 times

prepend n.to_s to the front of the resulting string with a space

=end

def rotate(string, direction, n)
  if direction == :right
    n.times do
      char = string.slice!(-1)
      string = char + string
    end
    string
  else
    n.times do
      char = string.slice!(0)
      string = string + char
    end
    string
  end
end

def insert_spaces(original, new)
  original.chars.each_with_index do |char, idx|
    new.insert(idx, ' ') if char == ' '
  end
  new
end

def encode(n, s)
  string = s.clone
  string.gsub!("\n", "~")
  
  n.times do
    string.gsub!(' ', '')
    string = rotate(string, :right, n)

    string = insert_spaces(s, string)
    string = string.split(' ').map do |chars|
      rotate(chars, :right, n)
    end.join
    string = insert_spaces(s, string)
  end
  
  string = string.gsub("~", "\n")
  n.to_s + ' ' + string
end

def decode(s)
  string = s.clone
  string.gsub!("\n", "~")

  n = []
  index = 0
  
  while string.slice(index) != ' '
    n << string.slice!(index)
  end
  
  n = n.join('').to_i
  string.slice!(0)
  comparison_string = string.clone
  
  n.times do
    string = string.split(' ').map do |chars|
      rotate(chars, :left, n)
    end.join
    
    string = insert_spaces(comparison_string, string)

    string.gsub!(' ', '')

    string = rotate(string, :left, n)
    string = insert_spaces(comparison_string, string)
  end
  string.gsub("~", "\n")
end

quote = 'If you wish to make an apple pie from scratch, you must first invent the universe.'
solution = '10 hu fmo a,ys vi utie mr snehn rni tvte .ysushou teI fwea pmapi apfrok rei tnocsclet'
# encoded_string = encode(10, quote)
# p decode(encoded_string) #== quote

problem = "As I was going up the stair\nI met a man who wasn't there!\nHe wasn't there again today,\nOh how I wish he'd go away!"
p problem
p decode("36 ws h weA dgIaa ug owh n!asrit git \n msm phw teaI'e tanantwhe reos\ns ther! aHeae 'gwadin\nt haw n htoo ,I'i sy aohOy")

# p encoded_string
# p quote

# Notes: passed tests but timed out on random tests
# https://www.codewars.com/kata/5a3357ae8058425bde002674/solutions/ruby/all/best_practice