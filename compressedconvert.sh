#!/bin/bash
## This will convert non-subscribable lists

##########################################################################
## Download, Extract, and Name List Files.                              ##
##########################################################################

## Airelle's Anti-Sex Hosts
printf "$blue"    "___________________________________________________________"
echo ""
printf "$green"   "Downloading Airelle's Anti-Sex Hosts"
echo ""
sudo wget http://rlwpx.free.fr/WPFF/hsex.7z -P /etc/piholeparser/compressedconvert/
printf "$yellow"  "Extracting"
echo ""
sudo 7za e /etc/piholeparser/compressedconvert/hsex.7z -o/etc/piholeparser/compressedconvert/
printf "$yellow"  "Renaming"
echo ""
sudo mv /etc/piholeparser/compressedconvert/Hosts.sex /etc/piholeparser/compressedconvert/AirellesAntiSexHosts.txt
echo ""
printf "$magenta" "___________________________________________________________"

## Airelle's Malware Hosts
printf "$blue"    "___________________________________________________________"
echo ""
printf "$green"   "Downloading Airelle's Malware Hosts"
echo ""
sudo wget http://rlwpx.free.fr/WPFF/hrsk.7z -P /etc/piholeparser/compressedconvert/
printf "$yellow"  "Extracting"
echo ""
sudo 7za e /etc/piholeparser/compressedconvert/hrsk.7z -o/etc/piholeparser/compressedconvert/
printf "$yellow"  "Renaming"
echo ""
sudo mv /etc/piholeparser/compressedconvert/Hosts.rsk /etc/piholeparser/compressedconvert/AirellesMalwareHosts.txt
echo ""
printf "$magenta" "___________________________________________________________"

## Airelle's Anti-Trackers Hosts
printf "$blue"    "___________________________________________________________"
echo ""
printf "$green"   "Downloading Airelle's Anti-Trackers Hosts"
echo ""
sudo wget http://rlwpx.free.fr/WPFF/htrc.7z -P /etc/piholeparser/compressedconvert/
printf "$yellow"  "Extracting"
echo ""
sudo 7za e /etc/piholeparser/compressedconvert/htrc.7z -o/etc/piholeparser/compressedconvert/
printf "$yellow"  "Renaming"
echo ""
sudo mv /etc/piholeparser/compressedconvert/Hosts.trc /etc/piholeparser/compressedconvert/AirellesAntiTrackersHosts.txt
echo ""
printf "$magenta" "___________________________________________________________"

## Airelle's Anti-Advertisements Hosts
printf "$blue"    "___________________________________________________________"
echo ""
printf "$green"   "Downloading Airelle's Anti-Advertisements Hosts"
echo ""
sudo wget http://rlwpx.free.fr/WPFF/hpub.7z -P /etc/piholeparser/compressedconvert/
printf "$yellow"  "Extracting"
echo ""
sudo 7za e /etc/piholeparser/compressedconvert/hpub.7z -o/etc/piholeparser/compressedconvert/
printf "$yellow"  "Renaming"
echo ""
sudo mv /etc/piholeparser/compressedconvert/Hosts.pub /etc/piholeparser/compressedconvert/AirellesAntiAdvertisementsHosts.txt
echo ""
printf "$magenta" "___________________________________________________________"

## Airelle's Anti-Miscellaneous Hosts
printf "$blue"    "___________________________________________________________"
echo ""
printf "$green"   "Downloading Airelle's Anti-Miscellaneous Hosts"
echo ""
sudo wget http://rlwpx.free.fr/WPFF/hmis.7z -P /etc/piholeparser/compressedconvert/
printf "$yellow"  "Extracting"
echo ""
sudo 7za e /etc/piholeparser/compressedconvert/hmis.7z -o/etc/piholeparser/compressedconvert/
printf "$yellow"  "Renaming"
echo ""
sudo mv /etc/piholeparser/compressedconvert/Hosts.mis /etc/piholeparser/compressedconvert/AirellesAntiMiscellaneousHosts.txt
echo ""
printf "$magenta" "___________________________________________________________"

## Airelle's Phishing Hosts
printf "$blue"    "___________________________________________________________"
echo ""
printf "$green"   "Airelle's Phishing Hosts"
sudo wget http://rlwpx.free.fr/WPFF/hblc.7z -P /etc/piholeparser/compressedconvert/
printf "$yellow"  "Extracting"
echo ""
sudo 7za e /etc/piholeparser/compressedconvert/hblc.7z -o/etc/piholeparser/compressedconvert/
printf "$yellow"  "Renaming"
echo ""
sudo mv /etc/piholeparser/compressedconvert/Hosts.blc /etc/piholeparser/compressedconvert/AirellesPhishingHosts.txt
echo ""
printf "$magenta" "___________________________________________________________"

## Blackweb
printf "$blue"    "___________________________________________________________"
echo ""
printf "$green"   "Downloading Blackweb List"
echo ""
sudo wget https://github.com/maravento/blackweb/raw/master/blackweb.tar.gz -P /etc/piholeparser/compressedconvert/
printf "$yellow"  "Extracting"
echo ""
sudo tar -xvf /etc/piholeparser/compressedconvert/blackweb.tar.gz -C /etc/piholeparser/compressedconvert
printf "$yellow"  "Renaming"
echo ""
sudo mv /etc/piholeparser/compressedconvert/blackweb.txt /etc/piholeparser/compressedconvert/Blackweb.txt
echo ""
printf "$magenta" "___________________________________________________________"

## Make sure the file path is added as a list.lst

## LISTNAME
#printf "$blue"    "___________________________________________________________"
#echo ""
#printf "$green"   "Downloading LIST"
#echo ""
# sudo wget
#printf "$yellow"  "Extracting"
#echo ""
# tar or 7za
#printf "$yellow"  "Renaming"
#echo ""
# mv NEWNAME
#echo ""
#printf "$magenta" "___________________________________________________________"

