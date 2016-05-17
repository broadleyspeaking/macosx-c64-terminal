clear
export PS1=$
OSX_VERSION=`sw_vers -productVersion`

FREE_BLOCKS=$(vm_stat | grep free | awk '{ print $3 }' | sed 's/\.//')
INACTIVE_BLOCKS=$(vm_stat | grep inactive | awk '{ print $3 }' | sed 's/\.//')
SPECULATIVE_BLOCKS=$(vm_stat | grep speculative | awk '{ print $3 }' | sed 's/\.//')

FREE=$((($FREE_BLOCKS+SPECULATIVE_BLOCKS)*4096/1048576))
INACTIVE=$(($INACTIVE_BLOCKS*4096/1048576))
TOTAL_FREE=$((($FREE+$INACTIVE)))

TOTAL=`top -l 1 | grep PhysMem: | awk '{print $2}' | sed 's/M//'`

echo "         **** MAC OSX V $OSX_VERSION ****"
echo
echo "$TOTAL MB RAM SYSTEM     $TOTAL_FREE BASIC MEGABYTES FREE"
echo
echo READY.
