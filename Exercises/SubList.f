c Subroutine that loads a *.txt into two arrays
      subroutine OpenMe(input)
        integer nmax, u
        character*7,input
        parameter (nmax=1000, u=20)
        real x(nmax), y(nmax)

        open (u, FILE=input, STATUS='OLD')
        read(u,*) n

        if (n.GT.nmax) then
          write(*,*) 'Error: n = ', n, 'is larger than nmax =', nmax
          goto 9999
        endif

c  Loop over the data points
        do 10 i= 1, n
          read(u,100) x(i), y(i)
10      enddo
100     format (3(F10.4))

c  Close the file
        close (u)

9999    stop
      end



c Subroutine that saves two arrays into a *.txt
      subroutine SaveMeMaybe(Cos)
      end