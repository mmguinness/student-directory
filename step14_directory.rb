require 'csv'
@students = []

def start_file
  puts "Do you want to load student files Y/N?"
  answer = STDIN.gets.chomp
  answer.chr == "N" ? (puts "Cool beans") : (load_students)
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
end


def process(selection)
  confirmation
  case selection
  when "1", "1." then input_students
  when "2", "2." then show_students
  when "3", "3." then save_students
  when "4", "4." then load_students
  when "9", "9." then exit
  else puts " I don't know what you meant, try again"
  end
end

def confirmation
  puts "Input accepted."
end

def show_students
  print_header
  print_student_list
  print_footer
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def save_students
  puts "Save location?"
  filename = STDIN.gets.chomp
  CSV.open(filename, "w") do |csv|
    @students.each do |student|
      csv_line = student[:name]
      csv << [csv_line]
    end
  end   
end

def load_students
  puts "File location?"
  filename = STDIN.gets.chomp
  if File.exists?(filename)
    CSV.foreach(filename) do |row|
      name, cohort = row
      @students << {name: name, cohort: :november}
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

start_file
interactive_menu