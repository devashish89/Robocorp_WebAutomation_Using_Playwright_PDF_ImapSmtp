# +
from RPA.Email.ImapSmtp import ImapSmtp

emailid = "devashish.nigam89@gmail.com"
email_password = "enter password"
imapserver = "imap.gmail.com"
imapport = 993
smtpserver = "smtp.gmail.com"
smtpport = 587


mail = ImapSmtp()
mail.authorize(account=emailid,password=email_password,imap_server=imapserver,imap_port=imapport,smtp_server=smtpserver,smtp_port=smtpport)

def get_mails(subject, folder):
    emails = mail.list_messages(criterion="SUBJECT \""+subject+"\"", source_folder=folder)
    print(len(emails))

    for email in emails:
        print(email['From'], email['To'], email['Subject'], email['Date'], sep="||")
        print("------------------------------------------------")

def send_status_mail(sender,to,subject,body,my_attachments):
    mail.send_message(sender, to, subject, body, html=True, attachments=my_attachments)

