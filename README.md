# Bookbuddies
_Bookbuddies rails app_

## To Do
* Map out potential routes (controller#action)
* Determine model columns (data types, etc.)
* Determine which content will be repeated, and can be made as partials
* Sketch up rough wire-frames for each page with content placement
* Purchase domain (bookbuddi.es)

### Design
* Leverage material design principals
* Use Basecamp as inspiration
* Use google books API, or Goodreads
* Google books can provide images, if desired.

### Functionality
* Models: User, Group (club), Book (maybe)

### Userflow
* User gets to the site (bookbuddi.es)
* Main page has copy about the app
* Log in with email, Twitter or Goodreads
* If first time user, go to create user profile screen
* If not first time user or just filled out new profile, go to screen with option to create a group (with notification if you haven't created a group yet), groups the user belongs to (your groups).  There will also be a sidebar with your profile information and a button to edit.
* User can click on a group and go to a group page
* Book details (book cover, title, author, description), avatars of group members, meeting details (dates/days of the week, times, place), option to make private, maybe google maps, forum to add comments and chat (max number of messages and option to load more, edit/delete your own comments), add to Goodreads shelf link, links to buy the book, links to other books by the same author
* Explore page with pinterest/masonry style listing of public groups

### Pages
* Edit profile page
* Terms of use agreement
* About

### Controller#actons
* users
	* 
* groups
	* 
* comments
	*

### Models (attributes/data types)
_holding off on building models until we get these figured out more_

* user
	* name: string
	* username: string
	* avatar: binary
	* bio: text

* group
	* group_name: string
	* book_name: string
	* author: string
	* description: text
	* private: boolian

* comment
	* author: string
	* content: text
	* date: date_time
	* group_id: integer (see: associations)
