# OUI

look up OUI information /w Chinese translation using MAC addresses

[![Build Status](https://travis-ci.org/modouwifi/oui-gem.svg?branch=master)](https://travis-ci.org/modouwifi/oui-gem)

Currently live at [http://oui.ly.md](http://oui.ly.md), try URLs like this: [http://oui.ly.md/lookup?mac=14:10:9f:ea:49:11](http://oui.ly.md/lookup?mac=14:10:9f:ea:49:11)

## Installation

Add this line to your application's Gemfile:

    gem 'oui'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install oui

## Usage

### From the command line

    $ oui 14:10:9f:ea:22:33

### JSON interface

Start Sinatra server:

    $ shotgun

Output:

```
== Shotgun/WEBrick on http://127.0.0.1:9393/
[2014-07-09 18:14:45] INFO  WEBrick 1.3.1
[2014-07-09 18:14:45] INFO  ruby 1.9.3 (2011-10-30) [x86_64-darwin11.2.0]
[2014-07-09 18:14:45] INFO  WEBrick::HTTPServer#start: pid=33706 port=9393
```

Query with [httpie](http://httpie.org):

    $ http get http://localhost:9393/lookup\?mac\=14:10:9f:ea:49:11

Output:

```
HTTP/1.1 200 OK
Connection: Keep-Alive
Content-Length: 74
Content-Type: application/json;charset=utf-8
Date: Wed, 09 Jul 2014 10:16:01 GMT
Server: WEBrick/1.3.1 (Ruby/1.9.3/2011-10-30)
X-Content-Type-Options: nosniff

{
    "chinese_name": "苹果",
    "mac": "14:10:9f:ea:49:11",
    "manufacturer": "Apple"
}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
