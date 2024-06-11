# Jenkinsビルドを実行したユーザーのメールアドレスを取得する関数
function Get-JenkinsUserEmail {
    # Jenkinsビルドを実行したユーザー名を取得
    $userName = $env:USERNAME
    # Jenkinsのユーザーメールアドレスの取得
    $userEmail = Get-WmiObject Win32_UserProfile | Where-Object { $_.LocalPath -like "*$userName" } | Select-Object -ExpandProperty LocalPath
    return $userEmail
}

# Jenkinsビルドを実行したユーザーのメールアドレスを取得
$to = Get-JenkinsUserEmail

# メール送信用の情報
$subject = $args[0]
$body = $args[1]
$smtpServer = "smtp.gmail.com"
$smtpFrom = "june0623takahiro@gmail.com"
$smtpUser = "june0623takahiro@gmail.com"
$smtpPass = "dddakoyzmclixzgd"

# メールを送信
Send-MailMessage -From $smtpFrom -To $to -Subject $subject -Body $body -SmtpServer $smtpServer -Port 587 -Credential (New-Object System.Management.Automation.PSCredential($smtpUser, (ConvertTo-SecureString $smtpPass -AsPlainText -Force))) -UseSsl
