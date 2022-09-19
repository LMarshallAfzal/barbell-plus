import datetime
import random
import csv
import os
from faker import Faker
import firebase_admin
from firebase_admin import credentials, firestore, storage


class Seeder():
    def __init__(self):
        self.cred = credentials.Certificate("serviceAccountKey.json")
        firebase_admin.initialize_app(self.cred)
        self.firestore_db = firestore.client()
        self.bucket_url_prefix = 'https://firebasestorage.googleapis.com/v0/b/'
        self.bucket = storage.bucket('barbell-plus-d094b.appspot.com/o/images/exercises')

        self.faker = Faker()
        self.PASSWORD = "Pa$$w0rd123!"
        self.USER_COUNT = 100
        self.EXERCISE_COUNT = 905
        self.RECORD_TYPE = ["weightAndReps", "repsOnly", "time", "timeAndWeight", "distance"]

    def seed(self):
        # self.create_users()
        self.create_exercises()
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

        print("Users created")

    def create_exercises(self):
        exercise_count = 0

        while exercise_count < self.EXERCISE_COUNT:
            # Get exercises from dataset.csv
            with open('dataset.csv', 'r') as file:
                reader = csv.DictReader(file)
                for row in reader:
                    exercise_name = row['name']
                    muscle_group = row['muscle']
                    equipment = row['equipment']
                    difficulty = row['difficulty']

                    print(f'Creating exercise {exercise_count}', end='\r')

                    exercise_id = exercise_name.replace(" ", "-").lower()
                    exercise_id = exercise_id.replace("/", "-slash-")
                    muscle_group = muscle_group[2:]
                    image_name = exercise_name.replace(' ', '_').lower()
                    image_name = image_name.replace('-', '')

                    self.firestore_db.collection("exercises").document(exercise_id).set({
                        "name": exercise_name,
                        "muscle": muscle_group,
                        "equipment": equipment,
                        "difficulty": difficulty,
                        "image": f'{self.bucket_url_prefix}barbell-plus-d094b.appspot.com/o/images%2Fexercises%2F{image_name}.gif?alt=media'
                    })
                    exercise_count += 1

        print("Exercises created")

    def create_workouts(self):
        self.firestore_db.collection("workouts").document("upper-lower-4-day").set({
            "name": "Upper Lower 4 Day Split",
            "description": "A 4 day split that focuses on upper and lower body",
            "image": f"{self.bucket.blob('images/bodybuilding-1.jpg').public_url}",
            "duration-in-weeks": 4,
            "number-of-sessions": 4,
            "sessions": [
                {
                    "name": "Session 1",
                    "description": "The first session of the week",
                    "exercises": [
                        {
                            "exercise": self.firestore_db.collection("exercises").document("barbell-squat"),
                            "sets": [4, 4, 4, 4],
                            "reps": [4, 4, 4, 4],
                            "target-reps": [4, 4, 4, 4],
                            "weight": [120, 120, 120, 120],
                            "rest": 180
                        },
                        {
                            "exercise": self.firestore_db.collection("exercises").document("barbell-bench-press"),
                            "sets": [4, 4, 4, 4],
                            "reps": [2, 2, 2, 2],
                            "target-reps": [2, 2, 2, 2],
                            "weight": [75, 75, 75, 75],
                            "rest": 180
                        },
                        {
                            "exercise": self.firestore_db.collection("exercises").document("bulgarian-split-squat"),
                            "sets": [4, 4, 4, 4],
                            "reps": [8, 6, 8, 6],
                            "target-reps": [8, 6, 6, 6],
                            "weight": [20, 20, 20, 20],
                            "rest": 180
                        },
                        {
                            "exercise": self.firestore_db.collection("exercises").document("dumbbell-bench-press"),
                            "sets": [4, 4, 4, 4],
                            "reps": [8, 6, 8, 6],
                            "target-reps": [8, 6, 6, 6],
                            "weight": [50, 50, 50, 50],
                            "rest": 180
                        },
                        {
                            "exercise": self.firestore_db.collection("exercises").document("lying-ez-bar-triceps-extension-(skullcrusher)"),
                            "sets": [4, 4, 4, 4],
                            "reps": [10, 10, 10, 10],
                            "target-reps": [10, 10, 10, 10],
                            "weight": [20, 20, 20, 20],
                            "rest": 180
                        }
                    ]
                },
                {
                    "name": "Session 2",
                    "description": "The second session of the week",
                    "exercises": [
                        {
                            "exercise": self.firestore_db.collection("exercises").document("barbell-bench-press"),
                            "sets": [3, 3, 3, 3],
                            "reps": [5, 4, 4, 4],
                            "target-reps": [5, 4, 4, 4],
                            "weight": [75, 75, 75, 75],
                            "rest": 120
                        },
                        {
                            "exercise": self.firestore_db.collection("exercises").document("barbell-deadlift"),
                            "sets": [4, 5, 5, 5],
                            "reps": [2, 2, 2, 2],
                            "target-reps": [2, 2, 2, 2],
                            "weight": [150, 150, 150, 150],
                            "rest": 120
                        },
                        {
                            "exercise": self.firestore_db.collection("exercises").document("leg-press"),
                            "sets": [5, 5, 5, 5],
                            "reps": [5, 5, 5, 5],
                            "target-reps": [5, 5, 5, 5],
                            "weight": [240, 240, 240, 240],
                            "rest": 120
                        },
                        {
                            "exercise": self.firestore_db.collection("exercises").document("barbell-row"),
                            "sets": [5, 5, 5, 5],
                            "reps": [5, 5, 5, 5],
                            "target-reps": [5, 5, 5, 5],
                            "weight": [60, 60, 60, 60],
                            "rest": 120
                        },
                        {
                            "exercise": self.firestore_db.collection("exercises").document("seated-cable-row"),
                            "sets": [3, 3, 3, 3],
                            "reps": [15, 15, 15, 15],
                            "target-reps": [15, 15, 15, 15],
                            "weight": [55, 55, 55, 55],
                            "rest": 120
                        }
                    ]
                },
                {
                    "name": "Session 3",
                    "description": "The third session of the week",
                    "exercises": [
                        {
                            "exercise": self.firestore_db.collection("exercises").document("barbell-squat"),
                            "sets": [4, 4, 6, 6],
                            "reps": [8, 8, 6, 6],
                            "target-reps": [8, 8, 6, 6],
                            "weight": [50, 50, 50, 50],
                            "rest": 120
                        },
                        {
                            "exercise": self.firestore_db.collection("exercises").document("barbell-bench-press"),
                            "sets": [4, 4, 6, 6],
                            "reps": [8, 8, 6, 6],
                            "target-reps": [8, 8, 6, 6],
                            "weight": [35, 35, 35, 35],
                            "rest": 120
                        },
                        {
                            "exercise": self.firestore_db.collection("exercises").document("dumbbell-bench-press"),
                            "sets": [4, 4, 6, 6],
                            "reps": [8, 8, 6, 6],
                            "target-reps": [8, 8, 6, 6],
                            "weight": [10, 10, 10, 10],
                            "rest": 120
                        },
                        {
                            "exercise": self.firestore_db.collection("exercises").document("barbell-good-mornings"),
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
                            "exercise": self.firestore_db.collection("exercises").document("barbell-deadlift"),
                            "sets": [4, 4, 6, 6],
                            "reps": [8, 8, 6, 6],
                            "target-reps": [8, 8, 6, 6],
                            "weight": [50, 50, 50, 50],
                            "rest": 120
                        },
                        {
                            "exercise": self.firestore_db.collection("exercises").document("standing-barbell-overhead-press"),
                            "sets": [4, 4, 6, 6],
                            "reps": [8, 8, 6, 6],
                            "target-reps": [8, 8, 6, 6],
                            "weight": [35, 35, 35, 35],
                            "rest": 120
                        },
                        {
                            "exercise": self.firestore_db.collection("exercises").document("dumbbell-lateral-raise"),
                            "sets": [4, 4, 6, 6],
                            "reps": [8, 8, 6, 6],
                            "target-reps": [8, 8, 6, 6],
                            "weight": [10, 10, 10, 10],
                            "rest": 120
                        },
                        {
                            "exercise": self.firestore_db.collection("exercises").document("single-arm-shoulder-press-dumbbell"),
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
