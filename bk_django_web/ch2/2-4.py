from urllib.request import HTTPBasicAuthHandler, build_opener

auth_handler = HTTPBasicAuthHandler()
# OK
auth_handler.add_password(realm='ksg', user='sgkim', passwd='1234', uri='http://127.0.0.1:8000/auth/')
# NOK.
# auth_handler.add_password(realm='ksh', user='shkim', passwd='shkimadmin', uri='http://127.0.0.1:8000/')
opener = build_opener(auth_handler)

resp = opener.open('http://127.0.0.1:8000/auth/')
print(resp.read().decode('utf-8'))
