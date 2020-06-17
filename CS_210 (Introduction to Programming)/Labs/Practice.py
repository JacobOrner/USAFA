import os
import binascii
import hashlib
import json

def do_login(user,password,admin):
    cookie = ['ncage', '1234', 1]
    cookie['digest'] = hashlib.sha512
    resp.set_cookie('auth', binascii.hexlify(json.dumps(cookie).encode('utf8')))
    return resp