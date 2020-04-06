class Shuttle
  attr_reader :model, :capacity, :minimum_age

  @@all = []

  def initialize(model, capacity)
    @model = model
    @capacity = capacity
    @minimum_age = 18
    @@all << self
  end

  def current_astronauts
    Mission.all.select { |mission| mission.shuttle == self }.map { |mission| mission.astronaut }
  end

  def shuttle_full?(launch_date)
    Mission.all.select { |mission| mission.shuttle == self && mission.launch_date == launch_date }.length >= capacity
  end

  def add_astronaut(astronaut, launch_date)
    return "You're not old enough" if astronaut.age < @minimum_age
    
    if !shuttle_full?(launch_date)
      Mission.new(astronaut, self, launch_date) 
    else
      "There is now more room in the shuttle"
    end
  end

  def average_age
    current_astronauts.map { |astronaut| astronaut.age }.reduce { |acc, cur| acc + cur } / current_astronauts.length.to_f
  end

  def astronauts_specialties
    current_astronauts.each { |astronaut| puts astronaut.specialty }
  end
  
  def missions
    Mission.all.select { |mission| mission.shuttle == self }
  end

  def self.all
    @@all
  end

  def self.find_by_model(model)
    @@all.find { |shuttle| shuttle.model == model }
  end

  def self.smallest_mission
    all.min_by { |shuttle| shuttle.current_astronauts.count }
  end


  def self.most_common_model
    all.max_by { |shuttle| shuttle.missions.count }.model
  end
end





