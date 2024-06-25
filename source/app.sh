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

# $1: File name
# $?: Pure file namewithout extension
function get_file_name_without_extension()
{
	file_name=$1
	
	echo "${file_name%.h*}"
}

# $1: Number
# $2: Module name
function print_module()
{
	number=$1
	module_name=$2
	
	echo "$number. $module_name:"
}

# $1: File path
# $?: File buffer
function read_file()
{
	local file_path=$1
	
	echo "$(cat "$file_path")"
}

# $1: Buffer
# $2: Prefix Pattern
# $?: Buffer which prefix data is removed
function remove_prefix()
{
	local buffer="$1"
	local prefix="$2"
	
	while [[ $buffer == *"$prefix"* ]]
	do
		buffer="${buffer#*$prefix}"
	done
	
	echo "$buffer"
}

# $1: Buffer
# $2: Suffix Pattern
# $?: Buffer which suffix data is removed
function remove_suffix()
{
	local buffer="$1"
	local suffix="$2"
	
	while [[ $buffer == *"$suffix"* ]]
	do
		buffer="${buffer%$suffix*}"
	done
	
	echo "$buffer"
}



file_path_list="$(get_files_list "./test" ".h")"

counter=1
for file_path in $file_path_list
do
	file_name="$(get_file_name "$file_path")"
	module_name="$(get_file_name_without_extension "$file_name")"
	echo "$(print_module $counter "$module_name")"
	
	buffer="$(read_file "$file_path")"
	buffer="$(remove_prefix "$buffer" "/**@")"
	buffer="$(remove_suffix "$buffer" "*/")"
	echo "$buffer"
	echo ""
	
	counter=$(($counter + 1))
done


