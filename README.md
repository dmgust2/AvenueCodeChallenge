# README

**Avenue Coding Challenge release notes**


Basic Todo list features and functionality:
* Users will initially be prompted to login when visiting the root url (http://localhost:3000/tasks). 
New users need to Sign up (register) first.
Functionality supported via Devise.
* The Main/root page will display a simple Todo list of tasks (logged in users can see all their tasks, 
and any other public tasks created by other users in the system). Note: public tasks can only be edited/deleted by the owner.
* Basic CRUD operations available for tasks and subtasks: Users can create/edit/delete tasks on the main page, 
or 'Show Details' to drill down on a specific task.
On the Task Details page users can create/edit/delete subtasks inline (using Ajax/JQuery/JS behind the scenes).
Cascade delete is supported for tasks (deletes all subtasks)
* Some simple Rspec and Capybara tests (including test data seeding via FactoryGirl)
* Basic Rails automated tests

System dependencies/notes:
* NOTE: This Rails project was created on a Windows 10 system.
There were several issues and incompatibilities I had to work through as Rails support on Windows is still a bit sketchy.
Unfortunately, since my home desktop died recently, I don't currently have access to any other system so I was not able 
to avoid this or test more thoroughly.
**It's possible some config/gems/etc. may need to be adjusted to run properly on a Linux distro.** 
Please contact me with any questions or issues:
dmgust@gmail.com

Configuration:
* Rails: 5.1.4
* Ruby: 2.4.2
* See Gemfile for more info

Database:
* SQLite3
* No seeding is necessary, users can sign up and start 
adding tasks. You can load some dummy data by running: rails db:seed --trace

Testing:
* Most of the work here was setup. Covered Tasks and Subtasks controllers, models, etc.
* Rspec: bundle exec rspec spec
* Rails (minitest): rake test

Deployment Instructions:
* Simply run Development: TodoList

Known minor issues:
* On the Task Details page: if you click on the Edit link next to a subtask, you can still click on other links 
(say edit another subtask) and this will mess up the page (temporarily). You CAN actually start editing one,
then edit another, update that one, then edit the first and click update and things will be good.
So not sure if this is a bug, but might be confusing. Ideally I could lock/disable other links mid-operation.
I saw similar issues with New Subtask (click button then edit another subtask).
* On the Task Details page: No error message if a user attempts to create a blank subtask (or update existing to blank).
Simply does not save it. Need to add some client side validation (e.g. JQuery).
* Devise password reset email: Not sure I fully configured/setup the mailer correctly. The reset email appears to get
sent via the logs, but I never received it in my gmail account. Could be another Win10 issue...

Potential Future Enhancements:
* Improved Todo List main page: Aside from the general look and feel, with more time I could easily 'Ajaxify' 
the task operations as well and then eliminate the need for various other pages (new task, edit task, task details) and 
do everything on the main page. I think not being able to see subtasks on the main page is my biggest criticism.
* Improved automated test coverage, including UI tests
* Fancy table stuff: I briefly looked into expandable/collapsible table rows so you could display tasks and subtasks in 
the same table view (bundled with inline creation/editing). I would most likely use plug-ins for this (e.g. DataTables 
and JEditable looks promising) which would provide lots of other features like sorting, filtering, search, etc. assuming
performance was not an issue...
* Productionize: PROD setup/config and deployment to a suitable host. This is actually very simple if I had say a VM w/
 Linux distro. You could host this on windows, but not really recommended...
* Pagination and config for setting how many task rows are displayed.