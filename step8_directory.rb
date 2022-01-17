def input_students
  puts "Please enter the names of the students, followed by their cohort"
  puts "To finish, just hit return twice".center(65)
  # create and empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty repeat this code
  while !name.empty? do
    puts "Cohort".center(65)
    cohort = gets.chomp
      if cohort != "Jan 2022"
      puts "Did you mean January 2022?"
      answer = gets.chomp
        if answer == "\n" then cohort = "Jan 2022" end
        if answer == "yes" then cohort = "Jan 2022" end
      end
    students << {name: name, cohort: cohort}
    if students.size == 1
      puts "Now we have #{students.count} student".center(65)
    else
      puts "Now we have #{students.count} students".center(65)
    end
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
  cohort_options = []
  students.select do |student|
    cohort_options << student[:cohort]
  end
  cohort_options.uniq!
  puts "The students by cohort:".center(65)

  
  while cohort_options.size >= 1
    puts cohort_options[0].upcase.center(65, " * ")
    students.select do |student|
      if student[:cohort] == cohort_options[0]
      puts "#{student[:name]}".center(65)
      end
    end
    cohort_options.shift
  end
end

def print_footer(students)
  puts "Overall, we have #{students.size} great students".center(65)
end

students = input_students
print(students)