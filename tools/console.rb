require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

#write your test code in here

enterprise = Shuttle.new("WORF43424Q", 1000)

iss = Shuttle.new("1998-067A", 2)

luis = Astronaut.new("luis", 24, "falling")

monkey = Astronaut.new("bobo", 3, "being a monkey")

kerbal = Astronaut.new("kerbal", 30, "none to be found")

defeat_borg = Mission.new(monkey, enterprise, 2367)

orbit_earth = Mission.new(luis, iss, 2020)

do_science = Mission.new(monkey, iss, 2021)

colonize_mars = Mission.new(kerbal, enterprise, 2022, "mars")

binding.pry

puts "Let's go to space!" # just in case pry is buggy and exits
