#!/bin/bash
## This takes the work done in parser.sh
## and merges it all into one

## Variables
script_dir=$(dirname $0)
SCRIPTVARSDIR="$script_dir"/../scriptvars/
STATICVARS="$SCRIPTVARSDIR"staticvariables.var
if
[[ -f $STATICVARS ]]
then
source $STATICVARS
else
echo "Static Vars File Missing, Exiting."
exit
fi

WHATITIS="All Parsed List"
CHECKME=$BIGAPL
timestamp=$(echo `date`)
if
ls $CHECKME &> /dev/null;
then
rm $CHECKME
echo "* $WHATITIS Removed. $timestamp" | tee --append $RECENTRUN &>/dev/null
else
echo "* $WHATITIS Not Removed. $timestamp" | tee --append $RECENTRUN &>/dev/null
fi

## Combine Small lists
cat $PARSEDLISTSALL > $TEMPFILE
echo -e "\t`wc -l $TEMPFILE | cut -d " " -f 1` lines after merging individual lists"

## Duplicate Removal
echo ""
printf "$yellow"  "Removing duplicates..."
cat -s $TEMPFILE | sort -u | gawk '{if (++dup[$0] == 1) print $0;}' > $FILETEMP
echo -e "\t`wc -l $FILETEMP | cut -d " " -f 1` lines after deduping"
mv $FILETEMP $TEMPFILE

## Result
FETCHFILESIZEALL=$(stat -c%s "$BIGAPL")
FETCHFILESIZEALLMB=`expr $FETCHFILESIZEALL / 1024 / 1024`
DOMAINSINALLPARSED=$(echo -e "\t`wc -l $BIGAPLE | cut -d " " -f 1`")
ALLPARSEDSIZEMB="The ALLPARSEDLIST is $FETCHFILESIZEALLMB MB and contains $DOMAINSINALLPARSED Domains."
echo "* $ALLPARSEDSIZEMB" | tee --append $RECENTRUN &>/dev/null
printf "$yellow"   "$ALLPARSEDSIZEMB"

## Github has a 100mb limit and empty files are useless
FETCHFILESIZE=$(stat -c%s $TEMPFILE)
timestamp=$(echo `date`)
if
[ "$FETCHFILESIZE" -ge "$GITHUBLIMIT" ]
then
echo ""
printf "$red"     "Parsed File Too Large For Github. Deleting."
echo "* Allparsedlist list was too large to host on github. $FETCHFILESIZE bytes $timestamp" | tee --append $RECENTRUN &>/dev/null
rm $FILETEMP
echo "File exceeded Githubs 100mb limitation" | tee --append $TEMPFILE
mv $TEMPFILE $BIGAPL
elif
[ "$FETCHFILESIZE" -eq 0 ]
then
echo ""
printf "$red"     "File Empty"
echo "File Size equaled zero." | tee --append $TEMPFILE
echo "* Allparsedlist list was an empty file $timestamp" | tee --append $RECENTRUN &>/dev/null
mv $TEMPFILE $BIGAPL
else
echo ""
mv $TEMPFILE $BIGAPL
printf "$yellow"  "Big List Created Successfully."
fi
