cut -f 2-4 -d , PredPreyData.csv > PredPrey1.csv
grep "time" PredPrey1.csv > PredPreyLess.csv
tail PredPrey1.csv >> PredPreyLess.csv
rm PredPrey1.csv

