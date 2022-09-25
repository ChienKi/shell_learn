if (($# == 0));then
	read -p "请输入你要倒计时的秒数:" duration
else
	duration=$1
fi
let rest=${duration}
while ((${rest} > 0 ));do
	sleep 1
	rest=$((rest-1))
	if (((${duration} - ${rest})%10 == 0)); then
		echo "还剩"${rest}"s" >> 2054305-hw1-q4.log
	fi
done
echo "End of Countdown" >> 2054305-hw1-q4.log
