      PROGRAM SimpleFormating
        IMPLICIT NONE

        INTEGER my_int
        REAL my_flt
        LOGICAL my_lgc
        CHARACTER*16 my_str

        PARAMETER(my_int = -753, my_flt = 18.9872E-02)
        PARAMETER (my_lgc = .FALSE.,my_str = 'DONAUDAMPFSCHIFF')

        PRINT*, 'Exercise b)'

        PRINT  '(I5)', my_int
        PRINT '(I10.7)', my_int
        PRINT '(F8.5)', my_flt
        PRINT '(E11.4)', my_flt

        PRINT*, 'Exercise c)'

        WRITE (*, FMT = 10) my_lgc
 10     FORMAT(L1)

        WRITE (*, FMT = 20) my_lgc
 20     FORMAT(L2)

        WRITE (*, FMT = 30) my_str
 30     FORMAT(A16)

        WRITE (*, FMT = 40) my_str
 40     FORMAT(A5)

        WRITE (*, FMT = 50) my_str
 50     FORMAT('DIE BLAUE ', A5)


        END PROGRAM
