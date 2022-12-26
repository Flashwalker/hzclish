# hzclish - CLI bash script for posting/reading on [Hubzilla][hubzilla] (ex Red Matrix) hub

## Dependencies:

See: [dependencies/INSTALL.md](dependencies/INSTALL.md)

* [curl](https://curl.haxx.se/)
* [jq](https://stedolan.github.io/jq/)
* grep, sed, awk, tr, mkdir, mktemp, rm, wc, which (usually GNU/linux has this by default)

**For markdown to bbcode:**

* [md2bbc.pl](https://gist.github.com/Flashwalker/360e8615bff1b9b322e0096fe92680ab)
* libtext-markdown-perl
* libtext-typography-perl (optional)

 &nbsp;or:

* [pandoc](http://pandoc.org/)
* [bbcode writer](https://github.com/lilydjwg/2bbcode)


## Usage:

See: [INSTALL.md](INSTALL.md)

Run `hzclish -h` for help.

Config folder: `~/.hzclish`

## Notice:
* By default you write in [markdown][mdown] and post sent as bbcode.
* Post message will be converted via [markdown][mdown] to bbcode, so you can use markdown syntax (*use* `-P` *or* `-m` *options to change markdown engine*).
* If you prefer to write in bbcode (*Hubzilla default*) or just plain text, use `-B` option, so message won't be markdowned and will be sent as bbcode mimtype.
* If you prefer to write in html, use `-H` option, so message won't be markdowned and will be sent as html mimtype. Hashtags won't works in this case.
* If you prefer to post in [markdown][mdown], use `-M` option, so message won't be markdowned and will be sent as html mimtype. Hashtags won't works in this case.
* Don't forget to add two **spaces** for [markdown][mdown] line breaks.
* If you have categories enabled in your [Hubzilla][hubzilla] profile settings, the top first line of post message, if it starts with ` *cat1 *cat2 ... *cat3` (*asterisk and text*), will be parsed as post categories (*It's like tags, but categories*).
* If you have hashtags enabled in your [Hubzilla][hubzilla] profile settings, words like ` #tag1 #tag2 ... #tag3` (*hash \+ text*) will be parsed as hashtags (*if they not starting the line*). Also the very last line (of your post message) with tags: ` #tag1 #tag2 ... #tag3` will be treated as hashtags too, even if it starts the line.
* The very top first line of your post message (*or second if you specified categories at first*), if it starts with e.g.: `# Title of message` (*one hash \+ space \+ text*), will be parsed as title of the post (*In [Hubzilla][hubzilla] you can define the post title in separate field*).
* If you want a link, use markdown syntax: wrap url in `<>` brackets like this: `<http://example.com/>` or `[]()` brackets like this: `[link](http://example.com/)`.
* If you post plain url with underscores, e.g.: `http://example.com/url_with_underscores`, the [markdown][mdown] will parse it to emphasis: `http://example.com/url<em>with</em>underscores`, which is breaks the url. So escape the `_` underscore with backslash: `http://example.com/url\_with\_underscores`, or use markdown syntax: wrap url in `<>` brackets like this: `<http://example.com/url_with_underscores>`.
* If you want to **embed** the url (with preview image), write your url just as plain text an add one or two **spaces** right after the url (*due to [Hubzilla][hubzilla] has some oembed issues*):

> http://www.youtube.com/watch?v=MejbOFk7H6c`***SPACES-GOES-HERE***`  
  >
> \#tag1 \#tag2 \#tag3

## Changelog
v2.2.1

- Fixed posting, getting.
- Markdown mimetype added.

v2.2:

- Fixed posting issue

v2.0:

- Rewritten with Zot API. Twitter API now: hzclish.old

[hubzilla]: https://hubzilla.org/page/hubzilla/hubzilla-project
[mdown]: http://daringfireball.net/projects/markdown/syntax
