      subroutine iswap (a, b)
        integer a, b
c Local variables
        integer tmp

        tmp = a
        a = b
        b = tmp

        return
      end
      
      
      
      
      program callex
      integer m, n
c
      m = 1
      n = 2 

      call iswap(m, n)
      write(*,*) m, n

      stop
      end
      
      
      