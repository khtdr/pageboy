#!/bin/bash
function usage {
  echo "pageboy shebang examples:"
  echo -e "$script\t\t# runs first page"
  echo -e "$script -r <page>\t# runs page listing"
  echo -e "$script -p <page>\t# prints page listing"
  echo -e "$script -h\t\t# shows help information"
  echo -e "$script -d\t\t# dumps page table"
  exit 0
}
read -a ARGV <<< "$@"
while (("$OPTIND" <= "$#")); do
  while getopts "dr:p:h" opt; do
    case "$opt" in
      d) fn=dump; ;;
      r) fn=run; page="$OPTARG" ;;
      p) fn=print; page="$OPTARG" ;;
      *) fn=usage ;;
    esac
  done
  script=${script:-${ARGV[($OPTIND-1)]}}
  OPTIND=$(($OPTIND+1))
done
fn=${fn:-run}; page=${page:-pageboy}
[[ -f "$script" ]] || { echo "no readable file name supplied"; usage; }
  table="$(awk "$(sed -n -e '/^#!\/awk/,$p' $0)" $script)"
[[ -x "$page" ]] || {
  read -r -a spec <<< $(echo "$table" | grep ^$page | head -1);
  name=${spec[0]}; spec[0]="";
  range=${spec[1]}; spec[1]="";
  shebang="${spec[@]}";
  program=$(awk "$range"  "$script");
}
case "$fn" in
  "dump") echo "$table" ;;
  "run") echo "$program" | $shebang; ;;
  "print") echo "$program" ;;
  *) usage ;;
esac
exit 0
#!/awk script for printing the page table
function record (end) {
  shebang=name
  if (shebang == "/usr/bin/env pageboy") { shebang="/usr/bin/env bash"; }
  print tag(name)(++tot[tag(name)])" NR>="(start+1)"&&"end">=NR "shebang
}
function tag (name) {
 split(name,words); bin=words[1];
 if (bin == "/usr/bin/env") { bin=words[2]; }
 split(bin,path,"/"); return path[length(path)];
}
BEGIN { name=""; start=0; }
END { record(NR); }
/^#!/ {
  if (start != 0) { record(NR-1); }
  name=substr($0, 3); start=NR;
}
