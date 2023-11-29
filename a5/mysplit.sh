#!/bin/bash

if [ -f ./train/data1.csv ]
then
        rm ./train/data1.csv
fi

if [ -f ./test/data1.csv ]
then
        rm ./test/data1.csv
fi

if [ -f ./train/data2.csv ]
then
        rm ./train/data2.csv
fi

if [ -f ./test/data2.csv ]
then
        rm ./test/data2.csv
fi

awk -f bin.awk flare.data1 > clean_data1.csv
awk -f bin.awk flare.data2 > clean_data2.csv

NUM=$(wc -l < clean_data1.csv)
TRSIZEf=$(echo "$NUM*0.8" | bc)
TRSIZE1=${TRSIZEf%.*}
echo $TRSIZE1

i=0

while read line
do
        if [ $i -eq 0 ]
        then
                FIRST=$line
        elif [ $i -eq $TRSIZE1 ]
        then
                echo "$FIRST" >> ./test/data1.csv
        fi

        if [ $i -le $TRSIZE1 ]
        then
                echo "$line" >> ./train/data1.csv
        else
                echo "$line" >> ./test/data1.csv
        fi
        i=$((i+1))
done < clean_data1.csv

NUM=$(wc -l < clean_data2.csv)
TRSIZEf=$(echo "$NUM*0.8" | bc)
TRSIZE2=${TRSIZEf%.*}
echo $TRSIZE2

i=0

while read line
do
        if [ $i -eq 0 ]
        then
                FIRST=$line
        elif [ $i -eq $TRSIZE2 ]
        then
                echo "$FIRST" >> ./test/data2.csv
        fi

        if [ $i -le $TRSIZE2 ]
        then
                echo "$line" >> ./train/data2.csv
        else
                echo "$line" >> ./test/data2.csv
        fi
        i=$((i+1))
done < clean_data2.csv

