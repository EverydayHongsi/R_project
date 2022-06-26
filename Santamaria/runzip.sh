

for var in $(ls)
do


	if [ ${#var} == 17 ]
	then
		echo $var
		$(ditto -V -x -k --sequesterRsrc --rsrc ${var} ./${var:0:13})
	else
		continue
	fi

done

