#!/bin/bash

CMD="base64 -d"

for STUD_CASE in `ls -d afl-out*/ | tr -d '/'`
do
        printf " ===> current case: %s <=== \n" `ls $STUD_CASE/plot_data`
        # /queue/id*
        # lösche alle gcda und gcov Dateien
        rm -rf src/*.gcda
        rm -rf src/*.gcov
        rm -rf *.gcov
        rm -rf *.gcda
        # erstelle initiale coverage
        gcovr -r . --json --json-pretty src | jq -r -c '[.files | .[].lines | .[].count | if . == 0 then 0 else 1 end] | [length, length - add, add] | "\(.[0]) \(.[1]) \(.[2])"' | tee "${STUD_CASE}-cov-all.dat"
        # füge für jeden neuen task in der queue die coverage ergebinsse nach der Ausführung zur result.dat hinzu
        for QUEUE_CASE in `ls $STUD_CASE/queue/id*`
        do
                lava-install/bin/$CMD $QUEUE_CASE 1> /dev/null 2> /dev/null
                gcovr -r . --json --json-pretty src | jq -r -c '[.files | .[].lines | .[].count | if . == 0 then 0 else 1 end] | [length, length - add, add] | "\(.[0]) \(.[1]) \(.[2])"' | tee -a "${STUD_CASE}-cov-all.dat"
        done
done
