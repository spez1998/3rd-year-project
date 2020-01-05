load('pyle_magnitude_comparisons');
figure
ax = gca;
semilogx(um_f,um_p,'g')
hold on;
semilogx(m_f,m_p,'r')
hold on;
semilogx(lt_m_f,lt_m_p,'b')
title('Comparison of Unmounted and Mounted Pyle PLPW6D Phase Responses');
xlabel('Frequency / Hz');
ylabel('Magnitude / dB');
legend('Unmounted','Mounted','Mounted and Linkwitz Transformed')

