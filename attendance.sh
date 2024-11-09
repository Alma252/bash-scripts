#! /bin/bash

students_file="students.txt"

attendance_file="attendance.csv"

today=$(date +"%Y-%m-%d")

if [ ! -f $attendance_file ]; then
	echo "Student ID,Name,Date,Status" > $attendance_file
fi

while IFS=',' read -r id name; do
    echo " Is $name (ID: $id) peresent (y/n)?"
    read status
    
    if [ "$status" == "y" ]; then
        echo "$id,$name,$today,Present" >> $attendance_file
    else
        echo "$id,$name,$today,Absent" >> $attendance_file
    fi
done < "$students_file"

echo "finish :)"

