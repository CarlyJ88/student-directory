def input_students
  students = []

  puts "Please enter the names of the students"
  name = gets.chomp

  while !name.empty? do
    students << { name: name, cohort: :november,
      hobbies: :'climbing :yoga :swimming :watching Netflix', country: :UK, height: :'158cm' }
      name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print(students)
  students.each_with_index do |student, index|
    if student[:name].chars.first == 'C' && student[:name].length < 12
      puts "#{index +1}: #{student[:name]} (#{student[:cohort]} cohort)
      (Hobbies: #{student[:hobbies]}) (Country of birth: #{student[:country]}) (height: #{student[:height]})"
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end

students = input_students
print_header
print(students)
print_footer(students)
