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
```
{
  "token": "MY TOKEN",
  "user": {
    "data": {
      "id": "1",
      "type": "user",
      "attributes": {
        "name": "Dolly Parton",
        "email": "dollyP@email.com"
      }
    }
  }
}
```
Error Response:
```
{
  "status": 401,
  "message": "Invalid login credentials"
}
```

### Poses
Connected to the [Yoga API](https://github.com/alexcumplido/yoga-api).<br>
#### Get All Poses
Request: `/api/v1/poses`<br>
Response:
```
[
  {
    "data": {
      "id": "1",
      "type": "pose",
      "attributes": {
        "name": "Boat",
        "sanskrit_name": "Nāvāsana",
        "image_url": "URL:"
      }
    }
  },
  {
    "data": {
      "id": "3",
      "type": "pose",
      "attributes": {
        "name": "Bow",
        "sanskrit_name": "Dhanurāsana",
        "image_url": "URL"
      }
    }
  }
]
```
#### Get One Pose
Request: `api/v1/poses/:id`
Response:
```
{
  "data": {
    "id": "15",
    "type": "pose",
    "attributes": {
      "name": "Downward-Facing Dog",
      "sanskrit_name": "Parivṛtta Adho Mukha Śvānāsana",
      "pose_description": "From downward_dog.html the legs are straight with the sits bones tilted up and reaching for the sky...",
      "translation_name": "parivṛtta = revolved, adho = downward, mukha = facing, śvāna = dog, āsana = posture",
      "image_url": "URL"
    }
  }
}
```