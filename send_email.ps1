param (
    [string]$subject,
    [string]$body,
    [string]$to
)

$smtpServer = "smtp.gmail.com"
$smtpFrom = "june0623takahiro@gmail.com"
$smtpUser = "june0623takahiro@gmail.com"
$smtpPass = "dddakoyzmclixzgd"

$message = New-Object system.net.mail.mailmessage
$message.from = $smtpFrom
$message.To.add($to)
$message.Subject = $subject
$message.Body = $body

$smtp = New-Object Net.Mail.SmtpClient($smtpServer, 587)
$smtp.EnableSsl = $true
$smtp.Credentials = New-Object System.Net.NetworkCredential($smtpUser, $smtpPass)
$smtp.Send($message)
