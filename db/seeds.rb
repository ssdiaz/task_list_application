joe = User.create(name:"Joe", email: "joe@email.com", password:"123")
task_joe = Task.create(name: "Clean Room", description: "Need to clean out desk draws", priority: "low", user_id: joe.id)
joe.tasks.push(task_joe)

task_joe_2 = Task.create(name: "Eat Dinner", description: "I'm hungry!", priority: "medium", user_id: joe.id)
joe.tasks.push(task_joe_2)

dale = User.create(name:"Dale", email: "dale@email.com", password:"123")
task_dale = Task.create(name: "Make Dinner", description: "Kids are Hungrey", priority: "high", deadline: "", status: "Complete", user_id: dale.id)
dale.tasks.push(task_dale)

ruby = User.create(name:"Ruby", email: "ruby@email.com", password:"123")
task_ruby = Task.create(name: "Make Dinner", description: "Kids are Hungrey", priority: "high", deadline: "Today", status: "Complete", user_id: ruby.id)
ruby.tasks.push(task_ruby)

task_ruby2 = Task.create(name: "Code", description: "Map and Key", priority: "low", deadline: "", status: "Open", user_id: ruby.id)
ruby.tasks.push(task_ruby2)

task_ruby3 = Task.create(name: "Eat Dinner", description: "I'm hungry!", priority: "medium", deadline: "Today", status: "Complete",user_id: ruby.id)
ruby.tasks.push(task_ruby3)

sarah = User.create(name:"Sarah", email: "sarah@email.com", password:"123")


lisa = User.create(name:"Lisa", email: "lisa@email.com", password:"123")
lisa_task = Task.create(name: "Go To Mall", description: "Make a Return", priority: "low", deadline: "Today", status: "Open",user_id: lisa.id)
lisa_task2 = Task.create(name: "Lead conference meeting", description: "Meeting at noon", priority: "High", deadline: "Today", status: "Open",user_id: lisa.id)
lisa.tasks.push(lisa_task)
lisa.tasks.push(lisa_task2)


jessica = User.create(name:"Jessica", email: "jessica@email.com", password:"123")
jessica_task = Task.create(name: "Go To Mall", description: "Make a Return", priority: "low", deadline: "Today", status: "Complete",user_id: jessica.id)
jessica_task2 = Task.create(name: "Lead conference meeting", description: "Meeting at noon", priority: "High", deadline: "Today", status: "Complete", user_id: jessica.id)
jessica_task3 = Task.create(name: "Lead conference meeting", description: "Meeting at noon", priority: "High", deadline: "Today", status: "Complete", user_id: jessica.id)
jessica_task4 = Task.create(name: "Lead conference meeting", description: "Meeting at noon", priority: "High", deadline: "Today", status: "Complete", user_id: jessica.id)
jessica.tasks.push(jessica_task)
jessica.tasks.push(jessica_task2)
jessica.tasks.push(jessica_task3)
jessica.tasks.push(jessica_task4)


pete = User.create(name:"Pete", email: "pete@email.com", password:"123")
pete_task = Task.create(name: "Compile research", description: "Data from the research", priority: "High", deadline: "Today", status: "Complete", user_id: pete.id)
pete_task2 = Task.create(name: "Pick up Kids", description: "from soccer practise", priority: "High", deadline: "Today", status: "Open", user_id: pete.id)
pete_task3 = Task.create(name: "Talk to boss", description: "EOY Review", priority: "High", deadline: "Today", status: "Open", user_id: pete.id)
pete_task4 = Task.create(name: "Clean desk", description: "it's unorganized", priority: "low", deadline: "This week", status: "Open", user_id: pete.id)
pete.tasks.push(pete_task)
pete.tasks.push(pete_task2)
pete.tasks.push(pete_task3)
pete.tasks.push(pete_task4)


george = User.create(name:"George", email: "george@email.com", password:"123")
george_task = Task.create(name: "Buy new car", description: "one that goes vroom vroom", priority: "low", deadline: "Tomorrow", status: "Complete", user_id: george.id)
george_task2 = Task.create(name: "Sell Car", description: "the red one", priority: "High", deadline: "Today", status: "Open", user_id: george.id)
george.tasks.push(george_task)
george.tasks.push(george_task2)
