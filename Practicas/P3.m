clear all
clc

%Exercice 1
%A

[x,y]=meshgrid(-1:0.01:1,-1:0.01:1);
z =sin((1/2)*(x.^2)-(1/4)*(y.^2)+3).*cos(2*x+1+exp(y));

cont = 0;
aux = 0; %Aux store the value of the direction in the instant n-1. At the beginning the value is 0.
iterationsA = 0;
sol = [0.5,0]';%Start point
close all
subplot(2,2,1),pcolor(x,y,z),shading flat;hold on;
while(cont <= 5) %To stop the loop. cont will determine when it has to stop. (When the minimun ranges in very small values)
       x=sol(1);
       y=sol(2);
       dx = (cos((1/2)*(x.^2)-(1/4)*(y.^2)+3)*x*cos(2*x+1+exp(y)))-(sin(2*x+1+exp(y))*2*sin((1/2)*(x.^2)-(1/4)*(y.^2)+3));
       dy = (-cos((1/2)*(x.^2)-(1/4)*(y.^2)+3)*((2/4)*y)*cos(2*x+1+exp(y)))-(sin(2*x+1+exp(y))*exp(y)*sin((1/2)*(x.^2)-(1/4)*(y.^2)+3));
       aux = sol;
       sol = aux - 0.1 * [dx;dy];
       plot([aux(1) sol(1)],[aux(2) sol(2)],'r', 'LineWidth',3)
       iterationsA = iterationsA+1;
       if(abs(aux-sol) < 0.01)%if the current step defferentiates 0.01 of the previus one, 
           cont = cont+1;%the cont is incresead
       else
           cont = 0;
       end;
       pause(0.05)
end;
iterationsA %With 0.1 ratio of learning needs 69 iteratios.
sol

%B

[x,y]=meshgrid(-1:0.01:1,-1:0.01:1);
z =sin(1/2.*(x.^2)-1/4.*(y.^2)+3).*cos(2*x+1+exp(y));

cont = 0;
aux = 0; %Aux store the value of the direction in the instant n-1. At the beginning the value is 0.
iterationsB = 0;
sol = [0.5,0]';%Start point
subplot(2,2,2),pcolor(x,y,z),shading flat;hold on;
while(cont <= 5) %To stop the loop. cont will determine when it has to stop. (When the minimun ranges in very small values)
       x=sol(1);
       y=sol(2);
       dx = (cos(1/2.*(x.^2)-1/4.*(y.^2)+3)*x.*cos(2.*x+1+exp(y)))-(sin(2*x+1+exp(y))*2*sin(1/2.*(x.^2)-1/4.*(y.^2)+3));
       dy = (-cos(1/2.*(x.^2)-1/4.*(y.^2)+3)*(2/4.*y).*cos(2.*x+1+exp(y)))-(sin(2*x+1+exp(y))*exp(y)*sin(1/2.*(x.^2)-1/4.*(y.^2)+3));
       aux = sol;
       sol = aux - 0.01 * [dx;dy];
       plot([aux(1) sol(1)],[aux(2) sol(2)],'r', 'LineWidth',3)
       iterationsB = iterationsB+1;
       if(abs(aux-sol) < 0.0008)%if the current step defferentiates 0.0008 of the previus one, 
           cont = cont+1;%the cont is incresead
       else
           cont = 0;
       end;
       pause(0.05)
end;
iterationsB %With 0.01 of Ratio of learning needs 673 iterations.
sol


%C

[x,y]=meshgrid(-1:0.01:1,-1:0.01:1);
z =sin(1/2.*(x.^2)-1/4.*(y.^2)+3).*cos(2*x+1+exp(y));

cont = 0;
aux = 0; %Aux store the value of the direction in the instant n-1. At the beginning the value is 0.
iterationsC = 0;
sol = [0.5,0]';%Start point
subplot(2,2,3),pcolor(x,y,z),shading flat;hold on;
while(cont <= 5 && iterationsC <= 250) %To stop the loop. cont will determine when it has to stop. (When the minimun ranges in very small values)
       x=sol(1);
       y=sol(2);
       dx = (cos(1/2.*(x.^2)-1/4.*(y.^2)+3)*x.*cos(2.*x+1+exp(y)))-(sin(2*x+1+exp(y))*2*sin(1/2.*(x.^2)-1/4.*(y.^2)+3));
       dy = (-cos(1/2.*(x.^2)-1/4.*(y.^2)+3)*(2/4.*y).*cos(2.*x+1+exp(y)))-(sin(2*x+1+exp(y))*exp(y)*sin(1/2.*(x.^2)-1/4.*(y.^2)+3));
       aux = sol;
       sol = aux - 1 * [dx;dy];
       plot([aux(1) sol(1)],[aux(2) sol(2)],'r', 'LineWidth',3)
       iterationsC = iterationsC+1;
       if(abs(aux-sol) < 0.01)%if the current step defferentiates 0.01 of the previus one, 
           cont = cont+1;%the cont is incresead
       else
           cont = 0;
       end;
       pause(0.05)
end;
iterationsC
%The algorithm can't find the minimum because the ratio of learning is so
%big, so if i don't determine a maximum number of iterations, the algorithm
%never ends.
sol


%D

[x,y]=meshgrid(-1:0.01:1,-1:0.01:1);
z =sin(1/2.*(x.^2)-1/4.*(y.^2)+3).*cos(2*x+1+exp(y));

cont = 0;
aux = 0; %Aux store the value of the direction in the instant n-1. At the beginning the value is 0.
iterationsD = 0;
sol = [0.5,0]';%Start point
subplot(2,2,4),pcolor(x,y,z),shading flat;hold on;
while(cont <= 5) %To stop the loop. cont will determine when it has to stop. (When the minimun ranges in very small values)
       x=sol(1);
       y=sol(2);
       dx = (cos(1/2.*(x.^2)-1/4.*(y.^2)+3)*x.*cos(2.*x+1+exp(y)))-(sin(2*x+1+exp(y))*2*sin(1/2.*(x.^2)-1/4.*(y.^2)+3));
       dy = (-cos(1/2.*(x.^2)-1/4.*(y.^2)+3)*(2/4.*y).*cos(2.*x+1+exp(y)))-(sin(2*x+1+exp(y))*exp(y)*sin(1/2.*(x.^2)-1/4.*(y.^2)+3));
       aux = sol;
       sol = aux - 0.3 * [dx;dy];
       plot([aux(1) sol(1)],[aux(2) sol(2)],'r', 'LineWidth',3)
       iterationsD = iterationsD+1;
       if(abs(aux-sol) < 0.01)%if the current step defferentiates 0.01 of the previus one, 
           cont = cont+1;%the cont is incresead
       else
           cont = 0;
       end;
       pause(0.05)
end;
iterationsD %With 0.25 of ratio of learning nedds only 34 iterations.
%I ithnk that the best value is beteewn the fastest and the one than
%doesn't end. And then think in an average. When i try with 0.5 (the average),
%the step's still very big. Then i try with 0.25 of ratio of learning.
sol


%Exercise 2
[x,y]=meshgrid(-10:0.01:10,-10:0.01:10);
z = 100*(x.^2 - y.^2)+(1+x).^2;
cont = 0;
aux = 0; %Aux store the value of the direction in the instant n-1. At the beginning the value is 0.
iterations2 = 0;
sol = [10, 10]';%Start point
figure, pcolor(x,y,z),shading flat;hold on;
while(cont <= 5)    
       x=sol(1);
       y=sol(2);
       dx = 100*2*x+2*(x+1);
       dy = 100*2*y;       
       dxx = 200*2+2;         dxy = 0;
       dyx = 0;                     dyy = 200*2;       
       H = [dxx dxy;dyx dyy];      
       aux = sol;
       sol = aux - 0.1 * inv(H)  * ([dx;dy]);       
       plot([aux(1) sol(1)],[aux(2) sol(2)],'r')
       pause (0.05);
       iterations2 = iterations2+1;
       if(abs(aux-sol) < 0.001)%if the current step defferentiates 0.001 of the previus one, 
           cont = cont+1;%the cont is incresead
       else
           cont = 0;
       end;
       pause(0.05)
end;
iterations2
sol


