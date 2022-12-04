#!/usr/bin/env python3

import requests
import os

response = requests.get('https://api.gemini.com/v1/pubticker/btcusd')
jsonResponse = response.json()

print(jsonResponse['bid'])

os.system('sketchybar -m --set btc label=\$'+ str(float(jsonResponse['bid'])))
