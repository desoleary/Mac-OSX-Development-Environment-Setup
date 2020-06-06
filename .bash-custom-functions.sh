#!/bin/bash

#### Usage: $ kill-port 3000
kill-port() {
re='^[0-9]{4}$'
port_number=$1

if ! [[ $port_number =~ $re ]] ; then
   echo -e "${YELLOW_COLOUR}must be a 4 digit number${NO_COLOUR}" >&2;
else
    lsof -ti:$port_number | xargs kill
    echo -e "${GREEN_COLOUR}port ${port_number} killed successfully.${NO_COLOUR}" >&2;
fi
}
find-files-containing-recursive() {
command=$(printf grep-recursive "$1" "$2")
}
#### USAGE: $ grep-recursive "search-text" "*.rb"
grep-recursive() {
formatted_command="find . -type f -name %s -print0 | xargs -0 -I '{}' sh -c 'cat {} | grep -in --colour %s &&  echo {}'"
if [ -z $1 ] ; then
  echo -e "usage: grep-recursive [search-text...] [file-type-filter]${GRAY_COLOUR} NOTE: file-type-filter is optional and defaults to \"*.*\""

  echo -e "E.g. ${BLUE_COLOUR}E.g. grep-recursive \"Joe Bloggs\" \"*.txt\"${NO_COLOUR}"
  echo
  echo -e "${YELLOW_COLOUR}search text is required."
  return
else
  quoted_search="${quoted_search:+$quoted_search,}\"$1\""  # adds quote if not given
fi
if [ -z $2 ] ; then
    quoted_file_filter=$(printf "*.*")
else
    quoted_file_filter="${quoted_file_filter:+$quoted_file_filter,}'$2'"  # adds quote if not given
fi
command=$(printf "$formatted_command" "$quoted_file_filter" "$quoted_search")
echo -e "${GREEN_COLOUR}Running the following command: ${NO_COLOUR}"
echo -e "${GRAY_COLOUR}$command${NO_COLOUR}"
echo # line separator
eval $command # runs the recursive grep command
quoted_search=""
quoted_file_filter=""
command=""
}
