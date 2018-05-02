      subroutine OpenMe(input)
        integer nmax, u
        character*7,input
        parameter (nmax=30, u=20)
        real x(nmax), y(nmax)

        open (u, FILE=input, STATUS='OLD')
        read(u,*) n

        if (n.GT.nmax) then
          write(*,*) 'Error: n = ', n, 'is larger than nmax =', nmax
          goto 9999
        endif

        do 10 i= 1, n
          read(u,100) x(i), y(i)
10      enddo
100     format (3(F10.4))

        close (u)

9999    stop
      end
        
        
        
      PROGRAM ReadingStuff
              integer x(), y()
              call OpenMe('dat.dat')
              PRINT*,integer(x(1),x(2),x(3))
      END PROGRAM