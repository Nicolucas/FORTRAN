*TSECS converts hours, minutes, seconds to total seconds.
      REAL FUNCTION TSECS(NHOURS, MINS, SECS)
        REAL NHOURS, MINS
        REAL SECS
        TSECS = ((NHOURS * 60.) + MINS) * 60. + SECS
      END

      PROGRAM HOUR_CALCULATOR
        REAL RHOUR,RMIN
        REAL SECS,RESULT
        PRINT *,'TYPE IN HOURS'
        READ *,RHOUR

        PRINT *,'TYPE IN MINUTES'
        READ *,RMIN

        PRINT *,'TYPE IN SECONDS'
        READ *,SECS

        PRINT *,'TOTAL TIME IN SECONDS: '
        RESULT=TSECS(RHOUR, RMIN, SECS)
        WRITE(*,*) RESULT
      END

