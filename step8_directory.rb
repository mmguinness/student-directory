def input_students
  puts "Please enter the names of the students, followed by their hobbies"
  puts "To finish, just hit return twice".center(65)
  # create and empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty repeat this code
  while !name.empty? do
    #add the student hash to the array
    puts "Fav hobby".center(65, ' <   > ')
    hobby = gets.chomp
    students << {name: name, cohort: :november, hobby: hobby}
    puts "Now we have #{students.count} students".center(65)
    # get annother name from the user
    name = gets.chomp
  end
  # Return the array of students
  students
end

def print_header
  puts "The students of my cohort at Makers".center(65)
  puts "------------".center(65, '-')
end

def print(students)
  while students.size >= 1
    puts "#{students[0][:name]} likes #{students[0][:hobby]}".center(65, ' * ')
    students.shift
  end
end

def print_footer(students)
  puts "Overall, we have #{students.size} great students".center(65)
end

students = input_students
print_header
print_footer(students)
print(students)
