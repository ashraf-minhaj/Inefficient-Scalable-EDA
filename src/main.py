import requests

url = "https://api.callmebot.com/whatsapp.php?phone=+8801634648365&text=He+pulled+me+and+ran+fromPython&apikey=186336"

# myobj = {'somekey': 'somevalue'}

_ = requests.post(url)