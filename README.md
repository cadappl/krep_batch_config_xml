Configuration Demo for `krep batch`
===================================

The file `project.xml` is the demonstrated configuration file for [krep]
sub-command `batch`. The file can be used as the arguement for the command:

```sh
$ krep batch *.xml
```

Now the files contains four projects:

- Linux kernel
- Android AOSP
- Android CM
- Android LineageOS

The main reference can be the usage of the project *Android CM* and
*Android LineageOS*, which contain lots of patterns.

And now with the extra support with `include' element, one XML file can include
other files.

[krep]: https://github.com/cadappl/krep

