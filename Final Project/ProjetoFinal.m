%% Projeto Final - Algoritmos Genéticos
% Otimização SNR

%% Sinal Bruto - encontrar um sinal de funcione peguei um sinal ECG

%% Sinal Original
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

%Espectro calculado em 2 lados (P2) e avaliados de acordo com o tamanho L do
%sinal
P2 = abs(FFT/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

%Gráfico da Densidade Espectral do Sinal
%Definindo a frequência e plotando a amplitude do espectro em um lado P1
f = Fs*(0:(L/2))/L;
figure(2);
plot(f,P1);
xlabel ('Frequência(Hz)');
ylabel ('Densidade Espectral de Potência (PSD)');
title(' Análise Espectral do Sinal Original'); 

% Filtrar inversamente o sinal e coletar ruidos

%% Filtro Passa-Baixas - para ruídos abaixo do sinal de interesse

wp = 5/250;
ws = 2/250; 
rp = 3;
rs = 40;
[n,Wn] = buttord(wp,ws,rp,rs);
[b,a] = butter(n,Wn, 'low');
ruido_baixo = filter(b,a,A);

%Gráfico do sinal ECG Filtrado Passa-Baixas
figure(3);
plot(t, ruido_baixo,'-');
legend('ECG Filtrado Passa-Baixas');
xlabel('Tempo (s)');
ylabel('Amplitude (mV)');
title('Sinal ECG Filtrado Passa-Baixas');

%Fast Fourier Transform do sinal após PB
FFT_1 = fft(ruido_baixo);

%Espectro calculado em 2 lados (P2_1) e avaliados de acordo com o tamanho L do
%sinal
P2_1 = abs(FFT_1/L);
P1_1 = P2_1(1:L/2+1);
P1_1(2:end-1) = 2*P1_1(2:end-1);

%Gráfico da Densidade Espectral do Sinal
%Definindo a frequência e plotando a amplitude do espectro em um lado P1_1
f = Fs*(0:(L/2))/L;
figure(4);
plot(f,P1_1);
xlabel ('Frequência(Hz)');
ylabel ('Densidade Espectral de Potência (PSD)');


%% Filtro Passa-Altas - para ruídos acima do sinal de interesse

wp = 75/250;
ws = 100/250; 
rp = 3;
rs = 40;
[n_high,Wn_high] = buttord(wp,ws,rp,rs);
[b,a] = butter(n_high,Wn_high, 'high');
ruido_alto = filter(b,a,A);

%Gráfico do sinal ECG Filtrado Passa-Baixas
figure(3);
plot(t,ruido_alto,'-');
legend('ECG Filtrado Passa-Baixas');
xlabel('Tempo (s)');
ylabel('Amplitude (mV)');
title('Sinal ECG Filtrado Passa-Baixas');

%Fast Fourier Transform do sinal após PB
FFT_2 = fft(ruido_alto);

%Espectro calculado em 2 lados (P2_1) e avaliados de acordo com o tamanho L do
%sinal
P2_2 = abs(FFT_2/L);
P1_2 = P2_2(1:L/2+1);
P1_2(2:end-1) = 2*P1_2(2:end-1);

%Gráfico da Densidade Espectral do Sinal
%Definindo a frequência e plotando a amplitude do espectro em um lado P1_1
f = Fs*(0:(L/2))/L;
figure(4);
plot(f,P1_2);
xlabel ('Frequência(Hz)');
ylabel ('Densidade Espectral de Potência (PSD)');

%% Filtro Notch - ao contrario

%% Filtro Notch - não está dando certo

% A partir das contas realizadas à mão, encontrou-se a Função de
% Transferência H(z) do Filtro Notch 
% a_notch = [0.382];
% b_notch = [1 -1.618 1];
% ruido_rede = filter(b_notch,a_notch,signal);

%% Filtro Notch - coletando ruido de rede

% A partir das contas realizadas à mão, encontrou-se a Função de
% Transferência H(z) do Filtro Notch 
w0 = 0.2014; % frequência de ruído atenuado em 50.35 Hz
bw = w0/35;
[b_notch,a_notch] = iirnotch(w0,bw); 
sinal_filtrado = filter(b_notch,a_notch,A);
ruido_rede = A - sinal_filtrado;

%Gráfico do sinal ECG Filtrado Passa-Baixas e Passa-Altas
figure(7);
plot(t,ruido_rede,'-');
legend('ECG Filtrado Final');
xlabel('Tempo (s)');
ylabel('Amplitude (mV)');
title('Sinal ECG Filtrado Final');

%Fast Fourier Transform do sinal final
FFT_3 = fft(ruido_rede);

%Espectro calculado em 2 lados (P2_3) e avaliados de acordo com o tamanho L do
%sinal
P2_3 = abs(FFT_3/L);
P1_3 = P2_3(1:L/2+1);
P1_3(2:end-1) = 2*P1_3(2:end-1);

% Gráfico da Densidade Espectral do Sinal
%Definindo a frequência e plotando a amplitude do espectro em um lado P1_3
f = Fs*(0:(L/2))/L;
figure(8);
plot(f,P1_3);
xlabel ('Frequncia(Hz)');
ylabel ('Densidade Espectral de Potencia (PSD)');

%% Ruídos

Ruidos = ruido_baixo + ruido_alto + ruido_rede;
plot(t,Ruidos);

%Fast Fourier Transform do sinal Original
FFT_4 = fft(Ruidos);

%Espectro calculado em 2 lados (P2) e avaliados de acordo com o tamanho L do
%sinal
P2_4 = abs(FFT_4/L);
P1_4 = P2(1:L/2+1);
P1_4(2:end-1) = 2*P1_4(2:end-1);

%Gráfico da Densidade Espectral do Sinal
%Definindo a frequência e plotando a amplitude do espectro em um lado P1
f = Fs*(0:(L/2))/L;
plot(f,P1_4);
xlabel ('Frequência(Hz)');
ylabel ('Densidade Espectral de Potência (PSD)');
title(' Análise Espectral do Sinal Original'); 

plot(t, ruido_baixo);

%% estimar coeficientes dos ruidos do sinal devem possuir coef reais e imaginarias e calcular o vetor

%% adicionar ao sinal filtrado
%% comparação original e estimativa = minimização desta diferença 
%% apresentar a melhor estimativa dos ruidos