def input_students
  students = []

  puts "Please enter the names of the students"
  name = gets.chomp

  puts "Please enter your cohort"
  puts "To finish, just hit return twice"
  cohort = gets.chomp
  cohort = 'April' if cohort.empty?

  while !name.empty? && !cohort.empty? do
    students << { name: name, cohort: cohort,
      hobbies: :'climbing, yoga, swimming, watching Netflix',
      country: :UK, height: :'158cm' }
      name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print(students)
  count = 0
  while count < students.length
  # students.each_with_index do |student, index|
    if students[count][:name].chr == 'C' && students[count][:name].length < 12
      puts "#{count +1}: #{students[count][:name]}".center(40)
      puts  "(#{students[count][:cohort]} cohort)".center(40)
      puts "(Hobbies: #{students[count][:hobbies]})".center(40)
      puts "(Country of birth: #{students[count][:country]})".center(40)
      puts "(height: #{students[count][:height]})".center(40)
      count += 1
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
