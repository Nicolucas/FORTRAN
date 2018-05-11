c   a) Write the subroutine for matrix multiplication C=AB

      SUBROUTINE MATMUL(A,B,C,N)
        IMPLICIT NONE
        INTEGER N, L, K, I
        Double Precision A(N,N),B(N,N),C(N,N), SUM

        DO 250,L = 1,N
            DO 150,K = 1,N
                SUM = 0.0D0
                DO 50,I = 1,N
                    SUM = SUM + A(K,I)*B(I,L)
50              CONTINUE
                C(L,K) = SUM
150         CONTINUE
                
250     CONTINUE  
      END SUBROUTINE

c --------------------------------------------------------------------------
      SUBROUTINE MATPRINT(A,N)
        IMPLICIT NONE
        INTEGER N,L,K, POS1, POS2
        Double Precision A(N,N)
        CHARACTER*80,LINE
        CHARACTER*19,VAL

        DO 250,L = 1,N
            LINE=""
            DO 150,K = 1,N
                WRITE(VAL,'(F19.12)') A(L,K)
                POS1=(K-1)*20+1
                POS2=(K)*20+1
                LINE(POS1:POS2)=VAL  
150         CONTINUE
            PRINT*,LINE
250     CONTINUE
      END SUBROUTINE

c --------------------------------------------------------------------------

c - b) Write a test-driver for the subroutine that computes L.L^T
      PROGRAM TestDriver
        IMPLICIT NONE
        INTEGER N
        PARAMETER (N=4)
        Double Precision A(N,N),B(N,N),C(N,N)
        
        PRINT *,'Welcome to the program -Test Driver / MATMUL-'
        A(1,1)=1
        A(1,2)=0
        A(1,3)=0
        A(1,4)=0
        A(2,1)=2
        A(2,2)=1
        A(2,3)=0
        A(2,4)=0
        A(3,1)=3
        A(3,2)=3
        A(3,3)=1
        A(3,4)=0
        A(4,1)=4
        A(4,2)=4
        A(4,3)=4
        A(4,4)=1


        B(1,1)=1
        B(1,2)=2
        B(1,3)=3
        B(1,4)=4
        B(2,1)=0
        B(2,2)=1
        B(2,3)=3
        B(2,4)=4
        B(3,1)=0
        B(3,2)=0
        B(3,3)=1
        B(3,4)=4
        B(4,1)=0
        B(4,2)=0
        B(4,3)=0
        B(4,4)=1
        
        
        PRINT*, ""
        PRINT*, "Matrix A"
        CALL MATPRINT(A,N)
        PRINT*, ""
        PRINT*, "Matrix b"
        CALL MATPRINT(B,N)
        PRINT*, ""
        CALL MATMUL(A,B,C,N)
        PRINT*, "Matrix C = A.B"
        CALL MATPRINT(C,N)
      END
