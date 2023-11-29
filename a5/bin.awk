BEGIN{
        FIELDS = "class,\"largest spot size\",\"spot distribution\",activity,evolution,24hrActivity,\"historically-complex\",\"HC sun disk\",area,\"largest spot area\",C-class,M-class,X-class"
        FS=" "
        OFS=","
	print FIELDS
}


NR > 1{
	$1 = $1
        print
}

