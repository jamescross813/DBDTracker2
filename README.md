# DBDTracker2

DBDTracker2 is a simple app which allows a user to sign up and track their in-game attributes. Initial setup establihes tables to contain all the data, and the seed file utilises API methods to populate the killer, survivor, and perk tables with instances and attributes. 

On visiting the site a user is able to create and edit currencies. Additionally, a user is able to link their account to killers and survivors, whilst also linking preferred perks to the killer/survivor. A user is also able to remove killers and survivors. Alternatively a user can change perks assigned to the killer/survivor. All killers, survivors and perks have individual pages to allow users to find out more information about them. Users, killers, survivors and currency can all be deleted from the database.  
 

## Installation

Try this app with your local host. Clone fromt he repo and run the following:

$ bundle install

$ rake db:

## Usage

$ rake db:migrate
$ rake db:seed
$ shotgun

## License

Available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).



