#!/bin/bash

function count_projects {
  grep '<project ' $1 | wc | awk ' { print $1 }'
}

function filter_repo {
  source=$1; shift
  dest=$1; shift

  cp $source $source.$$
  for filter in $@ ; do
    echo -n "## Filter out $filter... ($(count_projects $source.$$) -> "
    cat $source.$$ | grep -v -P "$filter" > $source.$$.tmp
    echo "$(count_projects $source.$$.tmp))"
    mv $source.$$.tmp $source.$$
  done

  mv $source.$$ $dest
}

working_dir=
filters=""
default_xml=
filtered_xml=

while (($#)) ; do
  case $1 in
    --working-dir)
      shift
      working_dir="$1/"
      ;;
    --working-dir=*)
      working_dir="${1:14}/"
      ;;
    --filter)
      shift
      filters="$filters $1"
      ;;
    --filter=*)
      filters="$filters ${1:9}"
      ;;
    *)
      ;;
  esac
  shift
done

default_xml=${working_dir}.repo/manifests/default.xml
filtered_xml=${working_dir}.repo/manifests/default-filtered.xml

#======================
static=false
if [ -e $filtered_xml ] ; then
  static=true
fi

if [ -e $default_xml ] ; then
  if [ -n "$filters" ] ; then
    filter_repo $default_xml $filtered_xml ${filters//,/ }
  fi

  if ! $static ; then
    repo init -m ${filtered_xml##*/}
  fi
fi

