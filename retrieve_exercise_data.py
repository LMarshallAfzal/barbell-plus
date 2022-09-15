import csv

with open('weightlifting_721_workouts.csv', encoding='utf-8-sig') as csv_file:
    csv_reader = csv.DictReader(csv_file)
    exercises = []
    prev = ''
    
    for row in csv_reader:
        if prev != row['Exercise Name']:
            exercises.append(row['Exercise Name'])
            prev = row['Exercise Name']
