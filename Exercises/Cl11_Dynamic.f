      program driver

      implicit none

      integer nchars, max_len_fname
      parameter( max_len_fname = 30 )
      character( max_len_fname ) fname

      call gen_name( fname, nchars, 'iteration', 9, 12 )
      print *, '--> "',fname(:),'" <--'
      print *, '--> "',fname(1:nchars),'" <--'

      call gen_name( fname, nchars, 'output', 21, 80 )
      print *, '--> "',fname(:),'" <--'
      print *, '--> "',fname(1:nchars),'" <--'

      call gen_name( fname, nchars, 'timestep', 123, 10000 )
      print *, '--> "',fname(:),'" <--'
      print *, '--> "',fname(1:nchars),'" <--'

      end

      subroutine gen_name( fname, nchars, bname, step, maxsteps )

      implicit none

      character(*) fname, bname
      integer nchars, step, maxsteps

      character(20) myfmt
      integer width, N
C     Task (1)

      width = 9

C     Width refers to the width of the number field


      if( width .ge. 10 ) then
         stop 'maxsteps too large!'
      endif

C     Task (2)
    
      N = 3
      write( myfmt, FMT = 100)bname,'-',step,'.data'
      print *, myfmt
 100  FORMAT(A,A,I<N>,A)

C     Task (3)
      write( fname, myfmt )myfmt
      
c     Task (4)
  
      nchars = len(bname)
      print*,nchars

      end

      
