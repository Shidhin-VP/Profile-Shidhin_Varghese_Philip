import requests

url = "https://shidhin-portfolio-3803d113b640.herokuapp.com/ask"
data = {"question": "Tell me about Shidhin Varghese Philip"}
response = requests.post(url, json=data)

print(response.json()['answer'])
