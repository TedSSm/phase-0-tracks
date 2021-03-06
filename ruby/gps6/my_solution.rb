# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
#
#
require_relative 'state_data'
#require_relative from close to by (current directory)
#require will search from farther away. (third-party libraries)

class VirusPredictor
#sets the state, population, and population_density to instance variables. called when using .new
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end
  
#Depending on predicted deaths and speed of spread of virus this gives the effects of the virus on the certain state.
  
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

   private
  
#predicting the number of deaths depending on pupulation and population desity.
  def predicted_deaths
    # predicted deaths is solely based on population density
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
    else
      number_of_deaths = (@population * 0.05).floor
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end
  
#How fast the virus is going to spread depending on population density of state
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else
      speed += 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


 # alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
 # alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects

STATE_DATA.each do |state,population_info| 
virus_state = VirusPredictor.new(state, population_info[:population_density], population_info[:population])
  virus_state.virus_effects
end
#=======================================================================
# Reflection Section

# What are the differences between the two different hash syntaxes shown in the state_data file?
# The differences between the syntax of the two hashes was one used the '=>' syntax to assign a value to a key, which is the old method. The other version was using the keys as a symbol using a colon.

# What does require_relative do? How is it different from require?
#require_relative from close to by (current directory)
#require will search from farther away. (third-party libraries)

# What are some ways to iterate through a hash?
#You can use the .each method to iterate through a hashs keys and values.

# When refactoring virus_effects, what stood out to you about the variables, if anything?
#All of the variables in virus_effects were already declared as instance variables so they didn't need to be added as perameters.

# What concept did you most solidify in this challenge?
#iterating over hashes. 
