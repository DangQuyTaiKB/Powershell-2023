# Define email parameters
$From = "quytai.dang@unob.cz"
$To = "jirsamilan@gmail.com"
$Subject = "Uloha16-Send-MailMessage"
$Body = "This is a test email sent by PowerShell. "

# Define SMTP parameters
$SMTPServer = "smtp.unob.cz"
$SMTPPort = "587"

# Send email
Send-MailMessage -From $From -to $To -Subject $Subject -Body $Body -BodyAsHtml -SmtpServer $SMTPServer -Port $SMTPPort -UseSsl -Credential (Get-Credential)