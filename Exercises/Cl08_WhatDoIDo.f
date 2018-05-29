        program WhatDoIDo
            
            implicit none
c  Declares the variables
      integer fd, ios, aux
      parameter( fd = 20 )
      character*79 string
c   defines the format to use

  30  format ( ' aux = ', I6 )

c   open the file 'input.data' Into an unit

      open(unit=fd,file='input.data',status='old', 
     &     form='formatted')
            
      aux = 0

c     reads (fd) into the string "string" using string format (A)
c     iostat is assigned to the variable ios, that checks when an error occurs 
c     err = 20 will execute label 20 when an error is found
c     end = 20 will execute label 20 when the end of the file is reached
c     aux is counting the number of rows in the file, since the
c     default access is sequential, aux will be counting every line
c     of the file from the beginning

  10        continue
            read( fd, '(A)', iostat=ios, err=20, end=20 ) string
            aux = aux + 1
            goto 10
            
c     checks for errors or End of File
c     When ios is less than zero, the end of the file has been reached
c     then the write statement will print the number of rows of the file (aux)
c     in format 30, I6, i.e. as an integer in a width field of 6 spaces, where the
c     value is right alligned
c     If ios is greater than zero, an error has been found, the file
c     will be closed and the program will not return any output
            
            
  20        continue
            if (ios .lt. 0 ) then
                write( *, 30 ) aux
            else if ( ios .gt. 0 ) then
                stop 'error occured!'
            endif


            close( fd )
        end program

c     When the program acts on its own source code, it will print out
c     the number of rows of itself!
