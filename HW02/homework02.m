A = [0 0 0 1 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1; 7.3809 0 0 0 2 0; 0 -2.1904 0 -2 0 0; 0 0 -3.1904 0 0 0 ]

U1= [0 0 0 1 0 0];
U2= [0 0 0 0 1 0];
U3= [0 0 0 0 0 1];
U = [U1.' U2.' U3.'];



eig(A)


for i=1:3
    Ui = U(:,i)
    C= [Ui A*Ui A^2*Ui A^3*Ui A^4*Ui A^5*Ui]
    rank(C)
end


for i=1:3
    Ui = U(:,i);
    %H = (inv(s*eye(6) - A)*Ui)
    

end
%H(3,1)

%Ukol 4

C= [U A*U A^2*U A^3*U A^4*U A^5*U]
latex(sym(vpa(C)))
rank (C)
