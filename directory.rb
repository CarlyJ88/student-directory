@students = []

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exits?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, the #{filename} doesn't exist"
    exit # quit the program
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.gsub(/\n/, '').split(', ')
    @students << { name: name, cohort: cohort.to_sym }
  end
  file.close
end

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
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the students to the students.csv"
  puts "4. Load list of students from a file"
  puts "5. Show list of students starting with letter 'C'"
  puts "6. Show list of students under 12 characters long"
  puts "7. Show students listed by cohort"
  puts "9. Exit" # more options to come
end

def show_students(symbol)
  print_header
  if symbol == :a
    print_students_list
  elsif symbol == :b
    print_students_list_starting_with_letter
  elsif symbol == :c
    print_students_under_length
  elsif symbol == :d
    print_students_by_cohort
  end
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students(:a)
  when "3"
    save_students
  when "4"
    load_students
  when "5"
    show_students(:b)
  when "6"
    show_students(:c)
  when "7"
    show_students(:d)
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.gsub(/\n/, ''))
  end
end

def input_students
  name = ''
  while true do
    puts "Please enter the names of the students or hit enter to escape"
    name = STDIN.gets.gsub(/\n/, '').capitalize
    if name.empty?
      break
    else
    input_cohort(name)
  end
  end
end

def input_cohort(name)
  cohort = ''
  puts "Please enter your cohort"
  cohort = STDIN.gets.gsub(/\n/, '').capitalize.to_sym
  cohort = :April if cohort.empty?
  options(name, cohort)
end

def options(name, cohort)
    @students << { name: name, cohort: cohort,
      hobbies: :'climbing, yoga, swimming, watching Netflix',
      country: :UK, height: :'158cm' }
      if @students.count == 1
        puts "Now we have #{@students.count} student"
      else
        puts "Now we have #{@students.count} students"
      end
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def student_profile(count)
  puts "#{count +1}: #{@students[count][:name]}".center(40)
  puts "(#{@students[count][:cohort]} cohort)".center(40)
  puts "(Hobbies: #{@students[count][:hobbies]})".center(40)
  puts "(Country of birth: #{@students[count][:country]})".center(40)
  puts "(height: #{@students[count][:height]})".center(40)
end

def print_students_list
  count = 0
  while count < @students.length
    student_profile(count)
    count += 1
  end
end

def print_students_list_starting_with_letter
  count = 0
  while count < @students.length
    if @students[count][:name].chr == 'C'
      student_profile(count)
    end
    count += 1
  end
end

def print_students_under_length
  count = 0
  while count < @students.length
    if @students[count][:name].length < 12
      student_profile(count)
    end
    count += 1
  end
end

def print_students_by_cohort
  @students.sort! do |student1, student2|
    student1[:cohort] <=> student2[:cohort]
  end
  print_students_list
end

def print_footer
  puts "Overall, we have #{@students.count} great students."
end

interactive_menu
