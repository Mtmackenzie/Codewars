def find_sequence(n)
  arr = []
  (0..10).each { |num| arr << num}
  num = 10

  loop do

    num_arr = arr[-1].digits
    change = nil

    loop do
      change = false
      num_arr.each do |d|
        if num.digits.include?(d)
          num += 1
          change = true
        end
      end
      break if change == false
    end

    if arr.include?(num)
      num += 1
    else
      arr << num 
      num = 10
    end
    
    break if arr.size > n
  end
  arr
end


def find_num(n)
  return n if n < 11
    arr = []
  (0..10).each { |num| arr << num}
  num = 10

  loop do

    num_arr = arr[-1].digits
    change = nil

    loop do
      change = false
      num_arr.each do |d|
        if num.digits.include?(d)
          num += 1
          change = true
        end
      end
      break if change == false
    end

    if arr.include?(num)
      num += 1
    else
      arr << num 
      num = 10
    end
    
    break if arr.size > n
  end
  arr[n]
end


p find_num(1) == 1
p find_num(5) == 5
p find_num(11) #== 22
p find_num(100) == 103
p find_num(500) == 476