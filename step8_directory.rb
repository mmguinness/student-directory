def input_students
  puts "Please enter the names of the students, followed by their hobbies"
  puts "To finish, just hit return twice"
  # create and empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty repeat this code
  while !name.empty? do
    #add the student hash to the array
    puts "Fav hobby"
    hobby = gets.chomp
    students << {name: name, cohort: :november, hobby: hobby}
    puts "Now we have #{students.count} students"
    # get annother name from the user
    name = gets.chomp
  end
  # Return the array of students
  students
end

def print_header
  puts "The students of my cohort at Makers"
  puts "------------"
end

def print(students)
  while students.size >= 1
    puts "#{students[0][:name]} likes #{students[0][:hobby]}"
    students.shift
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)