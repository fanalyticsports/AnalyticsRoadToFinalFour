# AnalyticsRoadToFinalFour
AnalyticsRoadToTheFinalFour 2017 by @Fanalyticsports

Check out our entry for the Tableau Iron Viz competition in 2017. Our goal was to design something that looked at the proximity of opponents in the NCAA Final Four as part of our #AnalyticsRoadToTheFinalFour. It's a combination of a variety of Business Intelligence tools & solutions from AWS, Python, R, Atom, GeoJSon, and Tableau. All positioned in one dashboard to see how your team have seeded and traveled throughout the years. Feel free to check out your team and enjoy. 

Tableau Public Profile @Fanalyticsports 

https://public.tableau.com/profile/fanalyticsports#!/vizhome/shared/DN9PJ5JFF


Blog Entry and How to's:

Step 1: Data Gathering

We used a combination of sources for this from http://www.sports-reference.com/cbb to API calls from Sportsradar. For more information on this API follow our upcoming blog on this but below is a basic call to grab the teams and loop through each team to gather the information. There is some pretty cool data in these feeds. 

Use TeamStats.py


Step 2: Data Wrangling & Geocoding

For this we switched to R to use it's geolocation packaging. With the game and the following data points: Home_City_State, Away_City_State, and Stadium_City_State we calculate the distance as a crow flies for each game. 


Step 3: Create Visualization Using Data and Spatial File

We start with creating a geojson spatial file which Tableau can incorporate. This is my first time using geojson so I was glad I found http://geojson.io to help create my location map. I used my cvs to create the json copied this into Atom. Formatted as a .geojson and within minutes I had my first .geojson file. 

With that complete we moved on to uploading the spatial file and the NCAA location team data to begin developing our Viz.

Step 4: Complete the Viz in Tableau 

This part was pretty easy with some suggestions and tips from a few other Viz experts we were able to use the cool new pathing feature in 10 and bring across the logos. The spatial file became a nice to have but with the logos and everything else all we really needed was the city points which become the stadiums on the map.

Through in a few basic scatter charts and some action items and the dashboard is nice interactive way to travel the Final Four and follow your team and the effect distance had on them. 

Enjoy. 
