#!/bin/bash 

if [ -z $1 ]; then
	echo "Please specify the number of random words"
	echo "ex) $0 10"
	exit 0
fi

WORDS=/usr/share/dict/words
WORD_COUNT=$(wc -l $WORDS | awk '{print $1}')
SCALE=$(( $WORD_COUNT/32767 ))

pick_random_words() {
	RANDOM_INDEX=$(( ($RANDOM*$SCALE)%$WORD_COUNT+1 )) 
	RANDOM_WORD=$(sed -n $RANDOM_INDEX"p" < $WORDS)
	echo $RANDOM_WORD
}

COUNT=$1
for (( v=1; v<=$COUNT; v++ )); do
	WORD=$(pick_random_words)
	echo "$v. $WORD"
done

