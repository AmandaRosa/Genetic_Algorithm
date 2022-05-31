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
[b_notch,a_notch] = iirnotch(w0,bw); 
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

%% quais as potencias das faixas de frequências? 

freq_maxima = f(1,length(f)); %faixa = 250 Hz

% tem que ser normalizados para as amostras em que 5000 pontos é 250 Hz

% ruidos de 0 a 5 Hz
f_0a5 = f(1,1:100);
p_0a5 = P1_4(1:100,1);
potm_0a5 = bandpower(p_0a5,f_0a5,'psd');
% p_media_0a5 = mean(p_0a5);
pot_0a5 = sum(p_0a5);
% plot(f_0a5,p_0a5);

% ruidos de 5 a 20 Hz
f_5a20 = f(1,100:400);
p_5a20 = P1_4(100:400,1);
potm_5a20 = bandpower(p_5a20,f_5a20,'psd');
% p_media_5a20 = mean(p_5a20);
pot_5a20 = sum(p_5a20);
% plot(f_5a20,p_5a20);

% ruidos de 20 a 40 Hz
f_20a40 = f(1,400:800);
p_20a40 = P1_4(400:800,1);
potm_20a40 = bandpower(p_20a40,f_20a40,'psd');
% p_media_20a40 = mean(p_20a40);
pot_20a40 = sum(p_20a40);
% plot(f_20a40,p_20a40);

% ruidos de 40 a 50
f_40a50 = f(1,800:970);
p_40a50 = P1_4(800:970,1);
potm_40a50 = bandpower(p_40a50,f_40a50,'psd');
% p_media_40a50 = mean(p_40a50);
pot_40a50 = sum(p_40a50);
% plot(f_40a50,p_40a50);

% este ruido está em torno da amostras 1000

%ruidos de eletromagnetismo - 50 Hz
f_50 = f(1,970:1030);
p_50 = P1_4(970:1030,1);
potm_50 = bandpower(p_50,f_50,'psd');
% p_media_50 = mean(p_50);
pot_50 = sum(p_50);
% plot(f_50,p_50);
% potencia50 = bandpower(p_50);

%fazer um for para quebrar de 50 em 50 Hz para altas frequências

%ruidos de 50 a 100
f_50a100 = f(1,1030:2060);
p_50a100 = P1_4(1030:2060,1);
potm_50a100 = bandpower(p_50a100,f_50a100,'psd');
% p_media_50a100 = mean(p_50a100);
pot_50a100 = sum(p_50a100);
% plot(f_50a100,p_50a100);

%ruidos em alta frequencia - de 100 a 150
f_100a150 = f(1,2060:3000);
p_100a150 = P1_4(2060:3000,1);
potm_100a150 = bandpower(p_100a150,f_100a150,'psd');
% p_media_100a150 = mean(p_100a150);
pot_100a150 = sum(p_100a150);
% plot(f_100a150,p_100a150);

%ruidos de 150 a 200
f_150a200 = f(1,3000:4000);
p_150a200 = P1_4(3000:4000,1);
potm_150a200 = bandpower(p_150a200,f_150a200,'psd');
% p_media_150a200 = mean(p_150a200);
pot_150a200 = sum(p_150a200);
% plot(f_150a200,p_150a200);

%ruidos de 200 a 250
f_200a250 = f(1,4000:length(f));
p_200a250 = P1_4(4000:length(f),1);
potm_200a250 = bandpower(p_200a250,f_200a250,'psd');
% p_media_200a250 = mean(p_200a250);
pot_200a250 = sum(p_200a250);
% plot(f_200a250,p_200a250);

%será que esta correto esse formato de cálculo?
Pot_ruidos = bandpower(P1_4,f,'psd');
Pot_sinal = bandpower(P1_3,f,'psd');
% Pot_ruidos = sum(P1_4);
% Pot_sinalecg = sum(P1_3);
% Pot_sinalbruto = sum(P1);

%SNR

% SNR = pot_sinalecg/pot_ruidos;

%% Coeficientes Vetor Ruido

% considerar a potencia total do ruido como sendo a pot_ruidos
% Pot_ruidos = x'*p_0a5 + y'*p_5a20 + w'*p_20a40 + z'*p_40a50 + v'*p_50 +
% s'*p_50a100 + q'*p_150a200 + o'*p_200a250

%AG encontrar = [x' y' w' z' v' s' q' o']

% Matriz_potencias = [p_media_0a5 , p_media_5a20 , p_media_20a40, p_media_40a50, p_media_50 , p_media_50a100, p_media_100a150, p_media_150a200, p_media_200a250];

%Faixas de Frequencias
Matriz_potencias_totais = [pot_0a5 , pot_5a20 , pot_20a40, pot_40a50, pot_50 , pot_50a100, pot_100a150, pot_150a200, pot_200a250];
Matriz_potencias_medias = [potm_0a5 , potm_5a20 , potm_20a40, potm_40a50, potm_50 , potm_50a100, potm_100a150, potm_150a200, potm_200a250];

% realizar AG para descobrir porcent. de contribuição no ruido total de
% cada banda ou "tipo" de ruido

%Algoritmo Genético
% Vetor_coef = AlgoritmoAG_PF(Matriz_potencias, Pot_ruidos);
% Vetor = Vetor_coef./sum(Vetor_coef);

%Evolução Diferencial
%%função

%% apresentar a melhor estimativa dos ruidos