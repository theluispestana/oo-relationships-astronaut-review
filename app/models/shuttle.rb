class Shuttle
  attr_reader :model, :capacity

  @@all = []

  def initialize(model, capacity)
    @model = model
    @capacity = capacity
    @@all << self
  end

  def current_astronauts
    Mission.all.select { |mission| mission.shuttle == self }.map { |mission| mission.astronaut }
  end

  def shuttle_full?(launch_date)
    Mission.all.select { |mission| mission.shuttle == self && mission.launch_date == launch_date }.length >= capacity
  end

  def add_astronaut(astronaut, launch_date)
    if !shuttle_full?(launch_date)
      Mission.new(astronaut, self, launch_date) 
    else
      "There is now more room in the shuttle"
    end
  end

  def self.all
    @@all
  end

  def self.find_by_model(model)
    @@all.find { |shuttle| shuttle.model == model }
  end
end





