require 'pry'

class LunchRoulette
  DENVER_EMPLOYEES = [
    
    "Audrey Hepburn",
    "Sean Connery",
    "Daniel Craig",
    "Judi Dench",
    "Joanna Lumley",
    "Keira Knightly",
    "Alan Sugar",
    "David Beckham",
    "Jennifer Anniston",
    "Kate Middleton",
    "Angelina Jolie",
    "Simon Cowell",
    "Sienna Miller",
    "Cheryl Cole",
    "Victoria Beckham",
    "Tom Cruise",
    "Jessica Ennis"

  ]

  EXECUTIVES_AND_MANAGERS = [
    "John Lennon",
    "Stephen Fry",
    "Brad Pitt",
    "Holly Willoughby",
    "Helen Mirren",
    "Boris Johnson"
  ]

  def initialize()
    @groups = []
    @execs = EXECUTIVES_AND_MANAGERS.shuffle
    @emps  = DENVER_EMPLOYEES.shuffle
  end

  def create_groups
    while @execs.length > 0 || @emps.length > 0 do
      create_another_group
    end
    @groups
  end

  def create_another_group
    if @execs.length > 0
      build_group_with_one_exec
    else
      build_group_of_only_employees
    end
  end

  def build_group_of_only_employees
    arr = []
    until arr.length == 4 do
      add_emp(arr)
    end
    @groups << arr
  end

  def build_group_with_one_exec(arr = [])
    add_exec(arr)
    until arr.length == 4 do
      add_emp(arr)
    end
    @groups << arr
  end

  def add_exec(arr = [])
    arr << @execs.pop
  end

  def add_emp(arr = [])
    arr << @emps.pop
  end
end

lr = LunchRoulette.new
all_groups = lr.create_groups
all_groups.each_with_index do |group, index|
  puts "Group ##{index + 1}: #{group.join(", ")}"
end
