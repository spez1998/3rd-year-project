% MAGNITUDE COMPARISON PLOT %
figure
ax = gca;
semilogx(a_freq,a_mag,'r')
hold on;
semilogx(b_freq,b_mag,'b')
title('Comparison of Speaker 3 Voice Coils Impedances');
xlabel('Frequency / Hz');
ylabel('Impedance / \Omega');
legend('Channel A','Channel B');

% PHASE COMPARISON PLOT %
figure
ax = gca;
semilogx(a_freq,a_ph,'r')
hold on;
semilogx(b_freq,b_ph,'b')
title('Comparison of Speaker 3 Voice Coils Phase Responses');
xlabel('Frequency / Hz');
ylabel('Phase / Degrees');
legend('Channel A','Channel B');

% INDIVIDUAL GRAPHS %
figure
subplot(2,1,1)
ax = gca;
semilogx(a_freq,a_mag,'r');
xlabel('Frequency / Hz');
ylabel('Impedance / \Omega');
title('Speaker 3 Channel A Impedances and Phase Responses');
hold on;
subplot(2,1,2)
semilogx(a_freq,a_ph,'b');
xlabel('Frequency / Hz');
ylabel('Phase / Degrees');

figure
subplot(2,1,1)
ax = gca;
semilogx(b_freq,b_mag,'r');
xlabel('Frequency / Hz');
ylabel('Impedance / \Omega');
title('Speaker 3 Channel B Impedances and Phase Responses');
hold on;
subplot(2,1,2)
semilogx(b_freq,b_ph,'b');
xlabel('Frequency / Hz');
ylabel('Phase / Degrees');
