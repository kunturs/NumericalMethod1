function [L,U,Uinv,X,Ainv,err] = CroutNew(A)

n = length(A);

for i=1:n
    L(i,1)=A(i,1);
    U(i,i)=1;
end

for i=2:n
    U(1,i)=A(1,i)/L(1,1);
end

for i=2:n 
    for j=2:i
        L(i,j)=A(i,j)-L(i,1:j-1)*U(1:j-1,j);
    end
    for j=i+1:n
        U(i,j)=(A(i,j)-L(i,1:i-1)*U(1:i-1,j))/L(i,i);
    end
end
Uinv=inv(U);

%solve for x
for i=1:n
    X(i,n)=Uinv(i,n)/L(n,n);
end


for i=1:n %backward sub
    for j=n-1:-1:1
        X(i,j)= (Uinv(i,j)-X(i,j+1:n)*L(j+1:n,j))/L(j,j);
    end
end

C=inv(A)-X;
err=norm(C,inf)/norm(X,inf);

%Defining inv(A)
Ainv=inv(A);

end

       
