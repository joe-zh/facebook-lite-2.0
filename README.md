# facebook-lite-2.0
Facebook-Lite-2.0

CIS196 Final Project S2017

General Features

Sessions - Individualized Users with capabilities to post statuses, create groups, edit names, and add friends.
Groups - Admin-Controlled Groups that have the capability of hosting a number of users.
Emails - Facebook Friends can send an email through Sendgrid to say Hi to each other.

Highlighted Features
1. Friend Request
    1. On User Show page, mutual Facebook friends displays “Send text”, Non-friends displays “Send Friend Request”, and Pending Requests display nothing. Users who are not logged in do not have access to these features.
    2. If a user is logged in, he/she can access a Friends page. In which, there is a table that displays a list of current friends and a separate list of pending friend requests which the currently logged in user can accept/reject
    3. Friend Requests are reflected across the different sessions and can be monitored by logging in and out locally.
2. Group Admin
    1. Whichever created the group becomes the admin
    2. Only an admin user can edit the group's name
    3. Admin has an extra column in the group's page to remove group members from the group
3. Sendgrid
    1. A logged in user can see a link of "Say Hello!" next to their friends' info on the User show page. Upon clicking activates Sendgrid that sends an email to their Friend's email with the following format: 

    Hi, this is <%= @curr.name %>. Nice to meet you, <%= @user.name %>!
    Thanks for being friends on Facebook Lite 2.0. It's going to be a great time!

    2. This feature is only valid if the receiver's email address is valid.
