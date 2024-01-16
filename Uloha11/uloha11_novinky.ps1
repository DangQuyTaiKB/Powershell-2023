
$url = 'https://www.novinky.cz/'
$WebSite = Invoke-WebRequest -Uri $url -SessionVariable fe
$allLinks = $WebSite.Links


# List the links on the www.novinky.cz page in descending order according to the number of occurrences
$allLinks | Group-Object -Property href | Sort-Object -Property Count -Descending | ForEach-Object { "{0} ({1})" -f $_.Name, $_.Count }

# how many time does the "žena-zdraví" section have ?
$womanCount = $allLinks | Where-Object { $_.href -like "*zena-zdravi*" } | Measure-Object | Select-Object -ExpandProperty Count
