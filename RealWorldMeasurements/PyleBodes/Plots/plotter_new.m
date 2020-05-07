% Import CSVs
s3_ca = readmatrix('/Users/sujit/Documents/UNIVERSITY/3rd Year Project/git/3rd-year-project/RealWorldMeasurements/PyleBodes/CSV/Speaker 3 - Channel a_2019-11-20T00_38_57.csv');
s3_cb = readmatrix('/Users/sujit/Documents/UNIVERSITY/3rd Year Project/git/3rd-year-project/RealWorldMeasurements/PyleBodes/CSV/Speaker 3 - Channel b_2019-11-20T00_39_08.csv');
s3_p = readmatrix('/Users/sujit/Documents/UNIVERSITY/3rd Year Project/git/3rd-year-project/RealWorldMeasurements/PyleBodes/CSV/Speaker 3  - Anti-Parallel_2019-11-20T00_36_58.csv');

% Remove unecessary data
s3_ca = s3_ca([1:2482],[1 4 7]);
s3_cb = s3_cb([1:2482],[1 4 7]);
s3_p = s3_p(:,[1 4 7]);

%%%%%%%%%%% Plots %%%%%%%%%%%
% IEEE-friendly Appearance
set(0,'defaultAxesFontName','Times New Roman');
set(0,'defaultTextFontName','Times New Roman');
set(0,'defaultLegendFontName','Times New Roman');
set(0,'defaultAxesGridLineStyle','-');
set(0,'defaultAxesFontSize',14);

s3_imp = figure;
semilogx(s3_ca(:,1),s3_ca(:,2),'r');
hold on;
semilogx(s3_cb(:,1),s3_cb(:,2),'b');
grid on;
axis square;
title('PLPW6D Coil Impedance Comparison');
xlabel('Frequency / Hz');
ylabel('Impedance / \Omega');
legend('Coil A','Coil B');
exportgraphics(s3_imp,'s3_imp_comps.png','Resolution',600');

s3_phase = figure;
semilogx(s3_ca(:,1),s3_ca(:,3),'r');
hold on;
semilogx(s3_cb(:,1),s3_cb(:,3),'b');
grid on;
axis square;
title('PLPW6D Coil Phase Comparison');
xlabel('Frequency / Hz');
ylabel('Phase / degrees');
legend('Coil A','Coil B');
exportgraphics(s3_phase,'s3_phase_comps.png','Resolution',600');

s3_parallel = figure;
semilogx(s3_p(:,1),s3_p(:,2),'r');
grid on;
axis square;
title('PLPW6D Coil Linkage');
xlabel('Frequency / Hz');
ylabel('Impedance / \Omega');
exportgraphics(s3_parallel,'s3_coil_link.png','Resolution',600');
