% Ejercicio 1
x = 0:0.05:(2-0.05);
x2 = 2:0.01:(4-0.01);

plot([x x2],[(x*2-x+3.2) (2*x2+1.2)]);


% Ejercicio 2
x3 = -5:0.02:5;
y = x3*2-3*x3-2;
z = x3*3-2*x3+1;

figure, subplot(1,2,1), plot(x3, y,'g-'),
hold on, plot(2,1,'r+');
subplot(1,2,2), plot(x3,z,'b--'),
hold on,plot(2,1,'r+');
hold off;

%Ejercicio 3
I = imread('spine.tif');
figure, subimage(I);

IR = imnoise(I, 'salt & pepper', 0.1);
figure, subimage(IR);

figure, subplot(1,2,1), subimage(imfilter(IR, fspecial('average'))), title('Media');
subplot(1,2,2), subimage(medfilt2(IR)), title('Mediana');
% El mejor filtro para atenuar el ruido sal y pimienta es el de la mediana.

% Ejercicio 4
F = imread('peppers.png');
figure, subimage(F);

FG = rgb2gray(F);

FR = imnoise(FG, 'gaussian');
figure, subimage(FR);

figure, subplot(1,2,1), subimage(imfilter(FR, fspecial('average'))), title('Media');
subplot(1,2,2), subimage(medfilt2(FR)), title('Mediana');
% Para este tipo de ruido no hay mucha diferencia entre ambos filtros.

figure, subplot(1,2,1), imhist(imfilter(FR, fspecial('average'))), title('Media');
subplot(1,2,2), imhist(medfilt2(FR)), title('Mediana');
% Sus histogramas son muy parecidos.