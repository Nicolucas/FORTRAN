    program Arithmetic_If
    implicit none
    REAL*8:: Input  
    CHARACTER(LEN=15):: Val

        PRINT*, "Test me bitch"
        READ*, Input
        IF(Input) 1,2,3

1   CONTINUE
        Val="Negative Sign"
        GOTO 4
2   CONTINUE
        Val="MUTTAFUKKA ZERO"
        GOTO 4
3   CONTINUE
        Val="Positive Sign"
        GOTO 4
4   CONTINUE
        PRINT*, Val
    end program Arithmetic_If  