#!/usr/bin/python3
'''Get number of reddit channel subscribers'''
import requests

BASE_URL = 'http://reddit.com/r/{}/about.json'


def number_of_subscribers(subreddit):
    '''Gets number of reddit subscribers'''
    headers = {'User-agent': 'Unix:0-subs:v1'}
    response = requests.get(BASE_URL.format(subreddit),
                            headers=headers)
    if response.status_code != 200:
        return 0
    return response.json().get('data', {}).get('subscribers', 0)
