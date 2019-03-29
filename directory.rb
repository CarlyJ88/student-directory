students = []

def interactive_menu(students)
  # students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students:"
    puts "2. Show the students"
    puts "9. Exit" # more options to come
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      input_students(students)
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end

def input_students(students)
  name = ''
  while true do
    puts "Please enter the names of the students or hit enter to escape"
    name = gets.chomp.capitalize
    if name.empty?
      break
    else
    input_cohort(students, name)
  end
  end
end

def input_cohort(students, name)
    cohort = ''
    # while true do
    puts "Please enter your cohort"
    cohort = gets.chomp.capitalize.to_sym
    cohort = :April if cohort.empty?
    # if
    options(students, name, cohort)
    # end
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

interactive_menu(students)
# input_students(students)
print_header
print(students)
print_footer(students)
