@students = []

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of save_students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(", ")
    file.puts csv_line
  end
  file.close
end

def print_menu
  puts "1. Input the students:"
  puts "2. Show the students"
  puts "3. Save the students to the students.csv"
  puts "9. Exit" # more options to come
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def input_students
  name = ''
  while true do
    puts "Please enter the names of the students or hit enter to escape"
    name = gets.chomp.capitalize
    if name.empty?
      break
    else
    input_cohort(name)
  end
  end
end

def input_cohort(name)
    cohort = ''
    # while true do
    puts "Please enter your cohort"
    cohort = gets.chomp.capitalize.to_sym
    cohort = :April if cohort.empty?
    # if
    options(name, cohort)
    # end
end

def options(name, cohort)
    @students << { name: name, cohort: cohort,
      hobbies: :'climbing, yoga, swimming, watching Netflix',
      country: :UK, height: :'158cm' }
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print_students_list
  count = 0
  while count < @students.length
    if @students[count][:name].chr == 'C' && @students[count][:name].length < 12
      puts "#{count +1}: #{@students[count][:name]}".center(40)
      puts "(#{@students[count][:cohort]} cohort)".center(40)
      puts "(Hobbies: #{@students[count][:hobbies]})".center(40)
      puts "(Country of birth: #{@students[count][:country]})".center(40)
      puts "(height: #{@students[count][:height]})".center(40)
      count += 1
    end
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students."
end

interactive_menu
print_header
print
print_footer
