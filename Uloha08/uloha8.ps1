$sortedText = -join ("Kobyla má malý bok".ToCharArray() | Sort-Object);
$sortedText

# Initialize an empty array to hold the numbers
$numbers = @()

# Generate 10 random numbers between 10 and 100
for ($i = 0; $i -lt 10; $i++) {
    $numbers += Get-Random -Minimum 10 -Maximum 100
}

# Print the numbers and their squares in two columns
# "Number  Square"
foreach ($number in $numbers) {
    $square = $number * $number
    "{0,6}  {1,6}" -f $number, $square
}

# List the characters that occur in the text in descending order of occurrence.
$Path = "D:\Documents\Unob_7\Milan\Powershell-2023\Uloha8\uloha8_text.txt"
$content = Get-Content -Path $Path
$charCount = @{}
foreach ($line in $content) {
    foreach ($char in $line.ToCharArray()) {
        if ($charCount.ContainsKey($char)) {
            $charCount[$char]++
        }
        else {
            $charCount[$char] = 1
        }
    }
}

$charCount.GetEnumerator() | Sort-Object -Property Value -Descending | Format-Table -AutoSize