#!/bin/bash
## This is the Parsing Process

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

## Process Every .lst file within the List Directories
for f in $EVERYLISTFILEWILDCARD
do

## Clear Temp Before
if
[[ -f $DELETETEMPFILE ]]
then
bash $DELETETEMPFILE
else
echo "Error Deleting Temp Files."
exit
fi

printf "$lightblue"    "$DIVIDERBAR"
echo ""

## Declare File Name
FILEBEINGPROCESSED=$f
echo "FILEBEINGPROCESSED="$FILEBEINGPROCESSED"" | tee --append $TEMPPARSEVARS &>/dev/null
BASEFILENAME=$(echo `basename $f | cut -f 1 -d '.'`)
echo "BASEFILENAME="$BASEFILENAME"" | tee --append $TEMPPARSEVARS &>/dev/null

printf "$green"    "Processing $BASEFILENAME List."
echo "" 

for p in $ALLPARSINGSCRIPTS
do

PBASEFILENAME=$(echo `basename $p | cut -f 1 -d '.'`)
PBASEFILENAMEDASHNUM=$(echo $PBASEFILENAME | sed 's/[0-9\-]/ /g')
PBNAMEPRETTYSCRIPTTEXT=$(echo $PBASEFILENAMEDASHNUM)
SCRIPTTEXT=""$PBNAMEPRETTYSCRIPTTEXT"."
PARSECOMMENT="$SCRIPTTEXT"

printf "$cyan"  "$PARSECOMMENT"
echo ""

bash $p

echo ""

## End of parsing Loop
done

## Clear Temp After
if
[[ -f $DELETETEMPFILE ]]
then
bash $DELETETEMPFILE
else
echo "Error Deleting Temp Files."
exit
fi

printf "$orange" "$DIVIDERBARB"
echo ""

## End of File Loop
done
