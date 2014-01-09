Railscast sm-rc209 and 210
==========================

sm-rc209
--------------------------
Devise
```

gemfile
```
gem 'devise'
```
Terminal #to generate configuration files
```
rails g devise:install
and do as setup says afterwards(including notice , creating views etc)

```
Now need to map devise to any model name
```
rails g model user
rails g devise user  # user is model
now user.rb will have several modules
you can add/remove modules before migration
```
Change flash messages for devise
```
devise.en.yml
```
To change view template heading
```
check devise/templates
see changes in session/new.html.erb
```
To change url also
```
see routes.tb # use path_names for that
```
if want do authentication with other field like username
```
rails g migration AddUsernameToUser username
rake db:migrate
changes in session/new.html.erb #see
changes in registration/new.html.erb #see
change in devise.rb             #see
```
now allow create only if user is logged in
```
articles controller
before_filter :authenticate_user! , except: [:index, :show]
```
Rails server
```
rails s
```
