import datetime
import firebase_admin
from firebase_admin import credentials, firestore


class Unseeder():
    def __init__(self):
        self.cred = credentials.Certificate("serviceAccountKey.json")
        firebase_admin.initialize_app(self.cred)
        self.firestore_db = firestore.client()
        
        self.EXERCISE_COUNT = 905

    def unseed(self):
        # self.delete_users()
        # self.delete_exercises()
        self.delete_workouts()

    def delete_users(self):
        print("Deleting users...")
        users = self.firestore_db.collection("users").stream()
        for user in users:
            user.reference.delete()

    def delete_exercises(self):
        print("Deleting exercises...")
        exercises = self.firestore_db.collection("exercises").stream()
        for exercise in exercises:
            exercise.reference.delete()

    def delete_workouts(self):
        print("Deleting workouts...")
        workouts = self.firestore_db.collection("workouts").stream()
        for workout in workouts:
            workout.reference.delete()

if __name__ == "__main__":
    unseeder = Unseeder()
    unseeder.unseed()