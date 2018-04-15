        PROGRAM TIME
        REAL LTYR, LTMIN, DIST, ELAPSE
        INTEGER MINUTE, SECOND

        LTYR=9.46*(10**12)
        LTMIN=LTYR/(365.25*24.0*60.0)
        DIST=150.0*(10**6)
C Se me vuelan las constantes!

        ELAPSE=DIST/LTMIN
        MINUTE=ELAPSE
        SECOND=(ELAPSE-MINUTE)*60
C
        PRINT *,' LIGHT TAKES ',MINUTE,' MINUTES'
        PRINT *,'        ',SECOND,' SECONDS'
        PRINT *,' TO REACH THE EARTH FROM THE SUN'
        END