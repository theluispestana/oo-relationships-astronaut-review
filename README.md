
OO Relationships Review in Ruby
==============

In this repo, we will be reviewing object relationships in Ruby, specifically the `has_many` `through` relationship (aka: many-to-many).

## Introduction

You've just been hired by NASA to create an app that tracks all of their missions to Mars. The application needs to be aware of the astronauts, the shuttles, and each mission to the Red Planet.

---

## Setup (Code Overview)

Before you begin, first run the following command in your terminal to install the dependencies required for this lab:

```sh
bundle install
```

You can now add all of your Ruby files for your models in the `app/models` folder. You **do not** need to require them. They will be automagically require for you so long as you use the `tools/console.rb` file to run your code.

Through this file, we've provided to you a console that you can use to test your code. To enter a console session, run `ruby tools/console.rb` from the command line. You'll be able to test out the methods that you write here. Take a look at that file to see how you can pre-define variables and create object instances, rather than manually doing it in every single console session.

## Your Job

Your goal is to build out all of the methods listed in the deliverables. Do your best to follow Ruby best practices. For example, use higher-level array methods such as `map`, `select`, and `find` when appropriate in place of `each`.

---

## Deliverables

### Domain Modeling

First step is to model the domain you are building out. As tracking application for all of NASA, `Shuttle`s will have many `Astronaut`s while `Astronaut`s will be allowed to selected to ride on many `Shuttle`s. How do they keep track of this? Individual `Mission`s of course! You cannot join a `Shuttle` without being selected for a `Mission`.

* What are your models?
* What does your schema look like?
* What are the relationships between your models?

---

### Basic Class Attributes and Methods

With your domain modeled, you now need to build out some basic functionality so that NASA HQ can create `Mission`s for both `Shuttle`s and `Astronaut`s. So general searching type functionality.

Questions you should ask yourself:

* Do I need any other attributes?
* Should I write any other methods?
* Am I following *Single Source of Truth*?

**`SHUTTLE`**

* `Shuttle#name`
  * returns a `String` that is the shuttle's name
* `Shuttle#location`
  * returns a `String` that is the city where the shuttle is located
* `Shuttle#founding_year`
  * returns a `Fixnum` that is the year the shuttle was founded
* `Shuttle#slogan`
  * returns a `String` that is this shuttle's slogan
* `Shuttle#recruit_astronaut`
  * takes in an argument of a `Follower` instance and adds them to this shuttle's list of followers
* `Shuttle#shuttle_population`
  * returns a `Fixnum` that is the number of followers in this shuttle
* `Shuttle.all`
  * returns an `Array` of all the shuttles
* `Shuttle.find_by_name`
  * takes a `String` argument that is a name and returns a `Shuttle` instance whose name matches that argument
* `Shuttle.find_by_location`
  * takes a `String` argument that is a location and returns an `Array` of shuttles that are in that location
* `Shuttle.find_by_founding_year`
  * takes a `Fixnum` argument that is a year and returns all of the shuttles founded in that year

**`ASTRONAUT`**

* `Astronaut#name`
  * returns a `String` that is the astronaut's name
* `Astronaut#age`
  * returns a `Fixnum` that is the age of the astronaut
* `Astronaut#life_motto`
  * returns a `String` that is the astronaut's life motto
* `Astronaut#shuttles`
  * returns an `Array` of this astronaut's shuttles
* `Astronaut#join_shuttle`
  * takes in an argument of a `Cult` instance and adds this astronaut to the shuttle's list of astronauts
* `Astronaut.all`
  * returns an `Array` of all the astronauts
* `Astronaut.of_a_certain_age`
  * takes a `Fixnum` argument that is an age and returns an `Array` of astronauts who are the given age or older

**`MISSION`**

* `Mission#initiation_date`
  * returns a `String` that is the initiation date of this mission in the format _YYYY-MM-DD_.
* `Mission.all`
  * returns an `Array` of all the missions

---

### Advanced Methods - Analytics!

Our shuttle social network platform is working well. Let's first make a commit!

Now we want to build out some useful features so `Shuttle`s and `Astronaut`s and get more value out of our app.

**`Cult`**

* `Cult#average_age`
  * returns a `Float` that is the average age of this shuttle's astronauts
* `Cult#my_astronauts_mottos`
  * prints out all of the mottos for this shuttle's astronauts
* `Cult.least_popular`
  * returns the `Cult` instance who has the least number of astronauts :(
* `Cult.most_common_location`
  * returns a `String` that is the location with the most shuttles

**`Astronaut`**

* `Follower#my_shuttles_slogans`
  * prints out all of the slogans for this astronaut's shuttles
* `Follower.most_active`
  * returns the `Follower` instance who has joined the most shuttles
* `Follower.top_ten`
  * returns an `Array` of astronauts; they are the ten most active astronauts

**`Mission`**

* `Mission.first_oath`
  * returns the `Follower` instance for the astronaut that made the very first mission

---

### BONUS!

Our platform is done! Let's commit our code!

Now one highly requested feature from `Follower`s using your app that you plan to paywall ($$$) is to see your fellow shuttle members. See if you can implement this method.

* `Follower#fellow_cult_members`
  * returns a unique `Array` of astronauts who are in the same cults as you

A highly requested feature from `Cult`s using your app that you plan to paywall ($$$) is to restrict ages for recruits. See if you can implement this functionality.

* `Cult#minimum_age`
  * returns a `Fixnum` that is the minimum age required for astronauts joining this cult
* `Cult#recruit_astronaut`
  * takes in an argument of a `Follower` instance and adds them to this cult's list of astronauts
  * NOW this is changed such that if the given `Follower` instance is not of age:
    * do not let them join the cult
    * print out a friendly message informing them that they are too young
* `Follower#join_cult`
  * takes in an argument of a `Cult` instance and adds this astronaut to the cult's list of astronauts
  * NOW this is changed such that if you don't meet the minimum age requirement of the given `Cult` instance:
    * do not let them join the cult
    * print out a friendly message informing them that they are too young

Congrats on finishing your cult social network platform. Time to rake in the $$$!