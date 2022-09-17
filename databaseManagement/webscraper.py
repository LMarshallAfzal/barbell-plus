from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time
import csv
import os

ITEM_COUNT_1 = 451
exercise_data = {
    "name": [],
    "muscle": [],
    "equipment": [],
    "movement_images": [],
    "difficulty": [],
}

# Delete the csv file if it exists
try:
    with open('dataset2.csv', 'r') as csv_file:
        os.remove('dataset2.csv')
except FileNotFoundError:
    print('ERROR: dataset.csv does not exist')

# Set up the webdriver
url = "https://www.fitsw.com/exercise-list"
driver = webdriver.Chrome('/home/leonard/projects/barbell-plus/chromedriver')
driver.get(url)
driver.maximize_window()
time.sleep(1)

# Scroll to the down 418 pixels
scroll1 = 418
driver.execute_script(f"window.scrollTo(0, {scroll1});")
time.sleep(1)

count1 = 1
while count1 < ITEM_COUNT_1:
    try:
        if count1 != 448:
            muscle = driver.find_element(by=By.XPATH, value=f'//*[@id="exercise-table-body"]/tr[{count1}]/td[1]').text
            name = driver.find_element(by=By.XPATH, value=f'//*[@id="exercise-table-body"]/tr[{count1}]/td[2]').text
            difficulty = driver.find_element(by=By.XPATH, value=f'//*[@id="exercise-table-body"]/tr[{count1}]/td[3]').text
            equipment = driver.find_element(by=By.XPATH, value=f'//*[@id="exercise-table-body"]/tr[{count1}]/td[4]').text

            driver.find_element(by=By.XPATH, value=f'//*[@id="exercise-table-body"]/tr[{count1}]/td[6]').click()
            time.sleep(1)
            
            image = driver.find_element(by=By.XPATH, value=f'//*[@id="demoImg"]').get_attribute('src')
            driver.find_element(by=By.XPATH, value=f'//*[@id="exerciseQuickView"]/div/div/div[1]/button').click()
            
            exercise_data["name"].append(name)
            exercise_data["muscle"].append(muscle)
            exercise_data["equipment"].append(equipment)
            exercise_data["movement_images"].append(image)
            exercise_data["difficulty"].append(difficulty)

        print(f'{count1}: {name}, {muscle}, {equipment}, {difficulty}, {image}')

        table_number = 30
        scroll1 += 35.09 

        if table_number == 0:
            scroll1 += 280.72

        driver.execute_script(f"window.scrollTo(0, {scroll1});")

        count1 += 1
    
    except Exception as e:
        print(e)
        count1 += 1
        time.sleep(3)

# scroll to a specific td element
count2 = 35
while count2 < 430:
    driver.execute_script("arguments[0].scrollIntoView();", driver.find_element(by=By.XPATH, value=f'//*[@id="exercise-table-body"]/tr[{count2}]/td[1]'))
    time.sleep(1)
    count2 += 10

ITEM_COUNT_2 = 915
scroll2 = 18000
count2 = 430
while count2 < ITEM_COUNT_2:
    try:
        muscle = driver.find_element(by=By.XPATH, value=f'//*[@id="exercise-table-body"]/tr[{count2}]/td[1]').text
        name = driver.find_element(by=By.XPATH, value=f'//*[@id="exercise-table-body"]/tr[{count2}]/td[2]').text
        difficulty = driver.find_element(by=By.XPATH, value=f'//*[@id="exercise-table-body"]/tr[{count2}]/td[3]').text
        equipment = driver.find_element(by=By.XPATH, value=f'//*[@id="exercise-table-body"]/tr[{count2}]/td[4]').text

        driver.find_element(by=By.XPATH, value=f'//*[@id="exercise-table-body"]/tr[{count2}]/td[6]').click()
        time.sleep(1)
        
        image = driver.find_element(by=By.XPATH, value=f'//*[@id="demoImg"]').get_attribute('src')
        driver.find_element(by=By.XPATH, value=f'//*[@id="exerciseQuickView"]/div/div/div[1]/button').click()
        
        exercise_data["name"].append(name)
        exercise_data["muscle"].append(muscle)
        exercise_data["equipment"].append(equipment)
        exercise_data["movement_images"].append(image)
        exercise_data["difficulty"].append(difficulty)

        print(f'{count2}: {name}, {muscle}, {equipment}, {difficulty}, {image}')

        driver.execute_script("arguments[0].scrollIntoView();", driver.find_element(by=By.XPATH, value=f'//*[@id="exercise-table-body"]/tr[{count2}]/td[1]'))

        count2 += 1
    
    except Exception as e:
        print(e)
        count2 += 1
        time.sleep(3)

# Write to exercises data to dataset.csv
with open('dataset2.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(exercise_data.keys())
    writer.writerows(zip(*exercise_data.values()))

driver.quit()