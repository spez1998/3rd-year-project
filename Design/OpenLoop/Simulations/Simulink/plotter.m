load('open_loop_sim_data.mat')

% IEEE-friendly Appearance
set(0,'defaultAxesFontName','Times New Roman');
set(0,'defaultTextFontName','Times New Roman');
set(0,'defaultLegendFontName','Times New Roman');
set(0,'defaultAxesGridLineStyle','-');
set(0,'defaultAxesFontSize',14);

% Time to frequency
freq = 10:0.01899810019:200;
freq = transpose(freq);

open_um = [open_um freq]
open_um_v_pks = findpeaks(open_um(:,8));
open_um_pks = open_um(ismember([open_um(:,8)],open_um_v_pks),:);
open_box_v_pks = findpeaks(open_box(:,8));
open_box_pks = open_box(ismember([open_box(:,8)],open_box_v_pks),:);
open_lt_v_pks = findpeaks(open_lt(:,8));
open_lt_pks = open_lt(ismember([open_lt(:,8)],open_lt_v_pks),:);

figure;
plot(open_um_pks(:,10),open_um_pks(:,8));
hold on;
plot(open_box_pks(:,1),open_box_pks(:,8));
plot(open_lt_pks(:,1),open_lt_pks(:,8));
axis square;
title('Compensator Comparison');
xlabel('Time / s');
ylabel('Voltage / V');
legend({'PLPW6D Freestanding','PLPW6D in Box','PLPW6D, Box, Linkwitz Transform'},'Location','southeast');