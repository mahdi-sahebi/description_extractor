# $1: Path to serch
# $2: Files extension for searching
function get_files_list()
{
	path=$1
	extension=$2
	
	files_list="$(find "$path" -name "*$extension")"
	echo "$files_list"
}

files_list="$(get_files_list "./test" ".h")"
echo "$files_list"

