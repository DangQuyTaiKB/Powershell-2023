# Create a script that renders a palette of 16 color shades preset in the terminal (see image below).
# Tạo tập lệnh hiển thị bảng màu gồm 16 sắc thái cài sẵn trong thiết bị đầu cuối (xem hình ảnh bên dưới).

# Define the colors
$colors = [enum]::GetValues([System.ConsoleColor])

# Loop through each color
# Define the colors
$colors = [enum]::GetValues([System.ConsoleColor])

# Loop through each color
foreach ($color in $colors) {
    # If the color name has more than 7 characters, add one tab, otherwise add two tabs
    if ($color.ToString().Length -gt 7) {
        Write-Host "$color`t" -NoNewline
        Write-Host "$color`t" -ForegroundColor $color -NoNewline
        Write-Host "$color" -BackgroundColor $color
    }
    else {
        Write-Host "$color`t`t" -NoNewline
        Write-Host "$color`t`t" -ForegroundColor $color -NoNewline
        Write-Host "$color" -BackgroundColor $color
    }
    
}
