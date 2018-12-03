% EXERCISE 1
%Initializing data: 
%X = body wight(Kg)
X = [90 86 67 89 81 75];
%Y = heart rate at rest
Y = [62 45 40 55 64 53];

%A)
%Graph the data:
figure, plot(X,Y,'o');
axis([50 100 30 80]); 
%Semmengly, it hasn`t got linear relation-ship.

%B)
%Write the regression line

Sxx = sum(X.*X); 
Sx = sum(X);
Sxy = sum(X.*Y);
Sy = sum(Y);
n = length(X);
A = [Sxx Sx; Sx n];
b = [Sxy Sy]';
sol = A\b
hold on;
%limits of the line
xl = [30 100]; 
yl = [sol(2) sol(1)*100+sol(2)];
%Write the line
plot(xl, yl);
hold off;
% The coefficent determine the slope. It can predict approximately the result with a
% given entry.

%C)
%without (67,40)
X = [90 86 89 81 75];
Y = [62 45 55 64 53];

%Graph the data:
figure, plot(X,Y,'o');
axis([30 100 30 100]); 

%Write the regression line
Sxx = sum(X.*X); 
Sx = sum(X);
Sxy = sum(X.*Y);
Sy = sum(Y);
n = length(X);
A = [Sxx Sx; Sx n];
b = [Sxy Sy]';
sol = A\b
hold on;
%limits of the line
xl = [30 100]; 
yl = [sol(2) sol(1)*100+sol(2)];
%Write the line
plot(xl, yl);
hold off;
%We can observe that the line change his slope. Its happen because
%the point (67,40) was the most "different" in the group, and not taking
%account it, the coefficents changes.

%D)
%Predict the heart rate for 88Kg
hold on, plot(88, sol(1)*88+sol(2), '*');
HR = sol(1)*88+sol(2)

%E)
%(90,62) or (88,56.0995) because are closer to the stright line. This line
%is the adjustment of the function. 

%F) Apply polynomial fitting.
X = [90 86 67 89 81 75];
Y = [62 45 40 55 64 53];

%We can use the function of patern: Polyfit(x,y,g). 
sol = polyfit(X,Y,2); %2 is the grade of the polynomial function.
figure, plot(X,Y,'o');
domX = linspace(30,100);
hold on, plot(domX, polyval(sol,domX));
%the line can adjust better to the data

%G) Compute grade 3.
sol = polyfit(X,Y,3);
figure, plot(X,Y,'o');
hold on, plot(linspace(30,100), polyval(sol,linspace(30,100)));
% We can observe that the line can adjust better. It's this, because the
% data don't have linear relation-ship.

%H) Calculate
X = [90 86 67 89 81 75];
Y = [62 45 40 55 64 53];
newY = 1./(Y.*Y);
nY = log(newY);
sol = polyfit(X, nY, 1);
b = sol(1);
C = sol(2);
a = exp(C);
domX = linspace(min(X), max(X));
figure, plot(X,nY,'o');
%hold on, plot(domX, a*exp(-b*domX));
hold on, plot(domX, 1./(b*domX));

%I) Calculate
X = [90 86 67 89 81 75];
Y = [62 45 40 55 64 53];
newX = X./100;
newY = 3*newX.*exp(2*newX);
nY = log(newY./newX)';
A = [newX' ones(size(X))'];
sol = pinv(A)*nY;
b = sol(2);
a = sol(1);
c = exp(b);
figure, plot(newX, newY, 'o');
dom = linspace(min(newX),max(newX));
hold on, plot(dom, (a*b*dom+c));
hold off;


