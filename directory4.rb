require 'csv'
@students = [] # Create a global array

def input_students
  puts "Please enter the names of the students\nTo finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_student name
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = gets.chomp
  end
end

def print_header
  puts "The students of my cohort at Makers Academy\n-----------------------"
end

def print_student_list
  if @students.length != 0
    @students.each {|student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
  else
    puts "There are 0 students!"
  end
  puts
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def interactive_menu
  loop do
    print_menu
    result = menu_process(STDIN.gets.chomp)
    puts result if result != nil
  end
end

def menu_process(selection)
  case selection
    when "1" ; input_students
    when "2" ; show_students
    when "3" ; filename = ask_filename ; save_students(filename)
    when "4" ; filename = ask_filename ; load_students(filename)
    when "9" ; exit
    else ; return "#{selection} is not a valid selection"
  end
end

def print_menu
  puts "1. Input the Students\n2. Show the Students\n3. Save the list to students.csv\n4. Load the list from students.csv\n9. Exit"
end

def show_students
  print_header ; print_student_list ; print_footer
end

def ask_filename
  puts "Please enter the filename: "
  filename = gets.chomp
end

def save_students(filename="students.csv")
  # open the file for writing
  File.open(filename,"w") do |f|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      f.puts csv_line
    end
  end
end

def add_student(name,cohort="november")
  @students << {name: name, cohort: cohort.to_sym}
end

def load_students(filename="students.csv")
  filename = "students.csv" if filename == ""
  if File.exists?(filename)
    File.open(filename,"r") do |f|
      while line = f.gets
        name,cohort = line.chomp.split(",")
        add_student name, cohort
      end
    end
  else
    puts "Filename does not exist!"
  end
end

def try_load_students
  filename = ARGV.first # Obtain 1st argument from command line
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist!"
    exit
  end
end

try_load_students
interactive_menu
