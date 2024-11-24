#!/bin/mawk
BEGIN{ if (ARGC<4) { print "Usage: awk -f colored_words.awk file*.txt"; exit(1); } };
{
  FNAME[NR]=FILENAME;
  FFNR[NR]=FNR;

  if (FNR<10) FVAL[NR]="0"FNR"."$0; else FVAL[NR]=FNR"."$0;
#   NR        current record number in the total input stream.
#   FNR       current record number in FILENAME.
#   FILENAME  name of the current input file
};

END{
   STYLE1[1]="\033[31m";  STYLE2[1]="\033[37m"; STYLE3[1]="\033[31m";
   STYLE1[2]="\033[32m";  STYLE2[2]="\033[37m"; STYLE3[2]="\033[32m";
   STYLE1[3]="\033[33m";  STYLE2[3]="\033[37m"; STYLE3[3]="\033[33m";
   STYLE1[4]="\033[34m";  STYLE2[4]="\033[37m"; STYLE3[4]="\033[34m";
   STYLE1[5]="\033[35m";  STYLE2[5]="\033[37m"; STYLE3[5]="\033[35m";
   STYLE1[6]="\033[36m";  STYLE2[6]="\033[37m"; STYLE3[6]="\033[36m";

   STYLE1[7]="\033[37m";  STYLE2[7]="\033[31m"; STYLE3[7]="\033[37m";
   STYLE1[8]="\033[37m";  STYLE2[8]="\033[32m"; STYLE3[8]="\033[37m";
   STYLE1[9]="\033[37m";  STYLE2[9]="\033[33m"; STYLE3[9]="\033[37m";
   STYLE1[10]="\033[37m"; STYLE2[10]="\033[34m";STYLE3[10]="\033[37m";
   STYLE1[11]="\033[37m"; STYLE2[11]="\033[35m";STYLE3[11]="\033[37m";
   STYLE1[12]="\033[37m"; STYLE2[12]="\033[36m";STYLE3[12]="\033[37m";

   STYLE1[13]="\033[32m"; STYLE2[13]="\033[31m";STYLE3[13]="\033[32m";
   STYLE1[14]="\033[33m"; STYLE2[14]="\033[31m";STYLE3[14]="\033[33m";
   STYLE1[15]="\033[34m"; STYLE2[15]="\033[31m";STYLE3[15]="\033[34m";
   STYLE1[16]="\033[36m"; STYLE2[16]="\033[31m";STYLE3[16]="\033[36m";

  # create file-colored items
  FN_NO=1;FN_NM=FNAME[1];
    for ( i=1;i<=NR;i++ )
      { if ( FN_NM != FNAME[i] ) { FN_NM=FNAME[i];FN_NO++;
        # printf "\n"
        };
        LINES[FFNR[i],FN_NO] = STYLE1[FN_NO] substr(FVAL[i],1,2) STYLE2[FN_NO] substr(FVAL[i],3,2) STYLE3[FN_NO] substr(FVAL[i],5,2) STYLE2[FN_NO] substr(FVAL[i],7,100) "\033[0m"
        # printf i " " FNAME[i] " " LINES[FFNR[i],FN_NO] "\n"
      }

  # ramdom swap(try twice) two columns in each line
  for  ( i=1; i<=12; i++ )
   { A = int(FN_NO*rand())+1 ; B = int(FN_NO*rand())+1 ;
     if ( A!=B ) { C=LINES[i,A]; LINES[i,A]=LINES[i,B];LINES[i,B]=C; }
     #A = int(FN_NO*rand())+1 ; B = int(FN_NO*rand())+1 ;
     #if ( A!=B ) { C=LINES[i,A]; LINES[i,A]=LINES[i,B];LINES[i,B]=C; }
   }

  # random swap lines
  for ( i=1; i<=12; i++ ) SW[i]=i;
  A = int(12*rand())+1 ; B = int(12*rand())+1 ;
  if ( A!=B ) { C=SW[A]; SW[A]=SW[B]; SW[B]=C }

  printf "===================================================================\n";
  printf "Be sure that you terminal displays colors properly and differently\n"
  printf STYLE1[1]" RED "STYLE1[2]" GREEN " STYLE1[3]" YELLOW "STYLE1[4]" BLUE "STYLE1[5]" MAGENTA " STYLE1[6]" CYAN " STYLE1[7]" WHITE \033[0m\n"
  printf "===================================================================\n\n";
    # print results
  #for ( i in SW ) #use this line for more random lines
  for ( i=1; i<=12; i++ )
        { for ( j=1; j<=FN_NO; j++ ) printf LINES[SW[i], j] "\t";
           printf "\n"
      }
  printf "\033[0m\n"
}

