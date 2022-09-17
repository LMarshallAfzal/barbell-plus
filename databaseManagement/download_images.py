import csv
import os

class Downloader():
    def download_or_delete_images(self):
        while True:
            print("download: Download images from dataset.csv")
            print("delete: Delete all images in exerciseImages folder")
            print("exit: Exit program")
            user_input = input("Type a command: ")
            if user_input == 'download':
                self.download_images()
                break
            elif user_input == 'delete':
                self.delete_images()
                break
            elif user_input == 'exit':
                break
            else:
                print("Invalid input")

# Get all images from 'movement_images' column in dataset.csv and save them to the 'exerciseImages' folder
    def download_images(self):
        with open('dataset.csv', 'r') as csv_file:
            csv_reader = csv.DictReader(csv_file)
            for row in csv_reader:
                try:
                    image = row['movement_images']
                    image_name = row['name'].replace(' ', '_').lower() + '.gif'
                    image_name = image_name.replace('-', '')
                    os.system(f'wget {image} -O exerciseImages/{image_name}')
                except:
                    print('ERROR: Could not download image')

# Delete all files in 'exerciseImages' folder
    def delete_images(self):
        for image in os.listdir('exerciseImages'):
            os.remove(f'exerciseImages/{image}')  
        print('Deleted all images in exerciseImages folder')

if __name__ == "__main__":
    downloader = Downloader()
    downloader.download_or_delete_images()



