user_sam = User.create(name:"Samantha")
task_sam = Task.create(name: "Clean Room", description: "Need to clean out desk draws", priority: "low")
user_sam.tasks.push(task_sam)

user_dale = User.create(name:"Dale")
task_dale = Task.create(name: "Make Dinner", description: "Kids are Hungrey", priority: "high")
user_dale.tasks.push(task_dale)

task_sam_2 = Task.create(name: "Eat Dinner", description: "I'm hungry!", priority: "medium")
user_sam.tasks.push(task_sam_2)