clc
clear

%Upper and lower interval input
a = input ('enter lower interval: ');
b = input ('enter upper interval: ');

%bisection method
if horner(a)*horner(b)>0
     disp('Input different choice of interval')
else
     c = (a+b)/2;
    err = abs(horner(c));
while err > 1e-10
   if horner(a)*horner(c)<0 
       b = c;
   else
       a = c;          
   end
    c = (a + b)/2; 
   err = abs(horner(c));
    end
end

fprintf('The root of polynomial in given interval is %f',c)
