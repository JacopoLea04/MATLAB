clear all, clf

T = 1e-3 % s
N = 100
N1 = 3
A = 2 % V

t = (0:N-1)*T
x = A*(t <= N1*T)

%return

subplot(2,2,1)
stem(t,x)
xlabel('t[s]')
ylabel('x(t) [V]')

%return

Fp = 1/T
F = Fp/N
f = (0:N-1)*F
X = fft(x)

subplot(2,2,2)
plot(f,real(X), 'r', f, imag(X), 'm')
xlabel('f [Hz]')
ylabel('X(f) [Vs]')
legend('Re X', 'Im X')

%return

df = 1 % Hz
fa = 0:df:Fp
Xa = A*T*(exp(-i*2*pi*fa*T*(N1+1))-1) ./ (exp(-i*2*pi*fa*T)-1)

subplot(2,2,4)
plot(fa,real(Xa),'r',fa,imag(Xa),'m')
xlabel('f [Hz]')
ylabel('X(f) [Vs]')
legend('Re X', 'Im X')

