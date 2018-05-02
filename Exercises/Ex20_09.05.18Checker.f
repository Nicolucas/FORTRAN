      PROGRAM Checker
        REAL NUMBR,Numbr2

        PRINT *,'Welcome to the program -Writing Out Statement-'
        PRINT *,'TYPE IN A NUMBER'
        READ *,NUMBR,Numbr2
        If (NUMBR.eq.Numbr2) THEN
          print*,("True")
        ELSE
          print*,("False")
        ENDIF
      END PROGRAM Checker