# An AirBnB Clone Project

This is our take to reproduce a well known Bed&Breakfast rental platform. The project followed a typical MVP model execution and any further iterartions until we ran out of time. 


### Key implemented features :

1. Any signed-up user can list a new space.
2. Users can list multiple spaces, name, describe and add a price per night.
3. Users are able to offer a range of dates where their space is available.
4. Any signed-up user can request to hire any space for one night, and this is approved by the owners that owns that space.
5. Nights for which a space has already been booked should not be available for users to book that space.
6. Until a user has confirmed a booking request, that space can still be booked for that night.
7. User receives a confirmation message once signed up to platofrm. 

#### Additional features yet to be added: 

- Users should receive an email whenever they sign up, create or updates a space, confirm a request or their request to book a space is confirmed/denied. 

- A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space

- Basic payment implementation using Stripe.

### To run the application:

1. clone this repo
2. run ``` bundle install ``` command locally in MakersBnB folder
3. lastly, run ``` rackup ``` command, it should open app on [localhost page](http://localhost:9292/)


### MVP User stories and Domain model:

As an Owner:
```
So that I can rent out property
I want to list new property
```
```
so that I can manage bookings
I want to approve traveler's request
```

As a traveler:
```
So that I can choose a property
I want to place a request for single night
```

| Object           | Messages      |      | Object           | Messages      |
|:----------------:|:-------------:|      |:----------------:|:-------------:|
|OWNER             |               |      | TRAVELER         |               |
| property         | rent out      |      | property         | choose        |
|                  | to list       |      | request          | to place      |
| bookings         | manage        |
| request          | confirm       |


### Other User Stories

As an Owner:
```
So that I can rent out multiple properties,
I want to list multiple properties
```
```
As an Owner
So that I can put the right information
I want to add name, short description and price per night
```
```
As an Owner
So that I can better manage my property bookings
I want to post a range of available dates
```
```
As an Owner
so that I can better manage my bookings
I want my property be available until I confirm travellers request
```
As a traveler:
```
So that I don’t make the wrong booking
I want to see only available properties on a certain date
```
