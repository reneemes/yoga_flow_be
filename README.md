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
  "poses": [
    10,
    7,
    8,
    38,
    26,
    43,
    15,
    44,
    45,
    29,
    18
  ]
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
                    "description": "From a kneeling position, the toes and knees are together with most of the weight of the body resting on the heels of the feet.  The arms are extended back resting alongside the legs.  The forehead rests softly onto the earth.  The gaze is down and inward.",
                    "pose_benefits": "Gently stretches the hips, thighs, and ankles.  Calms the brain and helps relieve stress and fatigue.  Relieves back and neck pain when done with head and torso supported.",
                    "image_url": "https://res.cloudinary.com/dko1be2jy/image/upload/fl_sanitize/v1676483079/yoga-api/10_wzpo85.svg"
                },
                {
                    "pose_id": 6,
                    "name": "Cat",
                    "sanskrit_name": "Marjaryasana",
                    "translation_name": "marjarya = cat, āsana = posture",
                    "description": "From box neutral shift some weight to the palms.  The wrists, elbows and shoulders are in one line.  The abdomen is pulled in and up with the spine arched in a strong Cobra spine.  The crown of the head is towards the earth and the neck is relaxed.  The gaze is between the arms towards the belly.",
                    "pose_benefits": "Relieves the spine and neck. Energizes the body.",
                    "image_url": "https://res.cloudinary.com/dko1be2jy/image/upload/fl_sanitize/v1676483075/yoga-api/7_a6aspg.svg"
                },
                {
                    "pose_id": 10,
                    "name": "Cow",
                    "sanskrit_name": "Bitilasana",
                    "translation_name": "bitil = cow, āsana = posture",
                    "description": "From  box neutral the ribcage is lifted with a gentle sway in the low back.  The tailbone lifts up into dog tilt.  The eyes are soft and the gaze is to the sky.",
                    "pose_benefits": "Removes fatigue.  Improves breathing and the circulation of blood to the brain.  Rejuvenates the entire body.",
                    "image_url": "https://res.cloudinary.com/dko1be2jy/image/upload/fl_sanitize/v1676483077/yoga-api/8_wi10sn.svg"
                },
                {
                    "pose_id": 40,
                    "name": "Standing Forward Bend",
                    "sanskrit_name": "Uttanasana",
                    "translation_name": "uttāna = stretch out, āsana = posture",
                    "description": "From a standing position, the body is folded over at the crease of the hip with the spine long.  The neck is relaxed and the crown of the head is towards the earth.  The feet are rooted into the earth with the toes actively lifted.  The spine is straight.  The ribcage is lifted.  The chest and the thighs are connected.  The sacrum lifts up toward the sky in dog tilt.  The fingertips are resting on the earth next to the toes.  The gaze is down or slightly forward.",
                    "pose_benefits": "Calms the brain and helps relieve stress and mild depression.  Stimulates the liver and kidneys.  Stretches the hamstrings, calves, and hips.  Strengthens the thighs and knees.  Improves digestion.  Helps relieve the symptoms of menopause.  Reduces fatigue and anxiety.  Relieves headache and insomnia.",
                    "image_url": "https://res.cloudinary.com/dko1be2jy/image/upload/fl_sanitize/v1676483093/yoga-api/38_yb3thk.svg"
                },
                {
                    "pose_id": 30,
                    "name": "Plank",
                    "sanskrit_name": "Phalakasana",
                    "translation_name": "phalaka = plank, āsana = posture",
                    "description": "The body is parallel to the earth.  The weight of the body is supported by straight arms and active toes.  The abdomen is pulled up towards the spine and the pelvis is tucked in.  The neck is a natural extension of the spine and the chin is slightly tucked.  The palms are flat and the elbows are close to the side body.  The joints are stacked with the wrists, elbows and shoulders in a straight line perpendicular to the earth.  The gaze follows the spine and the eyes are focused down.",
                    "pose_benefits": "Strengthens the arms, wrists, and spine.  Tones the abdomen.",
                    "image_url": "https://res.cloudinary.com/dko1be2jy/image/upload/fl_sanitize/v1676483088/yoga-api/26_mxkzlo.svg"
                },
                {
                    "pose_id": 43,
                    "name": "Upward-Facing Dog",
                    "sanskrit_name": "Urdhva Mukha Svsnssana",
                    "translation_name": "ūrdhva = upward, mukha = facing, śvāna = dog, āsana = posture",
                    "description": "The body is in a prone position parallel to the earth.  The weight of the body is supported equally by the straight arms and the tops of the feet which press firmly into the earth.  The shoulders are rotated back and down.  The ribcage is lifted and pulled thru to the front in a slight upper thoracic backbend.  The joints are stacked with the wrists, elbows and shoulders in a straight-line.  The neck is a natural extension of the spine and the chin is slightly tucked.  The abdomen is pulled up towards the spine.  The palms are flat and the elbows are close to the side body.  The gaze is forward.",
                    "pose_benefits": "Improves posture.  Strengthens the spine, arms, and wrists.  Stretches the chest, lungs, shoulders, and abdomen.  Firms the buttocks.  Stimulates abdominal organs.  Helps relieve mild depression, fatigue, and sciatica.  Therapeutic for asthma.",
                    "image_url": "https://res.cloudinary.com/dko1be2jy/image/upload/fl_sanitize/v1676483096/yoga-api/43_m3nxjk.svg"
                },
                {
                    "pose_id": 15,
                    "name": "Downward-Facing Dog",
                    "sanskrit_name": "Adho Mukha Svanasana",
                    "translation_name": "parivṛtta = revolved, adho = downward, mukha = facing, śvāna = dog, āsana = posture",
                    "description": "From downward_dog.html the legs are straight with the sits bones tilted up and reaching for the sky.  The feet are flat with the heels firmly rooted.  One palm is flat with the knuckles evenly pressed into the earth.  The other hand reaches under the body and grasps the opposite ankle.  The spine is long and the heart is open toward the sky.  The neck is loose and the crown of the head is relaxed toward the earth.  The gaze is toward the center.",
                    "pose_benefits": "Calms the brain and helps relieve stress and mild depression.  Energizes the body.  Stretches the shoulders, neck, hamstrings, calves, arches, and hands.  Strengthens the arms and legs.  Helps relieve the symptoms of menopause.  Relieves menstrual discomfort when done with the head supported.  Helps prevent osteoporosis.  Improves digestion.  Relieves headache, insomnia, back pain, and fatigue.  Therapeutic for high blood pressure, asthma, flat feet, sciatica, and sinusitis.",
                    "image_url": "https://res.cloudinary.com/dko1be2jy/image/upload/fl_sanitize/v1676483081/yoga-api/15_vkviqn.svg"
                },
                {
                    "pose_id": 44,
                    "name": "Warrior One",
                    "sanskrit_name": "Virabhadrasana One",
                    "translation_name": "vīrabhadra = warrior, āsana = posture",
                    "description": "From a standing position, the legs are in a wide stance with the feet aligned and flat on the earth.  The back foot is in a 60-degree angle towards the front.  The hips are squared.  The inner thighs are rotated towards each other.  The front knee is bent in a 90-degree angle directly above the ankle.  The arms extend up to the sky with the biceps by the ears.  The hands can be together or separated and facing each other with the fingers spread wide.  The ribcage is lifted and the pelvis tucked.  The gaze is forward.",
                    "pose_benefits": "Stretches the chest, lungs, shoulders, neck, belly and groin (psoas).  Strengthens the shoulders, arms and back muscles.  Strengthens and stretches the thighs, calves and ankles.",
                    "image_url": "https://res.cloudinary.com/dko1be2jy/image/upload/fl_sanitize/v1676483096/yoga-api/44_dqeayo.svg"
                },
                {
                    "pose_id": 46,
                    "name": "Warrior Two",
                    "sanskrit_name": "Virabhadrasana Two",
                    "translation_name": "vīrabhadra = warrior, āsana = posture",
                    "description": "From a standing position, the legs are separated into a wide stance.  The front knee is bent in a 90-degree angle directly above the ankle.  The back leg is extended and straight with the outside edge of the back foot gripping the earth in a 60-degree angle towards the front.  The inner thighs are externally rotated away from each other.  The pelvis is tucked.  The ribcage is lifted.  The arms are extended out to the sides and are aligned with the shoulders in a straight line with the fingers reaching out as the shoulder blades squeeze together.  The gaze is toward the front fingers.",
                    "pose_benefits": "Strengthens and stretches the legs and ankles.  Stretches the groin, chest, lungs, and shoulders.  Stimulates abdominal organs.  Increases stamina.  Relieves backaches, especially through second trimester of pregnancy.  Therapeutic for carpal tunnel syndrome, flat feet, infertility, osteoporosis, and sciatica.",
                    "image_url": "https://res.cloudinary.com/dko1be2jy/image/upload/fl_sanitize/v1676483096/yoga-api/45_ehimr1.svg"
                },
                {
                    "pose_id": 33,
                    "name": "Reverse Warrior",
                    "sanskrit_name": "Parsva Virabhadrasana",
                    "translation_name": "pārśva = side, vīrabhadra = warrior, āsana = posture",
                    "description": "From warrior II , the lower body stays static while the upper body arches back in a gentle back bend.  The top arm is extended back with the bicep by the ear and the fingers spread wide.  The other arm slides down the back leg resting on the thigh or shin, but not the knee joint.  The gaze is up towards the sky.",
                    "pose_benefits": "Strengthens and stretches the legs, knees, and ankles.  Stretches the groin, spine, waist, chest, lungs, and shoulders.  Stimulates abdominal organs.  Increases stamina.  Relieves backaches, especially through second trimester of pregnancy.  Therapeutic for carpal tunnel syndrome, flat feet, infertility, osteoporosis, and sciatica.",
                    "image_url": "https://res.cloudinary.com/dko1be2jy/image/upload/fl_sanitize/v1676483089/yoga-api/29_ww7bot.svg"
                },
                {
                    "pose_id": 18,
                    "name": "Extended Side Angle",
                    "sanskrit_name": "Utthita Parsvakonasana",
                    "translation_name": "utthita = extended, pārśva = side, koṇa = angle, āsana = posture",
                    "description": "From warrior II the lower body stays static while the upper body is folded forward at the crease of the hip.  One arm is extended toward the front with the bicep by the ear and the fingers spread wide while the other reaches down to the earth on the inside of the thigh.  The upper torso and the gaze twist up towards the sky.",
                    "pose_benefits": "Strengthens and stretches the legs, knees, and ankles.  Stretches the groin, spine, waist, chest, lungs, and shoulders. Stimulates abdominal organs. Increases stamina.",
                    "image_url": "https://res.cloudinary.com/dko1be2jy/image/upload/fl_sanitize/v1676483083/yoga-api/18_aqufak.svg"
                }
            ]
        }
    }
}
```