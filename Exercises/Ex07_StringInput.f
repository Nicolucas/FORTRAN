        PROGRAM INOUT
C
C This program reads in and prints out a name
C
        CHARACTER NAME*4
        PRINT*, 'Type in your name, up to 20 characters'
        PRINT*,'enclosed in quotes'
        READ*,NAME
        PRINT*,'Hola ',NAME,'!'
        END