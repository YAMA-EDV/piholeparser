#!/bin/bash
## This Recreates Recent Run Log

## Variables
source ./foldervars.var

SCRIPTTEXT="Creating Main Recent Run Log."
timestamp=$(echo `date`)

echo "## $SCRIPTTEXT $timestamp" | tee --append $TEMPLOGMAIN &>/dev/null

CHECKME=$CLEANRECENTRUNLOGSONE
if
ls $CHECKME &> /dev/null;
then
rm $CHECKME
fi
echo ""

CHECKME=$CLEANRECENTRUNLOGSTWO
if
ls $CHECKME &> /dev/null;
then
rm $CHECKME
fi
echo ""

CHECKME=$CLEANRECENTRUNLOGSTHREE
if
ls $CHECKME &> /dev/null;
then
rm $CHECKME
fi
echo ""

if
[[ -f $MAINRECENTRUNLOGMD ]]
then
echo "* Old Recent Run Log Purged." | tee --append $TEMPLOGMAIN &>/dev/null
rm $MAINRECENTRUNLOGMD
fi

if
[[ -f $TEMPLOGMAIN ]]
then
echo "* Recent Run Log Recreated." | tee --append $TEMPLOGMAIN &>/dev/null
mv $TEMPLOGMAIN $MAINRECENTRUNLOGMD
fi