awk '{print $1, $2, $5, $6}' ./Dealer_Analysis/$1_Dealer_schedule | grep $2:00:00 | grep $3 | awk '{print $3, $4}'
echo "was the Roulette Dealer working on $1 at $2:00:00 $3"
#[Date] [Time] [AM/PM] for argument order
