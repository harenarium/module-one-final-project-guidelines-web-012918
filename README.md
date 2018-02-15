Codenames
-------------------------------
This is a project based on Vlaada Chvátil's Codenames, a spy-themed word game.
Board Options: Seeded words, random words
Spymaster Options: Currently this version has a computer spymaster that can offer a clue for one card


How to Play
-------------------------------
Computer spymaster, 1 card clue. This is a 2+ player game with two teams: red and blue.

First player is chosen randomly.
The spymaster will give a hint with a word and number (currently always 1). The word is a clue for a codename on the field.
This word is created using synonyms or if there is none, using a related word. The number refers to how many names the clue refers to.

For every correct guess, a team may have another guess up to the number given by the spymaster + 1 but will not receive any additional clues. For an incorrect guess, the teams turn end. Turns may also be skipped.

The first team with all their teams revealed wins! If there assassin is revealed, the game ends immediately and the team who guessed it loses.


How to Install
-------------------------------
Please bundle install the gemfile
Please create and seed the database by running commands "rake db:migrate" and "rake db:seed"
Run in terminal using the command "ruby bin/run.rb"
A stable internet connection is required to play

NOTE: Randomly generated words will be added to database. To re-seed the model with only the original seeded words delete db/migrate/development.db and reseed by running "rake db:seed" in the command line


Possible Future Improvements
-------------------------------
Board Options: words from user input shuffled or in order
Spymaster Options: Computer spymaster, many card clue. Human spymaster with word aid.

catch API error
reveal board
refactoring code with game model?
update word model with new column to prevent
ability to quit game
ability to skip intro

Contributing
-------------------------------
Bug reports and pull requests are welcome on GitHub at https://github.com/harenarium/module-one-final-project-guidelines-web-012918.

License
The program is available as open source under the terms of the MIT License.


=================================================================================================================================
# Module One Final Project Guidelines

Congratulations, you're at the end of module one! You've worked crazy hard to get here and have learned a ton.

For your final project, we'll be building a Command Line database application.

## Project Requirements

### Option One - Data Analytics Project

1. Access a Sqlite3 Database using ActiveRecord.
2. You should have at minimum three models including one join model. This means you must have a many-to-many relationship.
3. You should seed your database using data that you collect either from a CSV, a website by scraping, or an API.
4. Your models should have methods that answer interesting questions about the data. For example, if you've collected info about movie reviews, what is the most popular movie? What movie has the most reviews?
5. You should provide a CLI to display the return values of your interesting methods.  
6. Use good OO design patterns. You should have separate classes for your models and CLI interface.

### Option Two - Command Line CRUD App

1. Access a Sqlite3 Database using ActiveRecord.
2. You should have a minimum of three models.
3. You should build out a CLI to give your user full CRUD ability for at least one of your resources. For example, build out a command line To-Do list. A user should be able to create a new to-do, see all todos, update a todo item, and delete a todo. Todos can be grouped into categories, so that a to-do has many categories and categories have many to-dos.
4. Use good OO design patterns. You should have separate models for your runner and CLI interface.

### Brainstorming and Proposing a Project Idea

Projects need to be approved prior to launching into them, so take some time to brainstorm project options that will fulfill the requirements above.  You must have a minimum of four [user stories](https://en.wikipedia.org/wiki/User_story) to help explain how a user will interact with your app.  A user story should follow the general structure of `"As a <role>, I want <goal/desire> so that <benefit>"`. In example, if we were creating an app to randomly choose nearby restaurants on Yelp, we might write:

* As a user, I want to be able to enter my name to retrieve my records
* As a user, I want to enter a location and be given a random nearby restaurant suggestion
* As a user, I should be able to reject a suggestion and not see that restaurant suggestion again
* As a user, I want to be able to save to and retrieve a list of favorite restaurant suggestions

## Instructions

1. Fork and clone this repository.
2. Build your application. Make sure to commit early and commit often. Commit messages should be meaningful (clearly describe what you're doing in the commit) and accurate (there should be nothing in the commit that doesn't match the description in the commit message). Good rule of thumb is to commit every 3-7 mins of actual coding time. Most of your commits should have under 15 lines of code and a 2 line commit is perfectly acceptable.
3. Make sure to create a good README.md with a short description, install instructions, a contributors guide and a link to the license for your code.
4. Make sure your project checks off each of the above requirements.
5. Prepare a video demo (narration helps!) describing how a user would interact with your working project.
    * The video should:
      - Have an overview of your project.(2 minutes max)
6. Prepare a presentation to follow your video.(3 minutes max)
    * Your presentation should:
      - Describe something you struggled to build, and show us how you ultimately implemented it in your code.
      - Discuss 3 things you learned in the process of working on this project.
      - Address, if anything, what you would change or add to what you have today?
      - Present any code you would like to highlight.   
7. *OPTIONAL, BUT RECOMMENDED*: Write a blog post about the project and process.
