# OUI

look up OUI information /w Chinese translation using MAC addresses

OUI info from [IEEE OUI text file](https://standards.ieee.org/develop/regauth/oui/oui.txt)

[![Build Status](https://travis-ci.org/modouwifi/oui-gem.svg?branch=master)](https://travis-ci.org/modouwifi/oui-gem)
[![Code Climate](https://codeclimate.com/github/modouwifi/oui-gem/badges/gpa.svg)](https://codeclimate.com/github/modouwifi/oui-gem)
[![Coverage Status](https://coveralls.io/repos/modouwifi/oui-gem/badge.png)](https://coveralls.io/r/modouwifi/oui-gem)

Currently hosted on [heroku.com](https://heroku.com), live at [http://oui.ly.md](http://oui.ly.md), try URLs like this: [http://oui.ly.md/lookup?mac=14:10:9f:ea:49:11](http://oui.ly.md/lookup?mac=14:10:9f:ea:49:11)

## Service Benchmark

Roughly 320 requests per second, or 20000 requests per minute.

with `ab -n 20000 -c 100 http://oui.ly.md/lookup?mac=14:10:9f:ea:49:11`

```
Server Software:        thin
Server Hostname:        oui.ly.md
Server Port:            80

Document Path:          /lookup?mac=14:10:9f:ea:49:11
Document Length:        74 bytes

Concurrency Level:      100
Time taken for tests:   61.629 seconds
Complete requests:      20000
Failed requests:        0
Write errors:           0
Total transferred:      6160000 bytes
HTML transferred:       1480000 bytes
Requests per second:    324.52 [#/sec] (mean)
Time per request:       308.143 [ms] (mean)
Time per request:       3.081 [ms] (mean, across all concurrent requests)
Transfer rate:          97.61 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:       72   74  24.0     73     846
Processing:    86  233  78.3    233    2377
Waiting:       85  231  78.0    231    2375
Total:        161  307  80.9    306    2450

Percentage of the requests served within a certain time (ms)
  50%    306
  66%    327
  75%    334
  80%    340
  90%    355
  95%    369
  98%    393
  99%    432
 100%   2450 (longest request)
```

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
