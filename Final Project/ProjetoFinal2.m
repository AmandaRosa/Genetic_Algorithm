% Projeto Final 2 - Algoritmos Genéticos
% Nome: Amanda Rosa F. Jorge

% Filtrar o sinal normalmente e depois subtrair do sinal total e coletar
% ruidos

file = 'C:\Users\amand\OneDrive\Documentos\MATLAB\Analise de sinais\1 Trabalho\signal.txt';

signal = fopen(file,'r');

A = fscanf(signal,'%f');

%Definições do sinal
Fs = 500; %frequencia de amostragem
T = 1/Fs; %periodo
L = 10000; %tamanho do sinal em amostras
t = (0:L-1)*T;  % Time vector

%Gráfico do sinal ECG original
figure();
plot(t,A,'-');
legend('ECG signal Original');
xlabel('Tempo (s)');
ylabel('Amplitude (mV)');
title(' sinal ECG Original');

%Fast Fourier Transform do sinal Original
FFT = fft(A);

%Compute the two-sided spectrum P2. Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2 = abs(FFT/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

%Define the frequency domain f and plot the single-sided amplitude spectrum P1. 
%The amplitudes are not exactly at 0.7 and 1, as expected, because of the added noise. On average, longer signals produce better frequency approximations
f = Fs*(0:(L/2))/L;
figure();
plot(f,P1);
xlabel ('Frequência(Hz)');
ylabel ('Densidade Espectral de Potência (PSD)');
title(' Análise Espectral do Sinal Original');


%% Filtro Passa-Baixas

wp = 45/250;
ws = 140/250; 
rp = 3;
rs = 40;
[n,Wn] = buttord(wp,ws,rp,rs);
[b,a] = butter(n,Wn, 'low');
dataOut = filter(b,a,A);

%Gráfico do sinal ECG Filtrado Passa-Baixas
figure();
plot(t,dataOut,'-');
legend('ECG Filtrado Passa-Baixas');
xlabel('Tempo (s)');
ylabel('Amplitude (mV)');
title('Sinal ECG Filtrado Passa-Baixas');

%Compute the Fourier transform of the signal
FFT_a = fft(dataOut);

%Compute the two-sided spectrum P2. Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2_a = abs(FFT_a/L);
P1_a = P2_a(1:L/2+1);
P1_a(2:end-1) = 2*P1_a(2:end-1);

%Define the frequency domain f and plot the single-sided amplitude spectrum P1. 
%The amplitudes are not exactly at 0.7 and 1, as expected, because of the added noise. On average, longer signals produce better frequency approximations
f = Fs*(0:(L/2))/L;
figure();
plot(f,P1_a);
xlabel ('Frequência(Hz)');
ylabel ('Densidade Espectral de Potência (PSD)');


%% Filtro Passa-Altas

wp_h = 0.55/250;
ws_h = 0.1/250; 
rp_h = 3;
rs_h = 40;
[n_high,Wn_high] = buttord(wp_h,ws_h,rp_h,rs_h);
[b_high,a_high] = butter(n_high,Wn_high, 'high'); 
dataOut2 = filter(b_high,a_high,dataOut);

%Gráfico do sinal ECG Filtrado Passa-Baixas e Passa-Altas
figure();
plot(t,dataOut2,'-');
legend('ECG Filtrado Passa-Baixas e Passa-Altas');
xlabel('Tempo (s)');
ylabel('Amplitude (mV)');
title('Sinal ECG Filtrado Passa-Baixas e Passa-Altas');
ylim([-2 2]);
xlim([0 10]);

%Fast Fourier Transform do sinal após PB e PA
FFT_2 = fft(dataOut2);

%Compute the two-sided spectrum P2. Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2_2 = abs(FFT_2/L);
P1_2 = P2_2(1:L/2+1);
P1_2(2:end-1) = 2*P1_2(2:end-1);

%Define the frequency domain f and plot the single-sided amplitude spectrum P1. 
%The amplitudes are not exactly at 0.7 and 1, as expected, because of the added noise. On average, longer signals produce better frequency approximations
f = Fs*(0:(L/2))/L;
figure();
plot(f,P1_2);
xlabel ('Frequência(Hz)');
ylabel ('Densidade Espectral de Potência (PSD)');


%% Filtro Notch

% A partir das contas realizadas à mão, encontrou-se a Função de
% Transferência H(z) do Filtro Notch 
w0 = 0.2014; % frequência de ruído atenuado em 50.35 Hz
bw = w0/35;
[b_notch,a_notch] = iirnotch(w0,bw); %EXPLICAR
dataOut3 = filter(b_notch,a_notch,dataOut2);
% a_notch = [0.382];
% b_notch = [1 -1.618 1];
% dataOut3 = filter(b_notch,a_notch,dataOut2);

%Gráfico do sinal ECG Filtrado Passa-Baixas e Passa-Altas
figure();
plot(t,dataOut3,'-');
legend('ECG Filtrado Final');
xlabel('Tempo (s)');
ylabel('Amplitude (mV)');
title('Sinal ECG Filtrado Final');
ylim([-2 2]);
xlim([0 10]);

%Fast Fourier Transform do sinal final
FFT_3 = fft(dataOut3);

%Compute the two-sided spectrum P2. Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2_3 = abs(FFT_3/L);
P1_3 = P2_3(1:L/2+1);
P1_3(2:end-1) = 2*P1_3(2:end-1);

%Define the frequency domain f and plot the single-sided amplitude spectrum P1. 
%The amplitudes are not exactly at 0.7 and 1, as expected, because of the added noise. On average, longer signals produce better frequency approximations
f = Fs*(0:(L/2))/L;
figure();
plot(f,P1_3);
xlabel ('Frequncia(Hz)');
ylabel ('Densidade Espectral de Potencia (PSD)');

%% Ruidos

ruidos = A - dataOut3;
plot(t, ruidos);

%Fast Fourier Transform do sinal final
FFT_4 = fft(ruidos);

%Compute the two-sided spectrum P2. Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L
P2_4 = abs(FFT_4/L);
P1_4 = P2_4(1:L/2+1);
P1_4(2:end-1) = 2*P1_4(2:end-1);

%Define the frequency domain f and plot the single-sided amplitude spectrum P1. 
%The amplitudes are not exactly at 0.7 and 1, as expected, because of the added noise. On average, longer signals produce better frequency approximations
f = Fs*(0:(L/2))/L;
figure();
plot(f,P1_4);
xlabel ('Frequncia(Hz)');
ylabel ('Densidade Espectral de Potencia (PSD)');

%% Encontrando os máximos locais

[pks,locs,w,p] = findpeaks(P1_4,f, 'MinPeakDistance', 0.66);

%% quais faixas de frequências apresentam maior potencia?
%% estimar coeficientes dos ruidos do sinal devem possuir coef reais e imaginarias e calcular o vetor
%% adicionar ao sinal filtrado
%% comparação original e estimativa = minimização desta diferença 
%% apresentar a melhor estimativa dos ruidos