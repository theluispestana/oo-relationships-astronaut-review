class Astronaut
  attr_reader :name, :age, :specialty

  @@all = []

  def initialize(name, age, specialty)
    @name = name
    @age = age
    @specialty = specialty
    @@all << self
  end  

  def missions
    Mission.all.select { |mission| mission.astronaut == self }
  end

  def shuttles
    missions.map { |mission| mission.shuttle }
  end
  
  def shuttle_full?(shuttle, launch_date)
    Mission.all.select { |mission| mission.shuttle == shuttle && mission.launch_date == launch_date }.length >= shuttle.capacity
  end

  def join_shuttle(shuttle, launch_date)
    return "You're not old enough" if @age < shuttle.minimum_age

    if !shuttle_full?(shuttle, launch_date)
      Mission.new(self, shuttle, launch_date)
    else
      "This shuttle is at capacity!"
    end
  end

  def fellow_mission_members
    my_shuttle = Mission.all.find { |mission| mission.astronaut == self }.shuttle
    Mission.all.select { |mission| mission.shuttle == my_shuttle }.map { |mission| mission.astronaut }
  end

  def self.all
    @@all
  end

  def self.most_missions
    mars_missions = Mission.all.select { |mission| mission.destination == "mars" }
    mars_missions.max_by { |mission| mission.astronaut.missions.count }
  end

  def self.top_three
    all.max_by(3) { |astronauts| astronauts.missions.count }
  end
end





