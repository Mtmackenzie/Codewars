=begin
Input: string
Output: string
Rules: only count lowercase letters. No letter will appear more than 9 times.
Problem: iterate over a range of alphabet letters and count # of occurences in given string, then transform the letter into the amount of occurrences (string form integer) and return string.

=end

def decrypt(key)
  ('a'..'z').map { |l| key.count(l) }.join
end

p decrypt('$aaaa#bbb*ccfff!z') == '43200300000000000000000001'
p decrypt('z$aaa#ccc%eee1234567890') == '30303000000000000000000001'
p decrypt('the quick brown fox jumps over the lazy dog') == '11113112111111411212211111'