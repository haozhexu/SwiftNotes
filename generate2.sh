
INPUT=$1
OUTPUT=$2
QPOINTS=$3
CONTENT=`sed 's/^\/\/ //g' $INPUT | sed '/\/\/!$/d'`


