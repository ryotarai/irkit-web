# irkit-web

Tiny web interface for IRKit

## Usage

```
$ heroku create
$ git push heroku master
$ heroku config:set \
  BASIC_USERNAME="user_for_basic_auth" \
  BASIC_PASSWORD="pass_for_basic_auth" \
  IRKIT_CLIENTKEY="clientkey" \
  IRKIT_DEVICEID="deviceid" \
  IRKIT_MESSAGE_TV_POWER='{"format":"raw","freq":38,"data":[619,...]}'
```
