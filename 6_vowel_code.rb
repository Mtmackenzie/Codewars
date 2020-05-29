VOWELS = %w(a e i o u)

def encode(s)
  s.each_char.map {|letter| VOWELS.include?(letter) ? (VOWELS.index(letter) + 1).to_s : letter}.join
end

def decode(s)
  s.each_char.map {|letter| (1..5).include?(letter.to_i) ? VOWELS[letter.to_i - 1] : letter}.join
end

p encode('hello') == 'h2ll4'
p encode('How are you today?') == 'H4w 1r2 y45 t4d1y?'
p encode('This is an encoding test.') == 'Th3s 3s 1n 2nc4d3ng t2st.'
p decode('h2ll4') == 'hello'