# Bookbuddies
_Bookbuddies rails app_

## To Do
* Style login pages
* Make book cover image sizes uniform
* Pull in Twitter avatar on Twitter signup
* Work on layout of group page
* Create subtle pattern for footer
* Finish header and footer styling + content
* Redo logo
* About Page
* Style invites page
* Purchase domain (bookbuddi.es)
* Setup Amazon S3 account for image storage
* Add Postgress db in production (Heroku compatible)
* Switch "Members" in Group_index to something else, like "currently reading". Members spills over, and doesn't work.

## Nice to have's
* Have "new" views for groups and books show up on the same page (slide down)
* Add a "meeting place" column to groups and pull in a Google Map
* Add parallax background to group banner image

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
	* user_name: string (unique)
	* user_email
	* password

* Profile _- generated_
	* first_name: string
	* last_name: string
	* avatar: binary (image) - pulled from Twitter/Goodreads when signed in.
	* bio: text
	* city: string

* Book _- generated_
	* book_name: string
	* cover_image: binary (image) **To be added later**
	* description: text
	* author: string

* Group _- generated_
	* group_name: string
	* description: text
	* location: string
	* user_id[s]: (group members: will this be an association to another model?) **To be added later**
	* private: boolean **To be added later**

* Comment _- generated_
	* content: text
	* profile_id: integer (see: associations)
	* book_id: integer (see: associations)

* GroupResigration _- generated_
	* The bouncer model 💪

### Model Associations

* comment
 * belongs_to :profile
 * belongs_to :book

* group
 * has_many :users
 * has_many :books
 * has_many :profiles, through: :group registrations

* profile
 * has_many :comments
 * has_many :groups, Through: :group registrations

* user
	* has_one :profile
  * accepts_nested_attributes_for :profile
	* The bouncer model 💪
	
* group_registration
	* belongs_to :profile
	* belongs_to :group

* book
 * has_many :groups
 * belongs_to :group
 * has_many: comments