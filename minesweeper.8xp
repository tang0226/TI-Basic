16->W
8->H
W*H->N

0.156->D
0->E

0->dim(L1)
W*H->dim(L1)
For(I,1,n):
    If rand<D
    Then
        9->L1(I)
        E+1->E
    Else
        0->L1(I)
    End
End

1->I
For(Y,1,H):
    For(X,1,W):
        If L1(I)!=9
        Then
            0->C
            For(A,-1,1):
                If X+A>0 and X+A<=W
                Then
                    For(B,-1,1):
                        If Y+B>0 and Y+B<=H
                        Then
                            If not(A=0 and B=0) and L1(I+A+B*W)=9
                            Then
                                C+1->C
                            End

                        End
                    End
                End
            End
            C->L1(I)
        End
        I+1->I
    End
End

0->dim(L2)
N->dim(L2)
Fill(10,L2)

1->I
For(Y,1,H):
    For(X,1,W):
        If L2(I)=10:
            Output(Y,X,"+")
        I+1->I
    End
End

8->P
0->C
0->D

0->F

1->X
1->Y
X->U
Y->V

(Y-1)*W+X->I
I->J

While 1:
    0->M
    getKey->K

    If K=25 and Y>1
    Then
        X->U
        Y->V
        Y-1->Y
        I->J
        I-W->I
        1->M
    Else
        If K=26 and X<W
        Then
            X->U
            Y->V
            X+1->X
            I->J
            I+1->I
            1->M
        Else
            If K=34 and Y<H
            Then
                X->U
                Y->V
                Y+1->Y
                I->J
                I+W->I
                1->M
            Else
                If K=24 and X>1
                Then
                    X->U
                    Y->V
                    X-1->X
                    I->J
                    I-1->I
                    1->M
                End
            End
        End
    End

    If K=105
    Then
        If L1(I)=9
        Then
            Goto 1
        End
        F+(L2(I)>9)->F
        L1(I)->L2(I)
        P-1->C
        0->D
    Else
        If K=95
        Then
            If L2(I)=10
            Then
                11->L2(I)
            Else
                If L2(I)=11
                Then
                    10->L2(I)
                End
            End

            0->dim
            P-1->C
        End
    End

    If M=1
    Then
        If L2(J)=10
        Then
            Output(V,U,"+")
        Else
            If L2(J)=11
            Then
                Output(V,U,"P")
            Else
                Output(V,U,L2(J))
            End
        End
        Output(Y,X," ")
        0->C
        0->D
    End

    C+1->C
    If C=P
    Then
        0->C
        not(D)->D
        If D
        Then
            If L2(I)=10
            Then
                Output(Y,X,"+")
            Else
                If L2(I)=11
                Then
                    Output(Y,X,"P")
                Else
                    Output(Y,X,L2(I))
                End
            End
        Else
            Output(Y,X," ")
        End
    End
End

Lbl 1

ClrHome
Output(1,4,"GAME OVER!")
Output(2,2,"YOU HIT A MINE")
Output(3,1,"YOUR PROGRESS:")
Output(4,1,F/(N-E)*100)
Output(6,1,"<CLEAR> TO EXIT")

While getKey!=45
End

ClrHome
