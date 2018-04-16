    PROGRAM QES
    IMPLICIT NONE
        INTEGER:: a, b, c, D
        REAL :: Real_Part, Imag_Part

        PRINT*, "Type in values for a, band c"
        READ*, a, b, c
        IF (a /= 0) THEN
            ! Calculate discriminant
            D = b*b - 4*a*c
            IF (D == 0) THEN
               PRINT*, "Root is", -b/(2.0*a)
            ELSE IF (D > 0) THEN !real roots
                PRINT*, "Roots are", (-b+SQRT(REAL(D)))/(2.0*a),&
                "and", (-b-SQRT(REAL(D)))/(2.0*a)
            ! complex roots
            ELSE
                Real_Part = -b/(2.0*a)
                ! Since D < 0, ! calculate SRQT of -D which will be +ve
                Imag_Part = (SQRT(REAL(-D))/(2.0*a))
                PRINT*, "1st Root", Real_Part, "+", Imag_Part, "i"
                PRINT*, "2nd Root", Real_Part, "-", Imag_Part, "i"
            END IF
        ELSE
            ! a == 0
            ! a is equal to 0 so ...
            PRINT*, "Not a quadratic equation"
        END IF
    END PROGRAM QES