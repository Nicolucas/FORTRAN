      PROGRAM HelloWorld
        IMPLICIT NONE
        integer arr(8),j, a,b
        a=5
        b=2
        do j=1,8
            arr(j)=j
        enddo

        call change(arr(2),3)

        print*, arr
        print*,a/b
      END PROGRAM HelloWorld 


      subroutine change(field,length)

      integer length, field(0:*),k
      do k =0, length-1
      field(k)=0
      enddo
      end