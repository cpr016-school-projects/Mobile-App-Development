## Navigation

##### Design of Computing Algorithms - COS 485
Link: https://github.com/cpr016-school-projects/Algorithms

##### Capstone - Object Oriented Design and Programming - COS 420
Link: https://github.com/cpr016-school-projects/Capstone

##### Mobile Application Development - COS 470
Link: https://github.com/cpr016-school-projects/Mobile-App-Development

##### Computer Graphics - COS 452
Link: https://github.com/cpr016-school-projects/Computer-Graphics

##### Database Systems - COS 457
Link: https://github.com/cpr016-school-projects/Database-Systems

##### Graphical User Interface Design - COS 368
Link: https://github.com/cpr016-school-projects/GUI-Design

---

# Mobile Application Development - COS 470
The objectives of the course are as follows.

* Develop basic skill in app development on iOS, Android, and hybrid platforms.
* Develop moderate skill and knowledge of a single platform.
* Develop basic skill in server-side development for mobile platforms.
* Understand the design and interface layout process for mobile applications.


# Project 1 - iOS Task List
## Tools Used: Swift, xCode
## Description:
The app shall be made up of four total screens:

* a launch screen
* a task list screen
* a create new task screen
* a task details screen.
More detailed information about each screen is found below.

To accomplish this, you will (most likely) have some set of the following files in your project:

* AppDelegate.swift - Basically the “main” for the entire app. You probably won’t touch this.
* AddItemViewController.swift - The Add New Item controller code.
* EditItemViewController.swift - The Edit Item controller code.
* Main.storyboard - The storyboard for most of your app (not count the launch screen).
* LaunchScreen.storyboard - Built-in by default, you just need to add your names to this.
* TaskItem.swift - The model class for this app.
* TaskListTableViewController.swfit - The controller for the list screen.
* TaskListTableViewCell.swift - The table cell adapter for this app (may not be needed)


# Project 2 - Android Task List 
## Tools Used: Kotlin, Android Studio
## Description:
The app shall be made up of three total screens:

* a task list screen
* a create new task screen
* a task details screen (could be the same as the new task screen)
More detailed information about each screen is found below.

To accomplish this, you will (most likely) have some set of the following files in your project:

* TaskListActivity.kt - The “main” activity for the app, uses RecyclerView.
* TaskListAdapter.kt - the adapter class that handles how a Task appears on a list.
* TaskDetailActivity.kt - an activity that shows the details of a task
* NewTaskActivity.kt - an activity that lets you add a new task.
* Task.kt - the model representing a single task


# Project 3 - React Native Task List
## Tools Used: React Native, Javascript
## Description:
The app shall be made up of three total screens:

* a task list screen
* a create new task screen (or modal overlay)
* a task details screen (could be the same as the new task screen, could also be a modal overlay)
More detailed information about each screen is found below.

To accomplish this, you will (most likely) have some set of the following classes/components in your project:

* TaskList - The “main” view for the app, uses ListView or FlatList. Either is acceptable.
* TaskListItem - the component that contains each row of the TaskList. The class that handles how a Task appears on a list.
* TaskDetail - a view that shows the details of a task for adding or editing. This may be a modal overlay or an separate screen, your choice.
* Task - the model representing a single task. This may also be just a plain JavaScript object.