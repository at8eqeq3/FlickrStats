#FlickrStats

FlickrStats is a tool to collect view stats from [Flickr](http://flickr.com).

## Features

* Fetch view stats daily
* ~~Skip photos marked with special [machine tag](https://www.flickr.com/groups/api/discuss/72157594497877875/)~~
* Web-interface
* Line charts
* Single- or multi-user

## Dependencies

Versions are those I use in my development and production setup. If you know it will work with others, please, let me know.

* Ruby 2.1.3
* MongoDB 2.4.10
* Redis 2.8.13 (for job queue and caching)
* Any HTTP server (I prefer Nginx)

## Achtung

This tool is work in progress and may be totally broken or lack some features in some time. This is my hobby project, so there's no release cycle. I 
will be happy if you'll help me with this work.
