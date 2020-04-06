class Mission
  attr_reader :astronaut, :shuttle, :launch_date, :destination

  @@all = []

  def initialize(astronaut, shuttle, launch_date, destination="space")
    @astronaut = astronaut
    @shuttle = shuttle
    @launch_date = launch_date   
    @destination = destination
    @@all << self
  end

  def self.all
    @@all
  end
end
