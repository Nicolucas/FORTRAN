        PROGRAM CONVRT
        INTEGER FAHREN
        REAL CELSIU, RCELSIU, READFAHREN, KELVIN, RKELVIN
        
        PRINT*, 'Type in your the Fahrenheit value'
        READ*,READFAHREN

        DO 100 FAHREN=-100,200
        
            CELSIU=(FAHREN-32)*5./9.
            KELVIN=CELSIU+273.15
            PRINT *,FAHREN,'°F ---- ',CELSIU,'°C -----', KELVIN, 'K'
        
100     CONTINUE
        PRINT*, ''
        PRINT*, 'And your value...'
        RCELSIU=(READFAHREN-32)*5./9.
        RKELVIN=RCELSIU+273.15
        PRINT*,READFAHREN,'°F ---- ',RCELSIU,'°C -----', RKELVIN, 'K'
        
        END