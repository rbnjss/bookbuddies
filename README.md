# Bookbuddies
_Bookbuddies rails app_

## To Do
* Finish header and footer styling + content
* Write some copy about the application
* About Page
* Responsive styles
* Twitter Card + Facebook OG Meta Data
* Add Postgress db in production (Heroku compatible)
* Deploy to Heroku
* Setup Amazon S3 account for image storage
* Purchase domain (bookbuddi.es)
* Create rbnjss accounts for Amazon S3, Heroku, Twitter, Mailgun

## Nice to have's
* Pull in Twitter avatar on Twitter signup

### Design
* Leverage material design principals

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

* User _- generated_
	* `user_name: string`
	* `user_email: string` (unique)
	* `password`

* Profile _- generated_
	* `first_name: string`
	* `last_name: string`
	* `bio: text`
	* `city: string`

* Book _- generated_
	* `book_name: string`
	* `description: text`
	* `author: string`

* Group _- generated_
	* `group_name: string`
	* `description: text`
	* `location: string`
	* private: boolean **To be added later**

* Comment _- generated_
	* `content: text`
	* `profile_id: integer` (see: associations)
	* `book_id: integer` (see: associations)

* GroupResigration _- generated_
	* The bouncer model 💪
	* `user_id: integer`
	* `group_id: integer`

### Model Associations

* comment
 * `belongs_to :profile`
 * `belongs_to :book`

* group
 * `has_many :users`
 * `has_many :books`
 * `has_many :profiles, through: :group` registrations

* profile
 * `has_many :comments`
 * `has_many :groups, Through: :group registrations`

* user
	* `has_one :profile`
  * `accepts_nested_attributes_for :profile`
	* `The bouncer model` 💪
	
* group_registration
	* `belongs_to :profile`
	* `belongs_to :group`

* book
 * `has_many :groups`
 * `belongs_to :group`
 * `has_many: comments`
