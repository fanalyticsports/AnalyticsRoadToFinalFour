

##Python Script

import csv as csv 
import numpy as np

# Open up the csv file in to a Python object
csv_file_object = csv.reader(open('/Users/name/Desktop/NCAA_TEAMS_UPLOAD.csv', 'rb')) 
header = csv_file_object.next()  # The next() command just skips the 
                                 # first line which is a header
data=[]                          # Create a variable called 'data'.
for row in csv_file_object:      # Run through each row in the csvfile,
    data.append(row)             # adding each row to the data variable
ncaa_team_data = np.array(data) # Then convert from a list to an array
               # Be aware that each item is currently
               # a string in this format
##Loop through teams and gets stats using API               
import urllib2
import pandas as pd

##Use results and put them in a dataset to be used for looping through play by play data
raw_data_list = []

for rows in ncaa_team_data:
    url = "http://api.sportradar.us/ncaamb-t3/seasontd/2016/REG/teams/"+rows[2]+'/'"statistics.json?api_key=#"
    try:
        raw_data = urllib2.urlopen(url).read()
        if raw_data != "":
            raw_data_list.append(raw_data)
    except:
        pass

data = "[" + (",".join(raw_data_list)) + "]"
data = pd.read_json(data, orient='records')
data
