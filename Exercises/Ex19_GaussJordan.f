        SUBROUTINE gaussj(a,n,np,b,m,mp)
                INTEGER m,mp,n,np,NMAX
                REAL a(np,np),b(np,mp)
                PARAMETER (NMAX=50)
                INTEGER i,icol,irow,j,k,l,ll,indxc(NMAX),indxr(NMAX),
     *                  ipiv(NMAX)
                REAL big,dum,pivinv
                do 11 j=1,n
                        ipiv(j)=0
                enddo 11
                do 22 i=1,n
                        big=0.
                        do 13 j=1,n
                                if(ipiv(j).ne.1)then
                                        do 12 k=1,n
                                                if (ipiv(k).eq.0) then
                                                        if (abs(a(j,k)).ge.big)then
                                                                big=abs(a(j,k))
                                                                irow=j
                                                                icol=k
                                                        endif
                                                else if (ipiv(k).gt.1) then
                                                pause ’singular matrix in gaussj’
                                                endif
                                        enddo 12
                                endif
                        enddo 13
                        ipiv(icol)=ipiv(icol)+1
                        if (irow.ne.icol) then
                                do 14 l=1,n
                                        dum=a(irow,l)
                                        a(irow,l)=a(icol,l)
                                        a(icol,l)=dum
                                enddo 14
                                do 15 l=1,m
                                        dum=b(irow,l)
                                        b(irow,l)=b(icol,l)
                                        b(icol,l)=dum
                                enddo 15
                        endif

                        indxr(i)=irow
                        indxc(i)=icol
                        if (a(icol,icol).eq.0.) pause ’singular matrix in gaussj’
                                pivinv=1./a(icol,icol)
                                a(icol,icol)=1.
                        do 16 l=1,n
                                a(icol,l)=a(icol,l)*pivinv
                        enddo 16
                        do 17 l=1,m
                                b(icol,l)=b(icol,l)*pivinv
                        enddo 17
                        do 21 ll=1,n
                                if(ll.ne.icol)then
                                        dum=a(ll,icol)
                                        a(ll,icol)=0.
                                        do 18 l=1,n
                                                a(ll,l)=a(ll,l)-a(icol,l)*dum
                                        enddo 18
                                        do 19 l=1,m
                                                b(ll,l)=b(ll,l)-b(icol,l)*dum
                                        enddo 19
                                endif
                        enddo 21
                enddo 22
                do 24 l=n,1,-1
                        if(indxr(l).ne.indxc(l))then
                                do 23 k=1,n
                                        dum=a(k,indxr(l))
                                        a(k,indxr(l))=a(k,indxc(l))
                                        a(k,indxc(l))=dum
                                enddo 23
                        endif
                enddo 24
                return
        END