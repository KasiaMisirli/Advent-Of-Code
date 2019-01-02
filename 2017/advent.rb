
digits = File.open("data.txt").read.chomp.chars.map(&:to_i)

sum = 0
digits.each_with_index{|number, index| 
  if digits[(index+1) % digits.count] == number
    sum += number
  end
}

puts sum
