#!/bin/bash
fn="usage"
while getopts "tp:" opt; do
  case "${opt}" in
    t) fn=table ;;
    p) fn=page; page=$OPTARG ;;
    *) fn=usage ;;
  esac
done; shift $((OPTIND-1))
pagefile="$@"
function usage {
  echo "Usage:"
  echo "$0 [-e | -r <page> | -p ] file"
  echo "       -e executes the pageboy script"
  echo "       -r runs a page of code by name"
  echo "       -p prints page table"
  exit 0
}
function table {
  awk 'BEGIN { name=""; start=""; tok="\t"; }
       /^#!/ { if (name != "" && start != "") { record(NR-1); }
               name=substr($0, 3); start=NR; }
       END { record(NR); }
       function record (end) {
         cond="NR>="(start+1)"&&NR<="end
         if (tag(name) != "pageboy") { id=tag(name);
           print id "_" (++tot[id]) tok cond tok name; } }
       function tag (name) {
         split(name,words);
         if (words[1] == "/usr/bin/env") { words[1] = words[2]; }
         split(words[1],path,"/"); return path[length(path)];
       }' $pagefile
  exit $?
}
function page {
  shebang=$($0 -i "$@" | grep $page | cut -f3)
  program=$($0 -i "$@" | grep $page | cut -f2)
  awk "$program"  "$@" | $shebang
  exit $?
}
$fn
