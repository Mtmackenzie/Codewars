def productFib(prod)
  first = 0
  last = 1

  loop do 
    break if first * last >= prod
    first, last = last, first + last
  end
  first * last == prod ? [first, last, true] : [first, last, false]
end

p productFib(4895) == [55, 89, true]
p productFib(5895) == [89, 144, false]