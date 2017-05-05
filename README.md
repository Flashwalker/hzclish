# hzclish - CLI bash script for posting/reading on [Hubzilla](https://project.hubzilla.org/) (ex Red Matrix) hub

### Dependencies:

* [curl](https://curl.haxx.se/) (ubuntu updates/main, security/main, /main repos has this)
* [jq](https://stedolan.github.io/jq/) (ubuntu backports/universe, /universe repos has this)
* [markdown][mdown] or [pandoc](http://pandoc.org/) (ubuntu /universe repo has this)
* grep, sed, awk, tr, mkdir, mktemp, rm, wc (normally GNU/linux has this)

### Usage:

Run `hzclish -h` for help.

Config folder: ~/.hzclish

### Notice:

* Message will be parsed by [markdown][mdown], so you can use it syntax;
* If you have categories enabled in your Hubzilla profile settings, the top first line of post message, if it starts with `*cat1 *cat2 ... *cat3` (asterisk and text), will be parsed as post categories (in Hubzilla it's like hashtags, but for sortting per channel's posts);
* If you have hashtags enabled in your Hubzilla profile settings, words like `#tag1 #tag2 ... #tag3` (hash and text) will be parsed as hashtags (if they not starting the line). And very last line which starts with `#tag1 #tag2 ... #tag3`;
* Top first line of post message (or second if you specified categories at first one), if it starts with `# Title of message` (one hash and space and text), will be parsed as title of the post (In Hubzilla you can define post title in separate filed);
* Somehow, if you specified hashtags after url (even after new line) it breaks the url. Looks like Hubzilla parser issue. So here is how you should do it right: add **two spaces** after url and then hashtags
> http://www.youtube.com/watch?v=MejbOFk7H6c`  `  
>
> \#tag1 \#tag2 \#tag3


[mdown]: http://daringfireball.net/projects/markdown/syntax