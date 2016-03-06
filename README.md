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

### Models (attributes/data_types)
_Holding off on building models until we get these figured out more. Some models will need what Trudy called 'associations', whereby models are linked to other models. For example: the *comment* model will be linked to the *groups* model, so that comments can exist within groups, and be linked bath to the author_

* User _generated_
	* user_name: string (unique)
	* user_email
	* password

* Profile _generated_
	* first_name: string
	* last_name: string
	* avatar: binary (image) - pulled from Twitter/Goodreads when signed in.
	* bio: text
	* city: string

* Book
	* book_name: string
	* cover_image: binary (image) **To be added later**
	* description: text
	* author: string

* Group _generated_
	* group_name: string
	* description: text
	* location: string
	* user_id[s]: (group members: will this be an association to another model?) **To be added later**
	* private: boolean **To be added later**

* Comment
	* content: text
	* profile_id: integer (see: associations) **To be added later**
	* group_id: integer (see: associations) **To be added later**

* GroupResigration _generated_
	* The bouncer model 💪

### Model Associations

* Comment
 * belongs_to :user
 * belongs_to :book

* Group
 * Has_many :users
 * Has_many :books
 * has_many :group registrations

* Profile
 * has_many :comments
 * has_many :group registrations

* User
	* _check out_ belongs_to relationships
	
* GroupRegistraion
	* belongs_to :profile
	* belongs_to :group

* Book
 * has_many :groups
 * belongs_to :group
 * has_many: comments