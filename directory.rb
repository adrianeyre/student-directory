def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # Create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repat this code
  while !name.empty? do
    puts "Enter cohort: "
    cohort = gets
    cohort = cohort[0..-2]
    cohort.gsub!(" ","")
    cohort = "november" if cohort == ""
    cohort = cohort.to_sym
    puts "Enter hobbies: "
    hobbies = gets.chomp
    puts "Enter Country of Birth: "
    country = gets.chomp
    # add the student hash to the array
    students << {name: name, cohort: cohort, hobbies: hobbies, country: country}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Enter another name or hit return to finish: "
    name = gets.chomp
    p cohort
  end
  # return the array of students
  students
end

def print_header
  # and then print them
  puts "The students of Villians Academy"
  puts "-----------"
end

def print(students)
  # iteration around the students array
  students.each_with_index do |student,index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort, hobbies=#{student[:hobbies]}, Country of Birth=#{student[:country]})"
  end
  puts
end

def print_while(students)
  # iteration around the students array
  puts "Displaying students using a WHILE"
  index = 0
  while index < students.count do
    puts "#{index+1}. #{students[index][:name]} (#{students[index][:cohort]} cohort)"
    index += 1
  end
  puts
end

def print_footer(students)
  # finally, we print the total number of students
  puts "Overall, we have #{students.count} great student#{"s" if students.count > 1}"
end

def display_by_letter(students,letter)
  # iteration around the students array
  puts "Displaying students that begin with the letter #{letter}"
  students.each_with_index do |student,index|
    if letter.downcase == student[:name][0]
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
  puts
end

def display_less_twelve(students)
  # iteration around the students array
  puts "Displaying students that are less than 12 in length"
  students.each_with_index do |student,index|
    if student[:name].length < 12
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
  puts
end

def align_students(students)
  # align the student names
  cen = 0
  # work out which has the longest name
  students.each do |name|
    cen = name[:name].length if name[:name].length > cen
  end
  cen += 4
  puts "Centre".center(cen)
  # Centre the names
  students.each do |name|
    puts name[:name].center(cen)
  end
  puts
end

def display_group(students)
  puts "Sorted by COHORT name"
  # sort the students array
  students.sort! {|a,b| a[:cohort]<=>b[:cohort]}
  print_header
  print(students)
  print_footer(students)
end

# Nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
puts
display_by_letter(students,"a")
display_less_twelve(students)
print_while(students)
align_students(students)
display_group(students)
