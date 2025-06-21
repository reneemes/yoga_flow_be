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

# API Documentation

<!-- ### Users
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
``` -->

## Poses
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
## Routines
#### Get All Routines
Request: `api/v1/routines`
Response:
```
{
  "data": [
    {
      "id": "1",
      "type": "routine",
      "attributes": {
        "name": "Example Routine",
        "description": "This is an example routine for getting started",
        "difficulty": "Beginner",
        "routine_poses": [
            {
              "pose_id": 5,
              "name": "Butterfly",
              "sanskrit_name": "Baddha Konasana",
              "translation_name": "baddha = bound, koṇa = angle, āsana = posture",
              "description": "...",
              "image_url": "URL"
            },
            {
              "pose_id": 10,
              "name": "Child's Pose",
              "sanskrit_name": "Balasana",
              "translation_name": "bala = child, āsana = posture",
              "description": "...",
              "image_url": "URL"
            }
          ]
        }
      },
      {
        "id": "2",
        "type": "routine",
        "attributes": {
          "name": "Example Routine 2",
          "description": "This is another example routine for getting started",
          "difficulty": "Intermediate",
          "routine_poses": [
            {
              "pose_id": 5,
              "name": "Butterfly",
              "sanskrit_name": "Baddha Konasana",
              "translation_name": "baddha = bound, koṇa = angle, āsana = posture",
              "description": "...",
              "image_url": "URL"
            },
            {
              "pose_id": 10,
              "name": "Child's Pose",
              "sanskrit_name": "Balasana",
              "translation_name": "bala = child, āsana = posture",
              "description": "...",
              "image_url": "URL"
            }
        ]
      }
    }
  ]
}
```

#### Get Routine Details
Request: `api/v1/routines/:id`
Response:
```
{
  "data": [
    {
      "id": "1",
      "type": "routine",
      "attributes": {
        "name": "Example Routine",
        "description": "This is an example routine for getting started",
        "difficulty": "Beginner",
        "routine_poses": [
          {
            "pose_id": 5,
            "name": "Butterfly",
            "sanskrit_name": "Baddha Konasana",
            "translation_name": "baddha = bound, koṇa = angle, āsana = posture",
            "description": "...",
            "image_url": "URL"
          },
          {
            "pose_id": 10,
            "name": "Child's Pose",
            "sanskrit_name": "Balasana",
            "translation_name": "bala = child, āsana = posture",
            "description": "...",
            "image_url": "URL"
          }
        ]
      }
    }
  ]
}

```

#### Create a Routine
Request: `api/v1/routines`
```
Body:

{
  "name": "New Routine",
  "description": "This is a new routine for beginners.",
  "difficulty": "Beginner",
  "poses": [8, 6]
}
```
Response:
```
{
  "data": {
    "id": "1",
    "type": "routine",
    "attributes": {
        "name": "New Routine",
        "description": "This is a new routine for testing this endpoint.",
        "difficulty": "Beginner",
        "routine_poses": [
          {
            "pose_id": 8,
            "name": "Child's Pose",
            "sanskrit_name": "Balasana",
            "translation_name": "bala = child, āsana = posture",
            "description": "...",
            "image_url": "URL"
          },
          {
            "pose_id": 6,
            "name": "Cat",
            "sanskrit_name": "Marjaryasana",
            "translation_name": "marjarya = cat, āsana = posture",
            "description": "...",
            "image_url": "URL"
          }
      ]
    }
  }
}
```
