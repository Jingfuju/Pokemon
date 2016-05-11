# Q0: Why is this error being thrown?

The error message is raised due to the following code in the index method of home_controller 

trainerless_pokemon = Pokemon.where(trainer:nil)

This is an ActiveRecord query sentence, which show follow Module.where(OPTION) syntax. 
However, Pokemon module has not been defined in models folder, so error message pops up. 
If nothing has been found by where syntax, this sentence will raise ActiveRecord::RecordNotFound exception.

# Q1: How are the random Pokemon appearing? What is the common factor between all the possible Pokemon that appear? *
%w(Squirtle Charmander Bulbasaur Pikachu).each do |name|
  Pokemon.create name: name, level: rand(1..20)
end

Pokemon name colomn will be filled by  "Squirtle", or  "Charmander" or  "Bulbasaur" or "Pikachu"
and level colomn will be filled by random number between (1 to 20)

# Question 2a: What does the following line do 
#"<%= button_to "Throw a Pokeball!", capture_path(id: @pokemon), :class => "button medium", :method => :patch %>"? 
#Be specific about what "capture_path(id: @pokemon)" is doing. If you're having trouble, look at the Help section in the README.

ANS:

This line generate a form containing a single "Throw a Pokeball" button that submit to the URL created by capture_path(...) method. 
The form follows the these two options:
1. :class =>"button medium"    # part of html_options and specifies the class of the button for css styling
2. :mehtod => :pathch  :   # specify HTTP verb. -> we are doing an update.


The capture_path(...) portion specifies the path that the request will be redirected. 
It takes in an id of the captured pokemon as a parameter so that when we get the request, 



# Question 3: What would you name your own Pokemon?

Same name with all lowercase 

# Question 4: What did you pass into the redirect_to? If it is a path, what did that path need? 
# If it is not a path, why is it okay not to have a path here?

When you click the damage button in show view of trainer,
button_to method will be direct to damage_path(id:d),where d is a pokemon object.
This sentence invoke pokemon#damage

In redirect_to trainer_path(current_trainer) in damage method of pokemon controller
I passed trainer_path(current_trainer) in to redirect_to.

damage_path(id:d) and trainer_path(current_trainer) are all not a path, which are
created by damage_path and trainer_path helper respectively.


# Question 5: Explain how putting this line "flash[:error] = @pokemon.errors.full_messages.to_sentence" 
# shows error messages on your form.

I have put it under the create method of pokemon_controller.rb
        if @pokemon.save
            redirect_to trainer_path(current_trainer)
        else 
            redirect_to :back
            flash[:error] = @pokemon.errors.full_messages.to_sentence
        end
        
Error message: Name has already been taken
Error message: Name can't be blank

When you type in wrong message in form, @pokemon.save will be "false" due to validates in pokemon model. 
Application.html.erb is the default for rendering any page, which will be used when we submit the form. 
It render to _messages.html.erb with render layout/message sentence and _message.html.erb will loop through
flash array we filled with messages to display associated ones. 

# Give us feedback on the project and decal below!

Excellent introductory ruby on rail tutorial project, providing materials to let us get familiar with 
bacis,such as validation, route, render and RESTful architecture and so on. 



# Extra credit: Link your Heroku deployed app
