% Projeto Final 2 - Algoritmos Gen?ticos
% Nome: Amanda Rosa F. Jorge

% Filtrar o sinal normalmente e depois subtrair do sinal total e coletar
% ruidos

file = 'C:\Users\amand\OneDrive\Documentos\MATLAB\Analise de sinais\1 Trabalho\signal.txt';

signal = fopen(file,'r');

A = fscanf(signal,'%f');

%Defini??es do sinal
Fs = 500; %frequencia de amostragem
T = 1/Fs; %periodo
L = 10000; %tamanho do sinal em amostras
t = (0:L-1)*T;  % Time vector

%Gr?fico do sinal ECG original
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
xlabel ('Frequ?ncia(Hz)');
ylabel ('Densidade Espectral de Pot?ncia (PSD)');
title(' An?lise Espectral do Sinal Original');


%% Filtro Passa-Baixas

wp = 45/250;
ws = 140/250; 
rp = 3;
rs = 40;
[n,Wn] = buttord(wp,ws,rp,rs);
[b,a] = butter(n,Wn, 'low');
dataOut = filter(b,a,A);

%Gr?fico do sinal ECG Filtrado Passa-Baixas
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
xlabel ('Frequ?ncia(Hz)');
ylabel ('Densidade Espectral de Pot?ncia (PSD)');


%% Filtro Passa-Altas

wp_h = 0.55/250;
ws_h = 0.1/250; 
rp_h = 3;
rs_h = 40;
[n_high,Wn_high] = buttord(wp_h,ws_h,rp_h,rs_h);
[b_high,a_high] = butter(n_high,Wn_high, 'high'); 
dataOut2 = filter(b_high,a_high,dataOut);

%Gr?fico do sinal ECG Filtrado Passa-Baixas e Passa-Altas
figure();
plot(t,dataOut2,'-');
legend('ECG Filtrado Passa-Baixas e Passa-Altas');
xlabel('Tempo (s)');
ylabel('Amplitude (mV)');
title('Sinal ECG Filtrado Passa-Baixas e Passa-Altas');
ylim([-2 2]);
xlim([0 10]);

%Fast Fourier Transform do sinal ap?s PB e PA
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
xlabel ('Frequ?ncia(Hz)');
ylabel ('Densidade Espectral de Pot?ncia (PSD)');


%% Filtro Notch

% A partir das contas realizadas ? m?o, encontrou-se a Fun??o de
% Transfer?ncia H(z) do Filtro Notch 
w0 = 0.2014; % frequ?ncia de ru?do atenuado em 50.35 Hz
bw = w0/35;
[b_notch,a_notch] = iirnotch(w0,bw); 
dataOut3 = filter(b_notch,a_notch,dataOut2);
% a_notch = [0.382];
% b_notch = [1 -1.618 1];
% dataOut3 = filter(b_notch,a_notch,dataOut2);

%Gr?fico do sinal ECG Filtrado Passa-Baixas e Passa-Altas
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

%% quais as potencias das faixas de frequ?ncias? 

freq_maxima = f(1,length(f)); %faixa = 250 Hz

% tem que ser normalizados para as amostras em que 5000 pontos ? 250 Hz

% ruidos de 0 a 10 Hz
f_0a10 = f(1,1:200);
p_0a10 = P1_4(1:200,1);
pot_0a10 = sum(p_0a10);
plot(f_0a10,p_0a10);

% este ruido est? em torno da amostras 1000

%ruidos de eletromagnetismo - 50 Hz
f_50 = f(1,970:1030);
p_50 = P1_4(970:1030,1);
pot_50 = sum(p_50);
plot(f_50,p_50);
% potencia50 = bandpower(p_50);

%fazer um for para quebrar de 50 em 50 Hz para altas frequ?ncias

%ruidos em alta frequencia - de 100 a 150
f_100a150 = f(1,2060:3000);
p_100a150 = P1_4(2060:3000,1);
pot_100a150 = sum(p_100a150);
plot(f_100a150,p_100a150);

%ruidos de 150 a 200
f_150a200 = f(1,3000:4000);
p_150a200 = P1_4(3000:4000,1);
pot_150a200 = sum(p_150a200);
plot(f_150a200,p_150a200);

%ruidos de 200 a 250
f_200a250 = f(1,4000:length(f));
p_200a250 = P1_4(4000:length(f),1);
pot_200a250 = sum(p_200a250);
plot(f_200a250,p_200a250);

pot_ruidos = sum(P1_4);
pot_sinalecg = sum(P1_3);
pot_sinalbruto = sum(P1);

% considerar a potencia total do ruido como sendo 1
% realizar AG para descobrir porcent. de contribui??o no ruido total de
% cada banda ou "tipo" de ruido

%% compara??o original e estimativa = minimiza??o desta diferen?a 

%fun??o aptid?o - caderno 

%% apresentar a melhor estimativa dos ruidos