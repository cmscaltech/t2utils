Most of the data copying should happen through [Phedex](https://cmsweb.cern.ch/phedex/prod/Request::Create) or [FTS](http://fts3-docs.web.cern.ch/fts3-docs/docs/cli/cli.html), but sometimes,
you want to move a small amount of user-generated data by hand. You can do this
using the [gfal](https://dmc.web.cern.ch/projects/gfal2-utils) commands, which can be called directly from python, as in the following example

~~~
python copy_files.py input.txt
~~~
