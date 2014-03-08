#!/usr/bin/python
import requests
import re
import json

print "Content-type: application/json"
print

url = "http://apps.cs.utexas.edu/unixlabstatus/"

r = requests.get(url)

if not r:
    print "Error connecting to:", url
    exit(0)

html = r.content
r.close()

stations = []

i = 0
for line in html.splitlines():
    if "<td style" not in line:
        continue

    value = re.sub("<[^>]*>", "", line)
#     print value

    s_index = i / 5;

    if i % 5 == 0:
        stations.append({"host": value})
    elif i % 5 == 1:
        stations[s_index]["status"] = value
    elif i % 5 == 2:
        stations[s_index]["uptime"] = value
    elif i % 5 == 3:
        stations[s_index]["users"] = value
    elif i % 5 == 4:
        stations[s_index]["load"] = value

    i += 1

stations.pop(0)
print json.dumps(stations)

