#!/bin/bash
choice1=1
choice2=2
echo -ne "List of Choices : \n"
echo -ne "[1]Count the numbers of each HTTP Response at certain period (e.g at 01:10:00-03:30:00) \n"
echo -ne "[2]Count the numbers of HTTP Response (e.g HTTP Response 200) per minute at certain period (e.g at 01:10:00-03:30:00) \n"
echo -ne "Please Choose :"

read input

if [ $input = $choice1 ];
then
        echo -ne "Input start time from (e.g 01:10): "
        read line1
        echo -ne "Input end time (e.g 03:30): "
        read line2
        echo "======================="

echo "HTTP_Response,Count" && cat logs.txt | awk '$4 >= "[16/May/2019:01:10:00" && $4 <= "[16/May/2019:03:30:00"' | egrep "200|201|304|400
401" | awk -F "[ ]" '{print $9","}' | sort | uniq -c | awk '{print $2$1}'

elif [ $input = $choice2 ];
then
        echo -ne "Input start time from (e.g 01:10): "
        read line3
        echo -ne "Input end time (e.g 03:30): "
        read line4
        echo -ne "Http Response (e.g 200): "
        read inputHttp

	if [ $inputHttp = 200 ];
	then
	echo "======================="
echo "Timestamp,Count" && cat logs.txt | awk '$4 >= "[16/May/2019:01:10:00" && $4 <= "[16/May/2019:03:30:00"' | grep 200 | awk -F "[:]" '{
print $2":"$3}' | sort | uniq -c | awk '{print $2","$1}'
	fi	
	if [ $inputHttp = 201 ];
        then
	echo "======================="
echo "Timestamp,Count" && cat logs.txt | awk '$4 >= "[16/May/2019:01:10:00" && $4 <= "[16/May/2019:03:30:00"' | awk -F "[ ]" '{print $4" "$9}' | awk -F "[:]" '{print $2":"$3":"$4}' | grep 201 | awk -F "[:]" '{print $1":"$2}' | uniq -c | awk '{print $2","$1}'	
	fi
	if [ $inputHttp = 304 ];
        then
	echo "======================="
echo "Timestamp,Count" && cat logs.txt | awk '$4 >= "[16/May/2019:01:10:00" && $4 <= "[16/May/2019:03:30:00"' | grep 304 | awk -F "[:]" '{
print $2":"$3}' | sort | uniq -c | awk '{print $2","$1}'
	fi
	if [ $inputHttp = 400 ];
        then
	echo "======================="
echo "Timestamp,Count" && cat logs.txt | awk '$4 >= "[16/May/2019:01:10:00" && $4 <= "[16/May/2019:03:30:00"' | grep 400 | awk -F "[:]" '{
print $2":"$3}' | sort | uniq -c | awk '{print $2","$1}'
	fi
	if [ $inputHttp = 401 ];
        then
	echo "======================="
echo "Timestamp,Count" && cat logs.txt | awk '$4 >= "[16/May/2019:01:10:00" && $4 <= "[16/May/2019:03:30:00"' | grep 401 | awk -F "[:]" '{
print $2":"$3}' | sort | uniq -c | awk '{print $2","$1}'
        fi
fi