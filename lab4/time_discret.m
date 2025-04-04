%%
clc
clear all
close all

T = 2; %s
nT = (-10:T:50);

alpha = 0.9;
f = 1/12; %Hz
x = (nT >= 0) .* ((alpha.^nT)) .* exp(1j * 2 * pi * f * nT);

k = 5;
nT_traslato = nT -k;
x_traslato = (nT_traslato >= 0) .* ((alpha.^nT_traslato) .* exp(1j *2 * pi * f *));

x_reale = real(x);
x_immaginaria = imag(x);
x_modulo = abs(x);
x_fase = angle(x);

figure;
subplot(2,2,1);
stem(nT, x_reale, "filled", 'DisplayName', 'Parte Reale');
grid on
xlabel('nT [secondi]');
ylabel('Ampiezza');
legend;

subplot(2,2,2);
stem(nT, x_immaginaria, "filled", 'DisplayName', 'Parte Immaginaria');
grid on
xlabel('nT [secondi]');
ylabel('Ampiezza');
legend;

subplot(2,2,3);
stem(nT, x_modulo, "filled", 'DisplayName', 'Modulo');
grid on
xlabel('nT [secondi]');
ylabel('Ampiezza');
legend;

subplot(2,2,4);
stem(nT, x_fase, "filled", 'DisplayName', 'Fase');
grid on
xlabel('nT [secondi]');
ylabel('Ampiezza');
legend;

subplot(2,2,1);
stem(nT, real(x_traslato), "filled", 'DisplayName', 'Parte Reale');
grid on
xlabel('nT [secondi]');
ylabel('Ampiezza');
legend;

subplot(2,2,2);
stem(nT, imag(x_traslato), "filled", 'DisplayName', 'Parte Immaginaria');
grid on
xlabel('nT [secondi]');
ylabel('Ampiezza');
legend;

subplot(2,2,3);
stem(nT, mod(x_traslato), "filled", 'DisplayName', 'Modulo');
grid on
xlabel('nT [secondi]');
ylabel('Ampiezza');
legend;

subplot(2,2,4);
stem(nT, angle(x_traslato), "filled", 'DisplayName', 'Fase');
grid on
xlabel('nT [secondi]');
ylabel('Ampiezza');
legend;

energia_segnale = T*sum(abs(x).^2);

%%
clc
clear all
close all

T = 1;
nT = [-20:T:20]; %s

f = 1/20; %Hz
x = cos(2*pi*f*nT);

figure;
stem(nT,x, 'filled');
grid on
xlabel('Time [s]');
ylabel('Ampiezza');

Tp = 1/f;
campioni_per_periodo = floor(Tp/T);
E_periodo = T*sum(abs(x(1:campioni_per_periodo)).^2);

%%
clc
clear all
close all

T = 1;
Np = 10;

t = T*(-floor(Np/2) : floor((Np-1)/2));

D = 0.5;
I_rect = round(D*Np);

x = zeros(1,Np);
start_idx = ceil((Np-I_rect)/2) +1;
x(start_idx : start_idx + I_rect -1) = 1;

h = x;

% figure
% stem(t,x,'filled');
% xlabel('nT [s]');
% grid on
% ylim([0 1.2]);
% 
% figure
% stem(t,h,'filled');
% xlabel('nT [s]');
% grid on
% ylim([0 1.2]);

y = T*conv(x,h);
Ly = length(y);

t_y = (2*t(1) + T*(0:Ly-1));

% figure
% stem(t_y,y,'filled');
% xlabel('nT [s]');
% grid on
% title('convoluzione');

N_periodi = 7;

x_p = repmat(x, 1, N_periodi);
h_p = repmat(h, 1, N_periodi);

t_p = [];
for k = -floor(N_periodi/2) : floor((N_periodi-1)/2);
    t_p = [t_p, t + k*Np];
end


figure
stem(t_p,x_p,'filled');
xlabel('nT [s]');
ylabel('Ampiezza');
grid on
ylim([0 1.2]);

figure
stem(t_p,h_p,'filled');
xlabel('nT [s]');
ylabel('Ampiezza');
grid on
ylim([0 1.2]);

y_p = T*conv(x_p, h_p);
Ly_p = length(y_p);
t_y_p = t_p(1) + t_p(1) + T*(0:Ly_p-1);


figure
stem(t_y_p,y_p,'filled');
xlabel('nT [s]');
ylabel('Ampiezza');
title('Convoluzione dei segnali periodici');
grid on

h_rep2 = repmat(h, 1, 2);
y_rep2 = T*conv(x, h_rep2);

t_h_rep2 = [];
for k = -floor(2/2) : floor((2-1)/2);
    t_h_rep2 = [t_p, t + k*Np];
end

t_y_rep2 = t(1) + t_h_rep2(1) + T*[0 : length(y_rep2)-1];

figure;
stem(t_y_rep2, y_rep2, 'filled');

[y_p_c, t_y_p_c] = convoluzione-periodica_discreta(x, h, T, 6);

figure
stem(t_y_p_c,y_p_c,'filled');
xlabel('nT [s]');
grid on
