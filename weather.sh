#! /bin/bash
#####################################################################
#####################################################################
##weather.sh is a script used to query a weather program,          ##
##$weather-report, for the forecast for the locaton of the server. ##
##The data is then parsed and piped to a formatted html file that  ##
##is accessible on my personal domain:                             ##
##http://tjzimmerman.com:2000/weather.html                         ##
#####################################################################
#####################################################################

#Reset the text files and pipe the output so that weather-report 
#doesn't have to be run multiple times for each parsed line.
> weather.txt
> forecast.txt
> /media/NetDrive/Website/weather.html
weather-report -a 49534 >> weather.txt
weather-report -f 49534 >> forecast.txt

#Output weather alerts to one file and then forecast to another. 
#Since both flags cannot be run simultaneously.
echo "<html>" && echo "<h1>Weather information for Frodo</h1>"

#Output the relevant date information.
echo -n "<b>Information was last updated on: </b>" && cat weather.txt | grep -oP '(?<=Last updated ).*EST' && echo "<br>"
echo -n "<b>This script was last ran on: </b>" && date "+%a %d, %Y - %I:%M %p %Z" && echo "<br><br>"

#Output the relevant location and weather conditions. Used $sed to 
#remove some default formatting that I didn't like.
echo -n "<b>Server Location: </b>" && cat weather.txt | grep -oP '(?<=Current conditions at ).*' && echo "<br>"
echo -n "<b>Current conditions: </b>" && cat weather.txt | grep -oP '(?<=Sky conditions: ).*' | sed 's/.*/\L&/; s/[a-z]*/\u&/g' && echo "<br><br>"

#Output the temperature and humidity. Used $cut so that only the 
#actual temperature and humidity numerical values would be shown.
#This was so that I could bold the temperature and humidity 
#headings individually instead of the entire lines.
echo "<b>Temperature: </b>" && cat weather.txt | grep -oP '(?=Temperature).*F' | cut -f2- -d':' && echo "<br>"
echo "<b>Humidity: </b>" && cat weather.txt | grep -oP '(?=Humidity: ).*' | cut -f2- -d':' && echo "<br><br>"

#Output the wind direction and wind speed.
echo -n "<b>Wind direction: </b>" && cat weather.txt | grep -oP '(?<=from the ).*degrees\)' && echo "<br>"
echo -n "<b>Wind speed: </b>" && cat weather.txt | grep -oP '(?<=\) at ).*MPH' && echo "<br><br>"

#Output the current weather alerts.
echo -n "<b>Current alerts: </b>" && tail -n 1 weather.txt && echo "<br><br>"

#Finally, output the current forecast. 
echo "<b>This week's forecast: </b>" && echo "<br><br>" && cat forecast.txt | grep -A 100 '...GRAND RAPIDS' 
echo "</html>"
