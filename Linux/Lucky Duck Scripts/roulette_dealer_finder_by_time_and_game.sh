awk '{print $0}' ./$1_Dealer_schedule | grep $2:00:00 | grep $3
