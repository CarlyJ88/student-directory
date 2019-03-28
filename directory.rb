students = []
def input_students(students)
  name = ''
  cohort = ''
  while true do
    puts "Please enter the names of the students or hit enter to escape"
    name = gets.chomp.capitalize
    if name.empty?
      break
    end
    puts "Please enter your cohort"
    cohort = gets.chomp.capitalize.to_sym
    cohort = :April if cohort.empty?
    options(students, name, cohort)
    end
end

def options(students, name, cohort)
    students << { name: name, cohort: cohort,
      hobbies: :'climbing, yoga, swimming, watching Netflix',
      country: :UK, height: :'158cm' }
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print(students)
  count = 0
  while count < students.length
    if students[count][:name].chr == 'C' && students[count][:name].length < 12
      puts "#{count +1}: #{students[count][:name]}".center(40)
      puts "(#{students[count][:cohort]} cohort)".center(40)
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

input_students(students)
print_header
print(students)
print_footer(students)

# def delete_cohort(students)
#   puts "Did you enter that correctly?"
#   answer = gets.chomp
#   if answer == 'no'
#     students.delete(:cohort)
#     puts "Please re-enter your cohort"
#     puts "To finish, just hit return twice"
#     cohort = gets.chomp.to_sym.capitalize
#   elsif answer == 'yes'
#     input_students
#   end
# end
