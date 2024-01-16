# Write a script that downloads images from a selected gallery on pbase.com
$Uri = "https://pbase.com/jhiker/fall_colors"
$WebSite = Invoke-WebRequest -Uri $Uri -SessionVariable fe
$allLinks = $WebSite.Links
# $allLinks
#in outerHTML sections is the link to the image
#list all the links to the images

#all outerHTML sections has the link to the image
$picturesOuter = $allLinks | Where-Object { $_.outerHTML -like "*jpg*" } | ForEach-Object { $_.outerHTML }
# $picturesOuter
# <A HREF="https://pbase.com/jhiker/image/69518673" class="thumbnail"><IMG class=thumbnail src="https://a4.pbase.com/g6/14/98514/3/69518673.xOESO9uR.jpg" WIDTH=160 HEIGHT=120 border=0 alt="IMG_1941 Aspen.jpg"  loading="lazy" ></A>

#loop through the picturesOuter and get the value of the src attribute
$picturesSrc = $picturesOuter | ForEach-Object { $_.Split('"')[5] }
# $picturesSrc

# Create the folder if it doesn't exist
$folderPath = Join-Path -Path $PSScriptRoot -ChildPath "images"
if (!(Test-Path -Path $folderPath)) {
    New-Item -ItemType Directory -Path $folderPath
}
# loop through the picturesSrc and download the images
foreach ($pictureSrc in $picturesSrc) {
    $pictureName = $pictureSrc.Split('/')[-1]
    $picturePath = Join-Path -Path $folderPath -ChildPath $pictureName
    Invoke-WebRequest -Uri $pictureSrc -OutFile $picturePath
}