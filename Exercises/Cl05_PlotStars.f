      PROGRAM PlotStars
        IMPLICIT NONE
        INTEGER LENMAX,L,POS,N
        PARAMETER(LENMAX = 10)
        CHARACTER*(LENMAX) LINE
        CHARACTER*(LENMAX) VAL
	
	PRINT *,' Welcome to the program -PlotStars-'
	PRINT *,''
        PRINT *,' Please specify number of stars in first row'
        READ*,N

        IF (N.GT.LENMAX) THEN
          PRINT*, " Number of stars is unvalid. (Error)"
          stop
        ENDIF

        LINE=""

        DO 150,L = 1,N
          LINE(L:)="*"
150     CONTINUE

        VAL=" "
        DO 250,L = 1,N
          PRINT*,LINE
          POS=(N-L+1)
          LINE(POS:)=VAL  
250     CONTINUE
      END PROGRAM PlotStars
