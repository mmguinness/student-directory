@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    extract_student_info(name)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def save_students
  puts "Save location?"
  filename = STDIN.gets.chomp
  File.open(filename, "w") do |f|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      f.puts student_data.join(",")
    end
  end
end

def start_file
  puts "Do you want to load student files Y/N?"
  answer = STDIN.gets.chomp
  answer.chr == "N" ? (puts "Cool beans") : (load_students)
end

def extract_student_info(name)
  @students << {name: name, cohort: :november}
end

def load_students
  puts "File location?"
  filename = STDIN.gets.chomp
  if File.exists?(filename)
    File.open(filename, "r") do |f|
      f.readlines.each do |line|
        name, cohort = line.chomp.split(',')
        extract_student_info(name)
      end
    end
    puts "Loaded #{@students.count} students from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
  end
end

def print_header
  puts "The students of my cohort at Makers"
  puts "------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1", "1." 
    confirmation
    input_students
  when "2", "2."
    confirmation
    show_students
  when "3", "3."
    confirmation
    save_students
  when "4", "4."
    confirmation
    load_students
  when "9", "9."
    confirmation
    exit
  else 
    puts " I don't know what you meant, try again"
  end
end

def confirmation
  puts "Input accepted."
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

start_file
interactive_menu
