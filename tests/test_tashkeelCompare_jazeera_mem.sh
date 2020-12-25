#~FILE="adab.txt"
#FILE="rndlines.txt"
FILE="aljazeera.txt"
valgrind --tool=memcheck --tool=massif  python ../mishkal-console.py -p -c -l 500 -f samples/vocalized/${FILE} >output/compare/rndlines.11.txt
#python -m cProfile ../mishkal-console.py -p -c -l 500 -f samples/vocalized/${FILE} >output/compare/rndlines.11.txt
DATE=`date +%Y-%m-%d-%H:%M`
echo "make archive" 
cp output/compare/rndlines.11.txt  output/compare/L${DATE}.txt
echo "save stats"
date >> output/compare/file.stats  
grep "function calls" -2 -h output/compare/rndlines.11.txt | sed 's/^.*function .* in //g;s/:\*.*$//g' | sed 'N;s/\n//g' >> output/compare/file.stats
tail -n 3 output/compare/file.stats

