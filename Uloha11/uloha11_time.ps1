# Create a script that changes the computer's system time according to e.g. worldtimeapi.org.

# $url = 'http://worldtimeapi.org/api/timezone/Europe/Prague'
# $url = "https://worldtimeapi.org/api/ip"
$url = "https://worldtimeapi.org/api/timezone/Asia/Ho_Chi_Minh"
$json = Invoke-RestMethod -Uri $url -Method Get

#get the "datetime" value from the json
$utcDateTimeString = $json.datetime
$utcDateTimeString
#convert the string to a datetime object
$utcDateTime = [datetime]::Parse($utcDateTimeString, [System.Globalization.CultureInfo]::InvariantCulture, [System.Globalization.DateTimeStyles]::AssumeUniversal)
$utcDateTime
#set the system time
Set-Date -Date $utcDateTime