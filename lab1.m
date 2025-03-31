a = 1;
b = 2;

c1 = a + b;
c2 = a - b;
c3 = a * b;
c4 = a / b;
c5 = a^b;
c6 = sqrt(b);

disp(1);
disp(c4);

stringa_prodotto = "il prodotto tra a e b è: %2.3f";
fprintf(stringa_prodotto, c3);

%%
clear all
clc

a = 1 + i;
b = 3 + 4i;
c = complex(10, 11);
d = exp(i*pi/4);
e = i^2;
f = sqrt(-1);

somma = a + b;
modulo_a = abs(a);
fase_a = angle(a);
coniugato_a = conj(a);
reale_d = real(d);
immaginaria_d = imag(d);

%%
clear all
clc

a = 57;
b = 30;

if(a == b)
    fprintf("a e b sono uguali");
else
    fprintf("a e b sono diversi");
end

% if(a > b)
%     fprintf("a maggiore di b");
% else if (a < b)
%     fprintf("a minore di b");
% else 
%     fprintf("a uguale a b");
% end

% if(mod(a,2))==0)
%     fprintf("\na è pari");
% end

if(a > 10 & b > 10)
    fprintf("\n sia a che be sono maggiori di 10")
end

%%
clc
clear all

n = 5;
s = 0;
i = 1;
step = 1;

for z=1:step:n
    s = s + 10;
    fprintf("iterazione n° %d, s = %2.1f \n", i, s);
    i = i + 1;
end

%%
n = 5;
s = 0;
i = 1;
z = 1;
step = 1;

while (z <= n)
    s = s + 10;
    fprintf("Iterazione n° %d, s = %1.2f \n", i, s);
    i = i + 1;
    z = z + step;
end

%%
clc 
clear all

v = [10,20,30,40]; %i vettori partono dall'indice 1
disp(v(1));
disp(v(end));
disp(v(2:end));

m = [10,20, 30; 40, 50, 60; 70, 80, 90]; %per cambiare riga della matrice mettere ";"
disp(m);
disp(m(1,3));

disp(m(1,:));
disp(m(:,3));

%%
clc
clear all

f1 = 5; %Hz
f2 = 10; %Hz
t_inizio = 0;%s
t_fine = 1;%s

fs = 10000;
ts = 1 / fs;

t = [t_inizio:ts:t_fine]; %crea un vettore da t_inizio a t_fine, incrementando t_inizio ogni volta di ts fino a t_fine
y1 = sin(2*pi*f1*t);
y2 = cos(2*pi*f2*t);

figure;
plot(t, y1, 'o')
xlabel("tempo [s]");%nomina gli assi
ylabel("ampiezza");
title("sinusoide");
grid on %mette le griglie
hold on % sovrappone i due grafici nella stessa figura
plot(t, y2, 'o')

