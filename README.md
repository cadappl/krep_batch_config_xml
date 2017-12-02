Configuration Demo for `krep batch`
===================================

The file `all.xml` is the demonstrated configuration file for [krep]
sub-command `batch`. The file can be used as the arguement for the command:

```sh
$ krep batch -f all.xml
```

Now the files contains four projects:

- Linux kernel
- Android AOSP
- Android CM
- Android LineageOS

The main reference can be the usage of the project *Android CM* and
*Android LineageOS*, which contain lots of patterns.

And with the extra support with `include` element, one XML file can include
other files. An extra `hook` is also demonstrated to filter out uninterested
git-repo repositories from the mirror projects, which are owned by a site.

[krep]: https://github.com/cadappl/krep

