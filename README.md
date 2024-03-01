This is the Events-Management App named private-events where a user can create as many events they want also the same user can attend as many events as he want

### User Authentication
I use the devise gem for this 
```
bundle add devise
rails g devise:install
rails g devise User(model-name)
rails db:migrate
```
### Events Model
```
rails g model Event place:string time:string
rails db:migrate
```
### Event Controller action for showing all the events

1. Creation a controller action "index" to show all the events
2. Accordingly created events view folder with `index.html.erb` file name

### Adding Association between User and Event

As of now the association we have to concern is between the User and Event
With this we can say A user can create as many events as possible on the other side an even can be created by only one user
In conclution both these model have one-manny relation 

`Foreign Key`  -> **These play a vey vital role make assocation between the models**
It is nothing but we are strong the one model data(id) in the other model to keep the track of the relation between the two models
Here we are naming user foreign key with creator_id name

```
rails g migration AddUserIdToEvents creator_id:integer
```
Chnage the EventsModel accordingly
```
belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
```
Note : *If your using the console every single time while creating the event you need to add the foreign key also*

### has_many :through Association

Everything working fine....
But imagine from the user side he/she can create as many events possible also can **attend as many events as he/she can**
Also imagine this from the event side for one created event we can have as many attendees as possible.

We call this relation as many-to-many relations to keep the track of both the user as well events model we introduce a new model/table/db so the name *through* 

### EventAttendee model

```
rails g migration EventAttendee references:event referecnes:attendee
```
Add the association in User & Events Model Accordingly

*user.rb*
For this I want to take a moment to explain clearly this is where I get stucked let's break it down
1. A user can create as many events as he/she can as per our convinience we as we changes the default foreign key we have to explicitly menstion that as well
```
has_many :events foreign_key: 'creator_id'
```
2. You can be an attendee of as many events as you can
```
has_many: attended_events through: :event_attendees source: : event {
Here we are keeping the track of the events you attended with the help of third table as source as even model}
```
3. This is the association with EventAttendee model
```
has_many :event_attendee
```
*event.rd*
1. An event has only one creator
   ```
   belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
   ```
2. An even have many attendess
   ```
   has_many: attendees, thought: :event_attendees, source: :attendess
   ```
3. This is the association with EventAttendee model

   ```
   has_many: event_attendees
   ```

Even after this I still have a few things i didn't get know also

1. Let other users allow to attend each other events

Here are the pages of my just working web.

Home Page 
![Screenshot from 2024-03-01 14-48-50](https://github.com/Malavi1/private-events/assets/112646623/92aa1a46-bbab-44a9-a64d-184a97dc2a78)

Even creation page

![Screenshot from 2024-03-01 14-49-00](https://github.com/Malavi1/private-events/assets/112646623/4d1fe519-035b-45da-a42b-e559386ca6ce)

User created events Page

![Screenshot from 2024-03-01 14-49-28](https://github.com/Malavi1/private-events/assets/112646623/5bc98afb-b0d2-4376-86fa-9b21ff57f7d8)


   
