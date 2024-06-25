# $1: Path to serch
# $2: Files extension for searching
# $?: Array of file paths
function get_files_list()
{
	path=$1
	extension=$2
	
	files_list="$(find "$path" -name "*$extension")"
	echo "$files_list"
}


# $1: File path
# $?: Pure file name without extension
function get_file_name()
{
	file_path=$1
	
	file_name=$file_path
	slash_pattern="/"
	while [[ $file_name == *"/"* ]]
	do	
		file_name="${file_name#*$slash_pattern}"
	done
	
	echo "$file_name"
}

file_path_list="$(get_files_list "./test" ".h")"

for file_path in $file_path_list
do
	file_name="$(get_file_name "$file_path")"
	echo "$file_name"
done


