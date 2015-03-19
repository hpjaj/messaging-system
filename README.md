# Messenger

Messenger is a traditional email-like messaging system between users.

To test drive Messenger:

- Git [clone](https://github.com/hpjaj/messaging-system.git) the repository
- Run `$ bundle`
- Migrate and seed the SQLite3 databases (`rake db:migrate` and `rake db:seed`)
- Start the server, `$ rails s`, and browse to `localhost:3000/welcome`
- Login with John Smith's credentials:
  - `email: john@example.com`
  - `password: password`
- Create and send messages to other users

To receive emails, you will need to create an account:
- Logout and visit the [Welcome page](localhost:3000/welcome)
- Click the `Sign up` button and create an account

To run the specs, call `$ rspec` from the command line


Here is the welcome screen:

![Welcome screen](http://hpjaj.com/web-images/messenger/welcome-screen.jpg)

Here is a list of of your current conversations, similar to the iPhone messaging app:

![Current conversations](http://hpjaj.com/web-images/messenger/conversations.jpg)

Here are the messages exchanged between two users:

![Messages screen](http://hpjaj.com/web-images/messenger/list-of-messages.jpg)

Here is the form for writing a message.  Messages can be formatted with markdown:

![Message form](http://hpjaj.com/web-images/messenger/new-message.jpg)