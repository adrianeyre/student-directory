# let's put all students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
def print_header
  # and then print them
  puts "The students of Villians Academy"
  puts "-----------"
end

def print(names)
  # iteration around the students array
  names.each do |name|
    puts name
  end
end

def print_footer(names)
  # finally, we print the total number of students
  puts "Overall, we have #{names.count} great students"
end

# Nothing happens until we call the methods
print_header
print(students)
print_footer(students)
