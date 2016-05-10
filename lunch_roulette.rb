require 'pry'

class LunchRoulette
  DENVER_EMPLOYEES = [  
    "Alison Schreiber", "Allison Obenchain", "Ashley Bailey", "Bao Nguyen", "Ben Howell", "Brian Eldredge", "Cindy Wernsman", "Dana Goodson", "David Candler", "David Oliver",
    "David Tetley", "Deidre Hodges", "Dominic LeVasseur", "Dylan Volz", "Emily Dowdle", "Ian Retzlaff", "Jake O'Brien", "James Billings", "Jason Deleeuw",
    "Jeff Hyde", "Jeremy Scott", "Joseph Weizenecker", "Kenan Degirmenci", "Laura Roberts", "Lauren Culler", "Lizzi Kongsvik", "Loren Nozot", "Maureen Dempsey", "Mike Justus",
    "Nicole Jayne", "Ross Edfort", "Sally Wallington", "Sergio Nazzaro", "Sheri Dethlefs", "Spenser Hang", "Steve Goldman", "Sven Peterson", "Szymon Lobocki",
    "Tami Colver", "Thanh Duong", "Travis Rash", "Tristan Ringering", "Tyson McNutt"
  ]

  EXECUTIVES_AND_MANAGERS = [
    "Andy Hurt", "Brian Noecker", "Dave Polyard", "Elizabeth Murray", "Greg Loose", "Harris Morris", "Jack Wenzinger", "Mark Pougnet", "Mike Arthur", "Shannon Adams", "Tanya Sudolnik"
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
