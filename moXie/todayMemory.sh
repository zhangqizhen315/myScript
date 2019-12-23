!/bin/bash

today=$(date +%y-%m-%d)
i=$( wc -l ~/myScript/moXie/memory/$today | cut -d " " -f1 )
echo $i
until [ $i -eq 0 ]
do
    word=$( head -n 1 ~/myScript/moXie/memory/$today | cut -d "|" -f1 )
    level=$( head -n 1 ~/myScript/moXie/memory/$today | cut -d "|" -f2 )
    bash ~/myScript/moXie/moXie.sh $word $level

    sed -i '1d' ~/myScript/moXie/memory/$today
    i=$( wc -l ~/myScript/moXie/memory/$today | cut -d " " -f1 )
done
