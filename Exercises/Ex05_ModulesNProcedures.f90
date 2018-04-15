    MODULE Triangle_Operations
        IMPLICIT NONE
        CONTAINS
        FUNCTION Area(x,y,z)
            REAL :: Area
            REAL, INTENT(IN) :: x,y,z
            REAL :: theta, height


            theta = ACOS((x**2+y**2-z**2)/(2.0*x*y))
            height = x*SIN(theta)

            Area = ABS(0.5*y*height)
        END FUNCTION Area
    END MODULE Triangle_Operations

    !por que en archivos separados y no modulos con funciones y subrutinas separadas?

    PROGRAM Triangle
        USE Triangle_Operations
        IMPLICIT NONE
        REAL :: a, b, c

        PRINT*, 'Welcome, please enter the lengths of the 3 sides.'
        READ*, a, b, c
        PRINT*, 'Area of the Triangle: ', Area(a,b,c)
    END PROGRAM Triangle