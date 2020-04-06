class Astronaut
  attr_reader :name, :age, :specialty

  @@all = []

  def initialize(name, age, specialty)
    @name = name
    @age = age
    @specialty = specialty
    @@all << self
  end  

  def shuttles
    Mission.all.select { |mission| mission.astronaut == self }.map { |mission| mission.shuttle }
  end
  
  def shuttle_full?(shuttle, launch_date)
    Mission.all.select { |mission| mission.shuttle == shuttle && mission.launch_date == launch_date }.length >= shuttle.capacity
  end

  def join_shuttle(shuttle, launch_date)
    if !shuttle_full?(shuttle, launch_date)
      Mission.new(self, shuttle, launch_date)
    else
      "This shuttle is at capacity!"
    end
  end

  def self.all
    @@all
  end

  def self.most_missions
    mars_astronauts = Mission.all.select { |mission| mission.destination == "mars" }.map { |mission| mission.astronaut }
    count = Hash.new(0)
    mars_astronauts.each { |astronaut| count[astronaut] += 1 }
    count.max_by { |key, value| value }
  end
end





