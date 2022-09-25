file=2054305-hw1-q2.log
> 2054305-hw1-q3.log
echo "row_num:" `cat ${file} | wc -l` >> 2054305-hw1-q3.log

echo "character_num:" `cat ${file} | wc -c` >> 2054305-hw1-q3.log

# time difference between the timestamp
#  `awk '{print $1}' ${file}` ____timestamp column (awk will print column split by space
time_list=(`awk '{print $1}' ${file}`) # awk get a string has spaces, ()make it into array
time1=$(date +%T -d ${time_list[0]})
sys_time1=$(date -d "$time1" +%s)
time2=$(date +%T -d ${time_list[-1]})
sys_time2=$(date -d "$time2" +%s)
echo "time difference between the timestamp:" `expr $sys_time2 - $sys_time1` "seconds" >> 2054305-hw1-q3.log

# average of system load
sum01=0
sum05=0
sum15=0
#  `awk '{print $9,$10,$11}' ${file}` ____timestamp column (awk will print column split by space
load_list01=(`awk '{print $9}' ${file}`) # awk get a string has spaces, ()make it into array
load_list05=(`awk '{print $10}' ${file}`)
load_list15=(`awk '{print $11}' ${file}`)
row_num=${#load_list01[@]}
for ((i=0; i < ${row_num}; i++)); do
	# 01 and 05 has ',' in their elements
	load_list01[i]=${load_list01[i]%?}
	load_list05[i]=${load_list05[i]%?}
	# get sum and average of each one
	sum01=$(echo "${sum01} + ${load_list01[i]} " | bc)
	sum05=$(echo "${sum05} + ${load_list05[i]} " | bc)
	sum15=$(echo "${sum15} + ${load_list15[i]} " | bc)
done
avg01=$(echo "scale=2; ${sum01} / ${row_num}" | bc | awk '{printf "%.2f", $0}')
avg05=$(echo "scale=2; ${sum05} / ${row_num}" | bc | awk '{printf "%.2f", $0}')
avg15=$(echo "scale=2; ${sum15} / ${row_num}" | bc | awk '{printf "%.2f", $0}')
echo "average of system load:" ${avg01} ${avg05} ${avg15}  >> 2054305-hw1-q3.log
