import os
import firebase_admin
from firebase_admin import credentials, firestore, storage

# Upload all images in the 'exerciseImages' folder to firebase storage
class Uploader():
    def __init__(self):
        self.cred = credentials.Certificate("serviceAccountKey.json")
        firebase_admin.initialize_app(self.cred)
        self.firestore_db = firestore.client()
        self.bucket = storage.bucket('barbell-plus-d094b.appspot.com')

    # If image user types upload, upload images to firebase storage. If user types delete, delete images from firebase storage
    def upload_or_delete_images(self):
        while True:
            user_input = input("Type 'upload' to upload images to firebase storage or 'delete' to delete images from firebase storage: ")
            if user_input == 'upload':
                self.upload_images()
                break
            elif user_input == 'delete':
                self.delete_images()
                break
            else:
                print("Invalid input")

    def upload_images(self):
        for image in os.listdir('exerciseImages'):
            blob = self.bucket.blob(f'images/exercises/{image}')
            blob.upload_from_filename(f'exerciseImages/{image}')
            print(f'Uploaded {image} to firebase storage')

    def delete_images(self):
        for image in os.listdir('exerciseImages'):
            blob = self.bucket.blob(f'images/exercises/{image}')
            blob.delete()
            print(f'Deleted {image} from firebase storage')

if __name__ == "__main__":
    uploader = Uploader()
    uploader.upload_or_delete_images()            