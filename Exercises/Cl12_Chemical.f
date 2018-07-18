C =============================================================================
C Scientific Programming, Summer Term 2018
C Ludwig-Maximilians-Universitaet Muenchen
C
C Exercise 26: Chemical tracer in a pipe
C =============================================================================

C     -------------------------------------------------------------------------
C     SubRoutines:
C     
C     DataInit  ........... Initialization of data
C     Evolve    ........... Evolution of the system
C     SaveIn    ........... Save the data in a file
C     
C     Parameters:
C
C        NT,NX  ........... Number of Temporal (101) and Spatial (101) grid nodes
c                           (intent: in)
C        Tt,Tx  ........... Max value for t and x [(x,t)\in [0,1]x[0,05]]
C                           (intent: in)
C        v      ........... Constant Velocity
C                           (intent: in)
C        Dt     ........... Constant timestep
C                           (intent: in)
C
C     -------------------------------------------------------------------------


      Program ItsEvolutionBaby
        Implicit None
        Integer NT,NX,I,J
        Real v,Dt,Dx,Tt,Tx
        Character(20) FName

        Parameter(NT=101,NX=101, v=1.0, Dt=0.005, Dx=0.01)
        Double Precision Phi(NT,NX)


C   ----Data Initialization     
        call DatIni(Phi,NT,NX,Dt,Dx)
        FName="Chemical.dat"
        print*,"."

C   ----Data Evolution
        call Evolve2(Phi,NT,NX,Dt,Dx,v)
        print*,"."

C   ----Data Saving 
        call SaveIn2(Phi,NT,NX,FName,Dt,Dx)
        print*,"Saved in ",FName

      End Program ItsEvolutionBaby
  

C -----------------------SUBROUTINES--------------------------------------------
      SUBROUTINE DatIni(Theta,NT,NX,Dt,Dx)
        Implicit None
        Integer NT,NX, I
        Real Dx,Dt,x,UpBon,DowBon
        Double Precision Theta(NT,NX)
        
        DowBon=0.6
        UpBon=0.8

        x=0.0


        DO 50, I = 1,NX
            x=Dx*(I-1)

            If((x.le.UpBon).and.(x.ge.DowBon)) Then
                Theta(1,I)=1.0
            Else 
                Theta(1,I)=0.0
            EndIf
50      CONTINUE

        DO 60, I = 1,NT
            Theta(I,1)=0.0
            Theta(I,NX)=0.0
60      CONTINUE
      END SUBROUTINE



      SUBROUTINE Evolve(Theta,NT,NX,Dt,Dx,v)
      IMPLICIT NONE
        INTEGER K, I, NT,NX
        Real Dx,Dt,v
        Double Precision Theta(NT,NX)


        DO 80,K = 2,NT
            DO 70,I = 2,NX-1
            Theta(K,I) = Theta(K-1,I)-
     &      v*(Dt/(2*Dx))*(Theta(K-1,I+1)-Theta(K-1,I-1))
70          CONTINUE
80      CONTINUE 
      END SUBROUTINE





      SUBROUTINE Evolve2(Theta,NT,NX,Dt,Dx,v)
      IMPLICIT NONE
        INTEGER K, I, NT,NX
        Real Dx,Dt,v
        Double Precision Theta(NT,NX)


        DO 80,K = 2,NT
            DO 70,I = 2,NX-1
            Theta(K,I) = Theta(K-1,I)-
     &      v*(Dt/Dx)*(Theta(K-1,I)-Theta(K-1,I-1))
70          CONTINUE
80      CONTINUE 
      END SUBROUTINE




      SUBROUTINE SaveIn(Theta,NT,NX,FName,Dt,Dx)
      IMPLICIT NONE
        INTEGER K, I, NT,NX, fd, POS1, POS2
        Double Precision Theta(NT,NX)
        Character(*) FName
        Real Dt,Dx

        CHARACTER*3000,LINE
        CHARACTER*20,VAL
        fd=2

        Open (unit = fd, file = FName)

        DO 100,I = 1,NX
            LINE=""
            DO 90,K = 1,NT
                WRITE(VAL,'(F20.10)') Theta(K,I)
                POS1=(K-1)*21+1
                POS2=(K)*21+1
                LINE(POS1:POS2)=VAL  
90          CONTINUE
            Write(fd,*)LINE
100     CONTINUE 

        Close(fd)

      END Subroutine



      SUBROUTINE SaveIn2(Theta,NT,NX,FName,Dt,Dx)
      IMPLICIT NONE
        INTEGER K, I, NT,NX, fd, POS1, POS2
        Double Precision Theta(NT,NX)
        Character(*) FName
        Real Dt,Dx

        CHARACTER*65,LINE
        CHARACTER*20,VAL
        fd=2

        Open (unit = fd, file = FName)

        DO 120,I = 1,NX
            DO 110,K = 1,NT
                LINE=""
                WRITE(VAL,'(F20.10)') (Dx*I)
                LINE(1:21)=VAL
                WRITE(VAL,'(F20.10)') (Dt*K)
                LINE(23:43)=VAL
                WRITE(VAL,'(F20.2)') Theta(K,I)
                LINE(45:65)=VAL
                Write(fd,*)LINE  
110         CONTINUE
120     CONTINUE 

        Close(fd)

      END Subroutine