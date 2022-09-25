import datetime
import random
import csv
import os
import openpyxl
import xlrd
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
        # self.create_exercises()
        self.create_workouts()

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
        exercises_1 = []
        exercises_2 = []
        exercises_3 = []
        exercises_4 = []

        sets_1 = []
        sets_2 = []
        sets_3 = []
        sets_4 = []

        target_reps_1 = []
        target_reps_2 = []
        target_reps_3 = []
        target_reps_4 = []

        with open('kcl-barbell-program-leonard--basic-strength-v1.csv', 'r') as csv_file:
            csv_reader = csv.reader(csv_file)
            count = 1
            for line in csv_reader:
                if not line[0]:
                    count += 1
                    if count == 5:
                        break
                else:
                    if count == 1:
                        exercises_1.append(line[0])
                        sets_1.append(line[1])
                        target_reps_1.append(line[2])
                    elif count == 2:
                        exercises_2.append(line[0])
                        sets_2.append(line[1])
                        target_reps_2.append(line[2])
                    elif count == 3:
                        exercises_3.append(line[0])
                        sets_3.append(line[1])
                        target_reps_3.append(line[2])
                    elif count == 4:
                        exercises_4.append(line[0])
                        sets_4.append(line[1])
                        target_reps_4.append(line[2])
            exercises_1.pop(0)
            sets_1.pop(0)
            target_reps_1.pop(0)

        doc_id = 'kcl-barbell-program-leonard-basic-strength-v1'
        workout_name = 'KCL Barbell Program - Leonard - Basic Strength V1'

        for i in range(len(sets_1)):
            if '[' in sets_1[i]:
                try:
                    sets_1[i] = sets_1[i].replace('[', '')
                    sets_2[i] = sets_2[i].replace('[', '')
                    sets_3[i] = sets_3[i].replace('[', '')
                    sets_4[i] = sets_4[i].replace('[', '')
                    target_reps_1[i] = target_reps_1[i].replace('[', '')
                    target_reps_2[i] = target_reps_2[i].replace('[', '')
                    target_reps_3[i] = target_reps_3[i].replace('[', '')
                    target_reps_4[i] = target_reps_4[i].replace('[', '')
                except IndexError:
                    break

            if ']' in sets_1[i]:
                try:
                    sets_1[i] = sets_1[i].replace(']', '')
                    sets_2[i] = sets_2[i].replace(']', '')
                    sets_3[i] = sets_3[i].replace(']', '')
                    sets_4[i] = sets_4[i].replace(']', '')
                    target_reps_1[i] = target_reps_1[i].replace(']', '')
                    target_reps_2[i] = target_reps_2[i].replace(']', '')
                    target_reps_3[i] = target_reps_3[i].replace(']', '')
                    target_reps_4[i] = target_reps_4[i].replace(']', '')
                except IndexError:
                    break

            if ', ' in sets_1[i]:
                try:
                    sets_1[i] = sets_1[i].split(', ')
                    sets_3[i] = sets_3[i].split(', ')
                    sets_2[i] = sets_2[i].split(', ')
                    sets_4[i] = sets_4[i].split(', ')
                    target_reps_1[i] = target_reps_1[i].split(', ')
                    target_reps_2[i] = target_reps_2[i].split(', ')
                    target_reps_3[i] = target_reps_3[i].split(', ')
                    target_reps_4[i] = target_reps_4[i].split(', ')
                except IndexError:
                    break

        self.firestore_db.collection("workouts").document(doc_id).set({
            "name": workout_name,
            "description": "A basic strength program for beginners",
                "sessions": [
                    {
                        "name": "Session 1",
                        "description": "The first session of the week",
                        "exercises": [
                            {
                                "exercise": exercises_1[0],
                                "sets": sets_1[0],
                                "target-reps": target_reps_1[0],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            },
                            {
                                "exercise": exercises_1[1],
                                "sets": sets_1[1],
                                "target-reps": target_reps_1[1],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            },
                            {
                                "exercise": exercises_1[2],
                                "sets": sets_1[2],
                                "target-reps": target_reps_1[2],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            },
                            {
                                "exercise": exercises_1[3],
                                "sets": sets_1[3],
                                "target-reps": target_reps_1[3],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            },
                            {
                                "exercise": exercises_1[4],
                                "sets": sets_1[4],
                                "target-reps": target_reps_1[4],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            },
                            {
                                "exercise": exercises_1[5],
                                "sets": sets_1[5],
                                "target-reps": target_reps_1[5],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            },
                            {
                                "exercise": exercises_1[6],
                                "sets": sets_1[6],
                                "target-reps": target_reps_1[6],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            },
                        ]
                    },
                    {
                        "name": "Session 2",
                        "description": "The second session of the week",
                        "exercises": [
                            {
                                "exercise": exercises_2[0],
                                "sets": sets_2[0],
                                "target-reps": target_reps_2[0],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            },
                            {
                                "exercise": exercises_2[1],
                                "sets": sets_2[1],
                                "target-reps": target_reps_2[1],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            },
                            {
                                "exercise": exercises_2[2],
                                "sets": sets_2[2],
                                "target-reps": target_reps_2[2],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            },
                            {
                                "exercise": exercises_2[3],
                                "sets": sets_2[3],
                                "target-reps": target_reps_2[3],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            },
                            {
                                "exercise": exercises_2[4],
                                "sets": sets_2[4],
                                "target-reps": target_reps_2[4],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            },
                            {
                                "exercise": exercises_2[5],
                                "sets": sets_2[5],
                                "target-reps": target_reps_2[5],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            },
                            {
                                "exercise": exercises_2[6],
                                "sets": sets_2[6],
                                "target-reps": target_reps_2[6],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            },
                        ]
                    },
                    {
                        "name": "Session 3",
                        "description": "The third session of the week",
                        "exercises": [
                            {
                                "exercise": exercises_3[0],
                                "sets": sets_3[0],
                                "target-reps": target_reps_3[0],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            },
                            {
                                "exercise": exercises_3[2],
                                "sets": sets_3[2],
                                "target-reps": target_reps_3[2],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            },
                            {
                                "exercise": exercises_3[3],
                                "sets": sets_3[3],
                                "target-reps": target_reps_3[3],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            },
                            {
                                "exercise": exercises_3[4],
                                "sets": sets_3[4],
                                "target-reps": target_reps_3[4],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            },
                            {
                                "exercise": exercises_3[5],
                                "sets": sets_3[5],
                                "target-reps": target_reps_3[5],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            },
                            {
                                "exercise": exercises_3[6],
                                "sets": sets_3[6],
                                "target-reps": target_reps_3[6],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            }
                        ]
                    },
                    {
                        "name": "Session 4",
                        "description": "The fourth session of the week",
                        "exercises": [
                            {
                                "exercise": exercises_4[0],
                                "sets": sets_4[0],
                                "target-reps": target_reps_4[0],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            },
                            {
                                "exercise": exercises_4[1],
                                "sets": sets_4[1],
                                "target-reps": target_reps_4[1],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            },
                            {
                                "exercise": exercises_4[2],
                                "sets": sets_4[2],
                                "target-reps": target_reps_4[2],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            },
                            {
                                "exercise": exercises_4[3],
                                "sets": sets_4[3],
                                "target-reps": target_reps_4[3],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            },
                            {
                                "exercise": exercises_4[4],
                                "sets": sets_4[4],
                                "target-reps": target_reps_4[4],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            },
                            {
                                "exercise": exercises_4[5],
                                "sets": sets_4[5],
                                "target-reps": target_reps_4[5],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            },
                            {
                                "exercise": exercises_4[6],
                                "sets": sets_4[6],
                                "target-reps": target_reps_4[6],
                                "reps": [],
                                "weight": [],
                                "rest": 120
                            }
                        ]
                    }
                ]
            }
        )

if __name__ == "__main__":
    seeder = Seeder()
    seeder.seed()
