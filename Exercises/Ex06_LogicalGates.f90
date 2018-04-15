    module Logical_Operations
        implicit none
        contains

        Function Assign_TF_val(x)
            INTEGER::x
            LOGICAL:: Assign_TF_val

            Assign_TF_val=.FALSE.
            
            IF(x.EQ.1) THEN
                Assign_TF_val=.TRUE.
            END IF
        end Function Assign_TF_val
        

        Function Logic_And(x,y)
            LOGICAL :: Logic_And, x,y 
            Logic_And = x.AND.y
        end function Logic_And
        
            
        Function Logic_Or(x,y)
            LOGICAL :: Logic_Or, x,y 
            Logic_Or = x.OR.y
        end function Logic_Or


        Function Logic_XOR(x,y)
            LOGICAL :: Logic_XOR, x,y 
            Logic_XOR = (x.AND.(.NOT.y)).OR.(y.AND.(.NOT.x))
        end function Logic_XOR


        Function Logic_NOR(x,y)
            LOGICAL :: Logic_NOR, x,y 
            Logic_NOR = (.NOT.(x.OR.y))
        end function Logic_NOR


        Function Logic_NAND(x,y)
            LOGICAL :: Logic_NAND, x,y 
            Logic_NAND = (.NOT.(x.AND.y))
        end function Logic_NAND



        SUBROUTINE Loop_Truth_Table(Logic_function)
            INTEGER :: i,j
            LOGICAL :: x,y  
            INTERFACE
                function Logic_function(a,b)
                    LOGICAL :: a,b, Logic_function
                end function Logic_function
            END INTERFACE
            
            DO i = 0, 1, 1
                DO j = 0, 1, 1
                    x=Assign_TF_val(i)
                    y=Assign_TF_val(j)
                    PRINT*, x, " | ", y , " || ",  Logic_function(x,y)       
                END DO
            END DO
        end SUBROUTINE Loop_Truth_Table

    end module Logical_Operations



    PROGRAM Truth_Table
        USE Logical_Operations
        Implicit none

            PRINT*,"Truth Table"
            PRINT*,"AND"
            PRINT*,""
            call Loop_Truth_Table(Logic_And)
            PRINT*,""
            PRINT*,""

            PRINT*,"Truth Table"
            PRINT*,"OR"
            PRINT*,""
            call Loop_Truth_Table(Logic_Or)
            PRINT*,""
            PRINT*,""

            PRINT*,"Truth Table"
            PRINT*,"NAND"
            PRINT*,""
            call Loop_Truth_Table(Logic_NAND)
            PRINT*,""
            PRINT*,""

            PRINT*,"Truth Table"
            PRINT*,"NOR"
            PRINT*,""
            call Loop_Truth_Table(Logic_NOR)
            PRINT*,""
            PRINT*,""

            PRINT*,"Truth Table"
            PRINT*,"XOR"
            PRINT*,""
            call Loop_Truth_Table(Logic_XOR)
            PRINT*,""
            PRINT*,""


    END PROGRAM Truth_Table