# YogaFlow by Renee Messersmith

## Overview
YogaFlow is a user-friendly web application designed to create a seamless and engaging experience for yoga enthusiasts. It aims to provide users with the tools to manage their yoga practice and explore additional resources for personal well-being.

## Built With


## Setup
Rails 7.1.5
Ruby 3.2.2

```
bundle install

rails db:create
rails db:migrate
rails db:seed
```

## Testing
This application uses RSpec for testing.
```
bundle exec rspec
```

## API Documentation

### Users
#### Create a Session (Login)
Request:
```
POST /api/v1/sessions/

Body:
{
  "email": "jane.doe@example.com",
  "password": "password"
}
```
Successful Response:

Error Response: