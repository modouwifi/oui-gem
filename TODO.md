## library
- js call lookup MAC on index page
- support vendor override: need to analyze logs
- support locally administered addresses (e.g. 0A:72:2C:1E:8B:0A)
- support Individual Address Block (addresses start with 40-D8-55)

## server
- utilize `.profile` and capture `SIGTERM` as described in [https://devcenter.heroku.com/articles/dynos#the-dyno-manager](https://devcenter.heroku.com/articles/dynos#the-dyno-manager)
- handle deployment downtime gracefully
- separate `oui.txt` lookup to a database
