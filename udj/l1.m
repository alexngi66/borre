format short g
% Opgave 1.22
A = [-1  1  0  0;
     -1  0  1  0;
      0 -1  1  0;
      0 -1  0  1;
     -1  0  0  1;
      0  0 -1  1];

null(A','r')
ans =
	  1  -1     -1
	 -1   0      1
	  1   0    	 0
     0  -1	   -1
     0	1		 0
     0   0	    1
% Matlab giver andre ringe end anf�rt i svaret p� side 218.
% Forklar hvorfor Matlab svaret ogs� er rigtigt.

% Opgave 1.23
% Nulrummet har dimension 1
[m,n] = size(A)
m =
     6
n =
     4
rank(A)
ans =
     3
% Rangen er 3; dermed har s�jle- og r�kkerum dimension 3.
% Dimensionen af venstre nulrum er m-n+1 = 6-4+1 = 3.
% Vi fandt ogs� 3 y'er, der beskriver tre uafh�ngige ringe.
Q = orth(A)
Q =
    -0.58    0.29    0.29
    -0.58    0.11   -0.39
     0	   -0.18   -0.68
     0	   -0.68   -0.18
    -0.58   -0.39    0.11
     0	   -0.50    0.50

% Q udg�r en ortonormal basis for A's r�kkerum. Antallet af s�jler
% i Q er A's rang
null(A,'r')
ans =
	  1.00
	  1.00
	  1.00
	  1.00

% Opgave 1.24
N = A'*A
N =
     3	-1	-1   -1
    -1	 3	-1   -1
    -1	-1	 3   -1
    -1	-1	-1    3
syms c_1 c_2 c_3 c_4 c_5 c_6;
C = diag([c_1 c_2 c_3 c_4 c_5 c_6]);
S = A'*C*A
S =
[ c_1+c_2+c_5, 	      -c_1,	         -c_2,    	 -c_5]
[	      -c_1,   c_1+c_3+c_4,	         -c_3,    	 -c_4]
[	      -c_2,	         -c_3,   c_2+c_3+c_6,	       -c_6]
[	      -c_5,	         -c_4,	         -c_6, c_4+c_5+c_6]
% P� hoveddiagonalen st�r summen af de kanter, der udg�r fra den
% p�g�ldende knude. I den j'te r�kke st�r p� hoveddiagonalen
% summen af de c-v�rdier, der h�rer til kanterne, der udg�r fra knuden.
% De �vrige pladser er nul p�n�r de s�jler, der svarer til
% kanternes andet endepunkt.

% Opgave 1.25
% 1.
A = [ -1  1  0	0;
      -0 -1  1	0;
      -1  0  1	0;
      -1  0  0	1;
       0  0 -1 1];
A(:,4)=[]
A =
    -1	 1	 0
     0	-1	 1
    -1	 0	 1
    -1	 0	 0
     0	 0	-1
% 1.
null(A','r')
ans =
    -1	   1
    -1	   1
     1	   0
     0	  -1
     0	   1

U = rref(A')
U =
     1	   0	 1     0    -1
     0	   1	 1     0    -1
     0	   0	 0     1     1
% 2.
y = A'
y =
    -1	   0	-1    -1     0
     1	  -1	 0     0     0
     0	   1	 1     0    -1
sum(y)
ans =
     0	   0	 0    -1    -1
% Det vil sige y_4+y_5=0
% 3.
rank(A)
ans =
     3
% 4.
null(A','r')
ans =
    -1	   1
    -1	   1
     1	   0
     0	  -1
     0	   1
% Vi f�r andre ringe, men l�sningen er ok!

