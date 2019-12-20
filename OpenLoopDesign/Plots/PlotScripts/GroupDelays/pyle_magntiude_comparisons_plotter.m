load('pyle_magnitude_comparisons');
figure
ax = gca;
semilogx(um_f,um_m,'g')
hold on;
semilogx(m_f,m_m,'r')
hold on;
semilogx(lt_m_f,lt_m_m,'b')
title('Comparison of Unmounted and Mounted Pyle PLPW6D Responses');
xlabel('Frequency / Hz');
ylabel('Magnitude / dB');
legend('Unmounted','Mounted','Mounted and Linkwitz Transformed')


