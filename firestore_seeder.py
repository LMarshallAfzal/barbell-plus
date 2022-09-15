import datetime
import random
import csv
from faker import Faker
import firebase_admin
from firebase_admin import credentials, firestore, storage


class Seeder():
    def __init__(self):
        self.cred = credentials.Certificate("serviceAccountKey.json")
        firebase_admin.initialize_app(self.cred)
        self.firestore_db = firestore.client()

        self.faker = Faker()
        self.PASSWORD = "Pa$$w0rd123!"
        self.USER_COUNT = 100
        self.RECORD_TYPE = ["weightAndReps", "repsOnly",
                            "time", "timeAndWeight", "distance"]
        self.FIREBASE_STORAGE_BUCKET = "barbell-plus-d094b.appspot.com/"
        self.IMAGE_PATH = "images/"

    def seed(self):
        self.get_exercise()
        # self.create_users()
        # self.create_exercises()
        # self.create_workouts()

    def create_users(self):
        user_count = 0
        user_num = random.randint(111, 999)

        while user_count < self.USER_COUNT:
            forename = self.faker.first_name()
            surname = self.faker.last_name()
            username = f'@{forename}{surname}{user_num}'
            email = f'{forename}.{surname}.{user_num}@{self.faker.domain_name()}'
            date_of_birth = datetime.datetime(
                random.randint(1970, 2002),
                random.randint(1, 12),
                random.randint(1, 28),
            )
            is_admin = self.faker.boolean()
            date_joined = datetime.datetime.now()

            print(f'Creating user {user_count}', end='\r')

            self.firestore_db.collection("users").add({
                "username": username,
                "forename": forename,
                "surname": surname,
                "email": email,
                "password": self.PASSWORD,
                "date-of-birth": date_of_birth,
                "is-admin": is_admin,
                "date-joined": date_joined
            })
            user_count += 1

    def create_exercises(self):
        while len(self.exercises) > 0:
            exercise = self.exercises.pop()
            print(f'Creating exercise {exercise}', end='\r')

            self.firestore_db.collection("exercises").document(exercise).set({
                "image": self.upload_image(exercise),
                "name": exercise,
                "description": self.faker.paragraph(nb_sentences=3),
                "primary-muscle-group": "Chest",
                "secondary-muscle-group": [],
                "record-type": self.RECORD_TYPE[0]
                
            })

        print("Creating exercises...")
        self.firestore_db.collection("exercises").document("bench-press").set({
            "image": f"{self.FIREBASE_STORAGE_BUCKET}{self.IMAGE_PATH}bench-press.jpg",
            "name": "Bench Press",
            "description": "Lay on a bench and push a barbell up",
            "primary-muscle-group": "Chest",
            "secondary-muscle-group": ["Triceps", "Front Delts"],
            "record-type": self.RECORD_TYPE[0]
        })

        self.firestore_db.collection("exercises").document("deadlift").set({
            "image": f"{self.FIREBASE_STORAGE_BUCKET}{self.IMAGE_PATH}deadlift.jpg",
            "name": "Deadlift",
            "description": "Lift a barbell off the floor",
            "primary-muscle-group": "Lower Back",
            "secondary-muscle-group": ["Hamstrings", "Glutes"],
            "record-type": self.RECORD_TYPE[0]
        })

        self.firestore_db.collection("exercises").document("squat").set({
            "image": f"{self.FIREBASE_STORAGE_BUCKET}{self.IMAGE_PATH}squat.jpg",
            "name": "Squat",
            "description": "Squat down and stand up with a barbell on your back",
            "primary-muscle-group": "Quads",
            "secondary-muscle-group": ["Glutes", "Hamstrings"],
            "record-type": self.RECORD_TYPE[0]
        })

        self.firestore_db.collection("exercises").document("overhead-press").set({
            "image": f"{self.FIREBASE_STORAGE_BUCKET}{self.IMAGE_PATH}overhead-press.jpg",
            "name": "Shoulder Press",
            "description": "Lift a barbell over your head",
            "primary-muscle-group": "Shoulders",
            "secondary-muscle-group": ["Triceps"],
            "record-type": self.RECORD_TYPE[0]
        })

        self.firestore_db.collection("exercises").document("bicep-curl").set({
            "image": f"{self.FIREBASE_STORAGE_BUCKET}{self.IMAGE_PATH}bicep-curl.jpg",
            "name": "Bicep Curl",
            "description": "Lift a dumbbell up to your shoulder",
            "primary-muscle-group": "Biceps",
            "secondary-muscle-group": ["Forearms"],
            "record-type": self.RECORD_TYPE[0]
        })

        self.firestore_db.collection("exercises").document("lateral-raise").set({
            "image": f"{self.FIREBASE_STORAGE_BUCKET}{self.IMAGE_PATH}lateral-raise.jpg",
            "name": "Lateral Raise",
            "description": "Lift dumbbells out to the side",
            "primary-muscle-group": "Shoulders",
            "secondary-muscle-group": ["Triceps"],
            "record-type": self.RECORD_TYPE[0]
        })

        self.firestore_db.collection("exercises").document("calf-raise").set({
            "image": f"{self.FIREBASE_STORAGE_BUCKET}{self.IMAGE_PATH}calf-raise.jpg",
            "name": "Calf Raise",
            "description": "Raise your heels off the ground while adding weight (dumbells or a barbell)",
            "primary-muscle-group": "Calves",
            "secondary-muscle-group": [],
            "record-type": self.RECORD_TYPE[0]
        })

    def create_workouts(self):
        self.firestore_db.collection("workouts").document("upper-lower-4-day").set({
            "name": "Upper Lower 4 Day Split",
            "description": "A 4 day split that focuses on upper and lower body",
            "image": f"{self.FIREBASE_STORAGE_BUCKET}{self.IMAGE_PATH}bodybuilder-1.jpg",
            "duration-in-weeks": 4,
            "number-of-sessions": 4,
            "sessions": [
                {
                    "name": "Upper 1",
                    "description": "The first upper body session",
                    "exercises": [
                        {
                            "exercise": self.firestore_db.collection("exercises").document("bench-press"),
                            "sets": [4, 4, 6, 6],
                            "reps": [8, 8, 6, 6],
                            "target-reps": [8, 8, 6, 6],
                            "weight": [50, 50, 50, 50],
                            "rest": 120
                        },
                        {
                            "exercise": self.firestore_db.collection("exercises").document("overhead-press"),
                            "sets": [4, 4, 6, 6],
                            "reps": [8, 8, 6, 6],
                            "target-reps": [8, 8, 6, 6],
                            "weight": [35, 35, 35, 35],
                            "rest": 120
                        },
                        {
                            "exercise": self.firestore_db.collection("exercises").document("lateral-raise"),
                            "sets": [4, 4, 6, 6],
                            "reps": [8, 8, 6, 6],
                            "target-reps": [8, 8, 6, 6],
                            "weight": [10, 10, 10, 10],
                            "rest": 120
                        },
                        {
                            "exercise": self.firestore_db.collection("exercises").document("bicep-curl"),
                            "sets": [4, 4, 6, 6],
                            "reps": [8, 8, 6, 6],
                            "target-reps": [8, 8, 6, 6],
                            "weight": [20, 20, 20, 20],
                            "rest": 120
                        }
                    ]
                },
                {
                    "name": "Lower 1",
                    "description": "The first lower body session",
                    "exercises": [
                        {
                            "exercise": self.firestore_db.collection("exercises").document("bench-press"),
                            "sets": [4, 4, 6, 6],
                            "reps": [8, 8, 6, 6],
                            "target-reps": [8, 8, 6, 6],
                            "weight": [50, 50, 50, 50],
                            "rest": 120
                        },
                        {
                            "exercise": self.firestore_db.collection("exercises").document("overhead-press"),
                            "sets": [4, 4, 6, 6],
                            "reps": [8, 8, 6, 6],
                            "target-reps": [8, 8, 6, 6],
                            "weight": [35, 35, 35, 35],
                            "rest": 120
                        },
                        {
                            "exercise": self.firestore_db.collection("exercises").document("lateral-raise"),
                            "sets": [4, 4, 6, 6],
                            "reps": [8, 8, 6, 6],
                            "target-reps": [8, 8, 6, 6],
                            "weight": [10, 10, 10, 10],
                            "rest": 120
                        },
                        {
                            "exercise": self.firestore_db.collection("exercises").document("bicep-curl"),
                            "sets": [4, 4, 6, 6],
                            "reps": [8, 8, 6, 6],
                            "target-reps": [8, 8, 6, 6],
                            "weight": [20, 20, 20, 20],
                            "rest": 120
                        }
                    ]
                },
                {
                    "name": "Upper 2",
                    "description": "The second upper body session",
                    "exercises": [
                        {
                            "exercise": self.firestore_db.collection("exercises").document("bench-press"),
                            "sets": [4, 4, 6, 6],
                            "reps": [8, 8, 6, 6],
                            "target-reps": [8, 8, 6, 6],
                            "weight": [50, 50, 50, 50],
                            "rest": 120
                        },
                        {
                            "exercise": self.firestore_db.collection("exercises").document("overhead-press"),
                            "sets": [4, 4, 6, 6],
                            "reps": [8, 8, 6, 6],
                            "target-reps": [8, 8, 6, 6],
                            "weight": [35, 35, 35, 35],
                            "rest": 120
                        },
                        {
                            "exercise": self.firestore_db.collection("exercises").document("lateral-raise"),
                            "sets": [4, 4, 6, 6],
                            "reps": [8, 8, 6, 6],
                            "target-reps": [8, 8, 6, 6],
                            "weight": [10, 10, 10, 10],
                            "rest": 120
                        },
                        {
                            "exercise": self.firestore_db.collection("exercises").document("bicep-curl"),
                            "sets": [4, 4, 6, 6],
                            "reps": [8, 8, 6, 6],
                            "target-reps": [8, 8, 6, 6],
                            "weight": [20, 20, 20, 20],
                            "rest": 120
                        }
                    ]
                },
                {
                    "name": "Lower 2",
                    "description": "The second lower body session",
                    "exercises": [
                        {
                            "exercise": self.firestore_db.collection("exercises").document("bench-press"),
                            "sets": [4, 4, 6, 6],
                            "reps": [8, 8, 6, 6],
                            "target-reps": [8, 8, 6, 6],
                            "weight": [50, 50, 50, 50],
                            "rest": 120
                        },
                        {
                            "exercise": self.firestore_db.collection("exercises").document("overhead-press"),
                            "sets": [4, 4, 6, 6],
                            "reps": [8, 8, 6, 6],
                            "target-reps": [8, 8, 6, 6],
                            "weight": [35, 35, 35, 35],
                            "rest": 120
                        },
                        {
                            "exercise": self.firestore_db.collection("exercises").document("lateral-raise"),
                            "sets": [4, 4, 6, 6],
                            "reps": [8, 8, 6, 6],
                            "target-reps": [8, 8, 6, 6],
                            "weight": [10, 10, 10, 10],
                            "rest": 120
                        },
                        {
                            "exercise": self.firestore_db.collection("exercises").document("bicep-curl"),
                            "sets": [4, 4, 6, 6],
                            "reps": [8, 8, 6, 6],
                            "target-reps": [8, 8, 6, 6],
                            "weight": [20, 20, 20, 20],
                            "rest": 120
                        }
                    ]
                }
            ]
        })

if __name__ == "__main__":
    seeder = Seeder()
    seeder.seed()
