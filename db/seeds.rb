# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# TODO: Quick testing of tasks
# Clear Tasks
Task.delete_all
Subtask.delete_all

# Add parent tasks
@task1 = Task.create! owner: "dmgust@gmail.com", public_viewable: true, name: "Watch football!"
Task.create! owner: "dmgust@gmail.com", public_viewable: false, name: "Watch GOT"
@task3 = Task.create! owner: "dmgust@gmail.com", public_viewable: false, name: "Play guitar!"

# Add subtasks
Subtask.create! task_id: @task1.id, name: "Watch Vikes!"
Subtask.create! task_id: @task3.id, name: "Jam on the blues"
Subtask.create! task_id: @task3.id, name: "Learn solo"
