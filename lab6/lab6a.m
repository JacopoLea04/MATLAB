clear all, clf

T = 1e-3 % s
N = 1000
N1 = 11
A = 2 % V

t = (-N/2:N/2-1)*T
T1 = N1*T
x = A*(abs(t) < T1/2)

%return

subplot(2,2,1)
stem(t,x)
xlabel('t[s]')
ylabel('x(t) [V]')

%return

Fp = 1/T
F = Fp/N
f = (0:N-1)*F
x1 = [x(N/2+1:N), x(1:N/2)]
X = T*fft(x1)

subplot(2,2,2)
% plot(f,abs(X), 'b', f, angle(X), 'g')
plot(f,abs(X), 'b')
xlabel('f [Hz]')
ylabel('X(f) [Vs]')
legend('|X|', 'arg X')

%return

df = 1 % Hz
fa = 0:df:Fp
Xa = A*T*(exp(-i*2*pi*fa*T*(N1+1))-1) ./ (exp(-i*2*pi*fa*T)-1)

subplot(2,2,4)
plot(fa,real(Xa),'r',fa,imag(Xa),'m')
xlabel('f [Hz]')
ylabel('X(f) [Vs]')
legend('X', 'arg X')
