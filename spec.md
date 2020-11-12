# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - I used the corneal gem to create the sinatra template
- [x] Use ActiveRecord for storing information in a database - ActiveRecord is storing not only User login data, but data about their children and appointments and milestones.
- [x] Include more than one model class (e.g. User, Post, Category) - I have a parent, child, appointment, and milestone model class.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - The parent has many children. The children have many appointments and milestones.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) The children belong to the parent class. And the appointment and milestone classes belong to the child class.
- [x] Include user accounts with unique login attribute (username or email) The parent has to login with their email. 
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - Each belongs_to has the ability to create, read, update, and destroy
- [x] Ensure that users can't modify content created by other users - using helper methods of current_user and logged_in, it prevents unauthorized access to data that doesnt belong to the user.
- [x] Include user input validations - In both the new and edit versions of each class that has this ability, I added checks to make sure no fields were left blank
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - This can be viewed on the readme.

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
