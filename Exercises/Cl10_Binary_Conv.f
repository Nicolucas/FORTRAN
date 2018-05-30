C =============================================================================
C Scientific Programming, Summer Term 2018
C Ludwig-Maximilians-Universitaet Muenchen
C
C Exercise 23: Number Converter
C =============================================================================

C     -------------------------------------------------------------------------
C     Subroutine CONV_BASE2&16
C
C     TASK: Convert a non-negative decimal number to Binary and HEXADECIMAL representation
C
C     PARAMETERS:
C
C        decval ........... decimal number to be converted (intent: in)
C        binval ........... character string of length 31 for storing the
C                           binary representation (intent: out)
C        hexval ........... character string of length 31 for storing the
C                           hexadecimal representation (intent: out)
C     -------------------------------------------------------------------------

C ------------------------------------- Binary Converter
      SUBROUTINE CONV_BASE2( decval, binval )

      IMPLICIT NONE
      INTEGER decval, bin_digits, k, dec
      CHARACTER(*) binval
      
C     Number is non-negative and stored as signed 4 byte integer,
C     this requires 31 binary digits
      PARAMETER ( bin_digits = 31 )

C     Copy input value to local variable, since we want to modify it.
C     This avoids problems when input is a constant.
      dec = decval

C     Security checks
      IF ( LEN(binval) .LT. bin_digits ) THEN
         PRINT '(A,I3,A)',' string < ',bin_digits,' characters,'//
     &        ' i.e. too short for storing binary representation!'
         STOP
      ENDIF

      IF ( decval .LT. 0 ) THEN
         PRINT *,'Input parameter negative!'
         STOP
      ENDIF

C     Compute binary representation and store as string
      DO k = bin_digits, 1, -1
         IF ( mod(dec,2) .EQ. 0 ) THEN
            binval(k:k) = 'O'
         ELSE
            binval(k:k) = 'L'
         ENDIF
         dec = dec / 2
      ENDDO

      END

C ------------------------------------- Hexadecimal Converter

      SUBROUTINE CONV_BASE16( decval, hexval )

      IMPLICIT NONE
      INTEGER decval, hex_digits, k, dec, Res
      CHARACTER(*) hexval

      
C     Number is non-negative and stored as signed 4 byte integer,
C     this requires 8 hexagesimal digits
      PARAMETER ( hex_digits = 8 )

C     Copy input value to local variable, since we want to modify it.
C     This avoids problems when input is a constant.
      dec = decval

C     Security checks
      IF ( LEN(hexval) .LT. hex_digits ) THEN
         PRINT '(A,I3,A)',' string < ',hex_digits,' characters,'//
     &        ' i.e. too short for storing hexadecimal representation!'
         STOP
      ENDIF

      IF ( decval .LT. 0 ) THEN
         PRINT *,'Input parameter negative!'
         STOP
      ENDIF

C     Compute hexadecimal representation and store as string

      DO k = hex_digits, 1, -1
        Res=mod(dec,16)
         IF ( (Res .GE. 0).AND.(Res .LE. 9) ) THEN
            WRITE(hexval(k:k),'(I1)') (Res)
         ELSEIF( Res .EQ. 10 ) THEN
            hexval(k:k) = 'A'
         ELSEIF( Res .EQ. 11 ) THEN
            hexval(k:k) = 'B'
         ELSEIF( Res .EQ. 12 ) THEN
            hexval(k:k) = 'C'
         ELSEIF( Res .EQ. 13 ) THEN
            hexval(k:k) = 'D'
         ELSEIF( Res .EQ. 14 ) THEN
            hexval(k:k) = 'E'
         ELSE
            hexval(k:k) = 'F'
         ENDIF 
         
         dec = dec / 16
      ENDDO

      END

c---------------------------DO THE EVOLUTION BABY
c Call the subroutines neately
      SUBROUTINE ConvEmAll(ToConv)
      
      IMPLICIT NONE
      CHARACTER*53,LINE
      Integer ToConv
      CHARACTER(31) binval
      CHARACTER(8) hexval
      CHARACTER(10) decstr

      
      write(decstr,'(I10)') ToConv

      call CONV_BASE2(ToConv,binval)
      call CONV_BASE16(ToConv,hexval)

      
      LINE=""
      LINE(1:11)=decstr
      LINE(12:13)="|"
      LINE(14:44)=binval
      LINE(45:46)="|"
      LINE(47:53)= hexval
      PRINT*,LINE
      END SUBROUTINE


C -------------------------------
      PROGRAM TestDriver
      IMPLICIT NONE
      Integer ToConv

      integer fd, ios, aux
      parameter( fd = 20 )
      character*10 string

      PRINT*, "  Base-10  |             Base-2             | Base-16 "
      PRINT*, "-----------|--------------------------------|---------"
      
c----------------------------------READ DATA----------------------
  30  format ( ' aux = ', I6 )
      open(unit=fd,file='Data.dat')
      aux = 0

  10        continue
            read( fd, '(I10)', iostat=ios, err=20, end=20 ) ToConv
            CALL ConvEmAll(ToConv)
            aux = aux + 1
            goto 10  

  20        continue
            if ( ios .gt. 0 ) then
                stop 'error occured!'
            endif
      close( fd )
c----------------------------------READ DATA----------------------
      END Program