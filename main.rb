require_relative 'enumerable'
NUMBERS = [1, 2, 3, 4, 5]

puts '--- #my_each vs ruby\'s #each ---'
puts '#my_each'
p NUMBERS.my_each { |element| puts element }
puts '#each'
p NUMBERS.each { |element| puts element }

puts '--- #my_each_with_index vs ruby\'s #each_with_index ---'
puts '#my_each_with_index'
p NUMBERS.my_each_with_index { |el, idx| puts "#{idx}: #{el}" }
puts '#each_with_index'
p NUMBERS.each_with_index { |el, idx| puts "#{idx}: #{el}" }

puts '--- #my_select vs ruby\'s #select ---'
puts '#my_select'
p NUMBERS.my_select { |el| el if el == 2 || el == 5 }
puts '#select'
p NUMBERS.select { |el| el if el == 2 || el == 5 }

puts '--- #my_all? VS #all? ---'
puts '#my_all? without arguments'
p NUMBERS.my_all?
puts '#my_all? with argument'
p NUMBERS.my_all?(5)
puts '#my_all? with block'
p NUMBERS.my_all? { |el| el.positive? }
puts '#all? without arguments'
p NUMBERS.all?
puts '#all? with argument'
p NUMBERS.all?(5)
puts '#all? with block'
p NUMBERS.all? { |el| el.positive? }

puts '--- #my_any? VS #any? ---'
puts '#my_any? without arguments'
p NUMBERS.my_any?
puts '#my_any? with argument'
p NUMBERS.my_any?(5)
puts '#my_any? with block'
p NUMBERS.my_any? { |el| el.negative? }
puts '#any? without arguments'
p NUMBERS.any?
puts '#any? with argument'
p NUMBERS.any?(5)
puts '#any? with block'
p NUMBERS.any? { |el| el.negative? }

puts '--- #my_none? VS #none? ---'
puts '#my_none? without arguments'
p NUMBERS.my_none?
puts '#my_none? with argument'
p NUMBERS.my_none?(5)
puts '#my_none? with block'
p NUMBERS.my_none? { |el| el.negative? }
puts '#none? without arguments'
p NUMBERS.none?
puts '#none? with argument'
p NUMBERS.none?(5)
puts '#none? with block'
p NUMBERS.none? { |el| el.negative? }

puts '--- #my_count VS #count ---'
puts '#my_count without arguments'
p NUMBERS.my_count
puts '#my_count with argument'
p NUMBERS.my_count(5)
puts '#my_count with block'
p NUMBERS.my_count { |el| el.between?(2, 5) }
puts '#count without arguments'
p NUMBERS.count
puts '#count with argument'
p NUMBERS.count(5)
puts '#count with block'
p NUMBERS.count { |el| el.between?(2, 5) }

puts '--- #my_map VS #map ---'
puts '#my_count with block'
p NUMBERS.my_map { |el| el*2 }
puts '#map with block'
p NUMBERS.map { |el| el*2 }

puts '--- #my_inject VS #inject ---'
puts '#my_inject with block'
p NUMBERS.my_inject { |sum, val| sum + val }
p NUMBERS.my_inject(:+)
puts '#my_inject with block and initial sum'
p NUMBERS.my_inject(10) { |sum, val| sum + val }
puts '#my_inject with block and initial sum and symbol'
p NUMBERS.my_inject(20, :+)
puts '#inject with block'
p NUMBERS.inject { |sum, val| sum + val }
p NUMBERS.inject(:+)
puts '#inject with block and initial sum'
p NUMBERS.inject(10) { |sum, val| sum + val }
puts '#inject with block and initial sum and symbol'
p NUMBERS.inject(20, :+)

def multiply_els(ary)
  ary.my_inject(:*)
end

p multiply_els([2, 4, 5])

proc_obj = Proc.new { |el| el + 69 }

p NUMBERS.my_map(proc_obj)
p NUMBERS.my_map(proc_obj) { |el| el - 69 }