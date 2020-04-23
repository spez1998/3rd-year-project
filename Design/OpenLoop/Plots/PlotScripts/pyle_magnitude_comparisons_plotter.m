% LOAD SIM DATA %
load('pyle_sim_data');

% MAGNITUDE COMPARISON PLOT %
figure
ax = gca;
semilogx(um_f,um_m,'g')
hold on;
semilogx(m_f,m_m,'r')
hold on;
semilogx(lt_m_f,lt_m_m,'b')
title('Comparison of Unmounted and Mounted Pyle PLPW6D Magnitude Responses');
xlabel('Frequency / Hz');
ylabel('Magnitude / dB');
legend('Unmounted','Mounted','Mounted and Linkwitz Transformed')

% PHASE COMPARISON PLOT %
figure
ax = gca;
semilogx(um_f,um_p,'g')
hold on;
semilogx(m_f,m_p,'r')
hold on;
semilogx(lt_m_f,lt_m_p,'b')
title('Comparison of Unmounted and Mounted Pyle PLPW6D Phase Responses');
xlabel('Frequency / Hz');
ylabel('Phase / Degrees');
legend('Unmounted','Mounted','Mounted and Linkwitz Transformed')

% GROUP DELAYS %
% Use group delay function included in repo %
figure
ax = gca;
semilogx(um_f,um_g,'g')
hold on;
semilogx(m_f,m_g,'r')
hold on;
semilogx(lt_m_f,lt_m_g,'b')
title('Comparison of Unmounted and Mounted Pyle PLPW6D Group Delays');
xlabel('Frequency / Hz');
ylabel('Delay / s');
legend('Unmounted','Mounted','Mounted and Linkwitz Transformed')

% INDIVIDUAL GRAPHS %

% Magnitudes
figure
ax = gca;
semilogx(um_f,um_m,'g');
title('Pyle PLPW6D Magnitude Response');
xlabel('Frequency / Hz');
ylabel('Magnitude / dB');
figure
ax = gca;
semilogx(m_f,m_m,'r');
title('Pyle PLPW6D Magnitude Response, mounted in 5.7 litre box');
xlabel('Frequency / Hz');
ylabel('Magnitude / dB');
figure
ax = gca;
semilogx(lt_m_f,lt_m_m,'b')
title('Pyle PLPW6D Magnitude Response, mounted in 5.7 litre box, Linkwitz Transformed');
xlabel('Frequency / Hz');
ylabel('Magnitude / dB');

% Phases
figure
ax = gca;
semilogx(um_f,um_p,'g');
title('Pyle PLPW6D Phase Response');
xlabel('Frequency / Hz');
ylabel('Phase / Degrees');
figure
ax = gca;
semilogx(m_f,m_p,'r')
title('Pyle PLPW6D Phase Response, mounted in 5.7 litre box');
xlabel('Frequency / Hz');
ylabel('Phase / Degrees');
figure
ax = gca;
semilogx(lt_m_f,lt_m_p,'b')
title('Pyle PLPW6D Phase Response, mounted in 5.7 litre box, Linkwitz Transformed');
ylabel('Phase / Degrees');
