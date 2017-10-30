#!/bin/bash +x

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
static_xml=

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
static_xml=${working_dir}.repo/manifests/static.xml

#======================
static=false
if [ -e $static_xml ] ; then
  static=true
fi

if [ -e $default_xml ] ; then
  if [ -n "$filters" ] ; then
    filter_repo $default_xml $static_xml ${filters//,/ }
  fi

  if ! $static ; then
    repo init -m ${static_xml##*/}
  fi
fi

