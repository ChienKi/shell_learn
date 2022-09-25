> 2054305-hw1-q1.log
v[1]=0
v[2]=1
for ((i=3;i<=100;i++));do
	v[i]=1 #1 is zhishu
	for ((j=2;j<=`echo "sqrt($i)+1" | bc`;j++));do
		#echo $j
		if (( $i%$j == 0 )); then
			v[i]=0 #0 is not zhishu
			break
		fi
	done
	#echo ${i}":"${v[i]}
done

sum=0
for i in {1..100};do
	#echo $v[$i]
	if (( v[$i] == 1 )); then
		echo -e "$i \c" >> 2054305-hw1-q1.log
		sum=$(($sum+$i))
	fi
done
echo -e "\n sum:"$sum >> 2054305-hw1-q1.log

