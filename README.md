Configuration Demo for `krep batch`
===================================

The repository is the demonstrated configuration file for the subcommand `batch`
of [krep]. It's assumed the latest files match the latest release of [krep], and
the tagged one matched the same release of [krep].

Now it contains following projects:

- Linux kernel
- Android AOSP
- ~~Android CM~~
- Android LineageOS

*NOTE*: ~~Andorid CM~~ contained attribute `notdefault` not to update by
default.

The file `all.xml` can be used with the command:

```sh
$ krep batch -f all.xml
```

Generally, other files for the projects can also be executed as the parameters
of `krep batch` either.

Each project represents one or more features supported by [krep]:

- Linux kernel
  - As a git mirror project
- Andorid AOSP
  - As repo and git mirror projects
  - `replace-patterns` for `revision`
- ~~Android CM~~
  - As a repo-mirror project
  - Disable to create repository remotely with `repo-create`
  - `exclude-patterns` for `project`
  - Lots of `replace-patterns` for `project`
- Android LineageOS
  - features for ~~Android CM~~
  - **hook** for phrase `pre-sync`

`all.xml` shows to `include` other XML files, which can share the same
`global-option` and make the maintenance of the file simpler.

[krep]: https://github.com/cadappl/krep

