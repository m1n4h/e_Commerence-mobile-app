import json

with open('keys/keys.json', 'r') as envs:
    keys = dict(json.load(envs))