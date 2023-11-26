# Terminal colors tput
# example echo -en $TYEL$BRED"Yellow on Red"$RST"..."

# Reset all effects
RST=$(tput sgr0)   
# Style
#UND_ON=$(tput smul);  UND_OFF=$(tput rmul)
#BLD=$(tput bold);     BNK=$(tput blink)
#DIM=$(tput dim);      REV=$(tput rev)

# Colors    Text             Background
TRED=$(tput setaf 1); BRED=$(tput setab 1); 
TGRN=$(tput setaf 2); BGRN=$(tput setab 2);
TYEL=$(tput setaf 3); BYEL=$(tput setab 3); 
TBLU=$(tput setaf 4); BBLU=$(tput setab 4); 
TMGN=$(tput setaf 5); BMGN=$(tput setab 5); 
TCYA=$(tput setaf 6); BCYA=$(tput setab 6); 
TWHT=$(tput setaf 7); BWHT=$(tput setab 7); 




