## MakersBnB
group project for Air BnB clone

MVP

```
As a signed-up owner
So that I can rent out property
I want to list new property

As a signed-up traveler
So that I can choose a property
I want to place a request for single night

As an owner
so that I can manage bookings
I want to approve traveler's request

```
MVP Domain Model

| Object           | Messages      |
|:----------------:|:-------------:|
|OWNER             |               |
| property         | rent out      |
| property         | to list       |
| bookings         | manage        |
| request          | confirm       |
| TRAVELER         |               |
| property         | choose        |
| request          | to place      |


# Core User Stories

```

As an Owner
So that I can rent out multiple properties,
I want to list multiple properties

As an Owner
So that I can put the right information
I want to add name, short description and price per night

As an Owner
So that I can better manage my property bookings
I want to post a range of available dates

As an Owner
so that I can better manage my bookings
I want my property be available until I confirm travellers request

As a traveler
So that I don’t make the wrong booking
I want to see only available properties on a certain date

```

# Headline specifications

1. Any signed-up user can list a new space.
2. Users can list multiple spaces.
3. Users should be able to name their space, provide a short description of the space, and a price per night.
4. Users should be able to offer a range of dates where their space is available.
5. Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
6. Nights for which a space has already been booked should not be available for users to book that space.
7. Until a user has confirmed a booking request, that space can still be booked for that night.

# Nice-to-haves

1. Users should receive an email whenever one of the following happens:
2. They sign up
3. They create a space
4. They update a space
5. A user requests to book their space
6. They confirm a request
7. They request to book a space
8. Their request to book a space is confirmed
9. Their request to book a space is denied
10. Users should receive a text message to a provided number whenever one of the
 following happens:
12. A user requests to book their space
13. Their request to book a space is confirmed
14. Their request to book a space is denied
15. A ‘chat’ functionality once a space has been booked, allowing users whose 16.
 space-booking request has been confirmed to chat with the user that owns that space
17. Basic payment implementation though Stripe.
