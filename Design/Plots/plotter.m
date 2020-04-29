%% Setup

load('open_loop_sim_data.mat');
load('closed_loop_sim_data.mat');

% IEEE-friendly Appearance
set(0,'defaultAxesFontName','Times New Roman');
set(0,'defaultTextFontName','Times New Roman');
set(0,'defaultLegendFontName','Times New Roman');
set(0,'defaultAxesGridLineStyle','-');
set(0,'defaultAxesFontSize',14);

% Extracting peak output voltage readings with timestamps
open_um_v_pks = open_um(ismember([open_um(:,8)],findpeaks(open_um(:,8))),:);
open_box_v_pks = open_box(ismember([open_box(:,8)],findpeaks(open_box(:,8))),:);
open_lt_v_pks = open_lt(ismember([open_lt(:,8)],findpeaks(open_lt(:,8))),:);
v_pid_v_pks = v_pid(ismember([v_pid(:,8)],findpeaks(v_pid(:,8))),:);
i_pid_v_pks = i_pid(ismember([i_pid(:,8)],findpeaks(i_pid(:,8))),:);
d_pid_v_pks = d_pid(ismember([d_pid(:,8)],findpeaks(d_pid(:,8))),:);

% Extracting peak output displacement readings with timestamps
open_um_d_pks = open_um(ismember([open_um(:,3)],findpeaks(open_um(:,3))),:);
open_box_d_pks = open_box(ismember([open_box(:,3)],findpeaks(open_box(:,3))),:);
open_lt_d_pks = open_lt(ismember([open_lt(:,3)],findpeaks(open_lt(:,3))),:);
v_pid_d_pks = v_pid(ismember([v_pid(:,3)],findpeaks(v_pid(:,3))),:);
i_pid_d_pks = i_pid(ismember([i_pid(:,3)],findpeaks(i_pid(:,3))),:);
d_pid_d_pks = d_pid(ismember([d_pid(:,3)],findpeaks(d_pid(:,3))),:);

% Extracting peak coil current readings with timestamps
open_um_i_pks = open_um(ismember([open_um(:,5)],findpeaks(open_um(:,5))),:);
open_box_i_pks = open_box(ismember([open_box(:,5)],findpeaks(open_box(:,5))),:);
open_lt_i_pks = open_lt(ismember([open_lt(:,5)],findpeaks(open_lt(:,5))),:);
v_pid_i_pks = v_pid(ismember([v_pid(:,5)],findpeaks(v_pid(:,5))),:);
i_pid_i_pks = i_pid(ismember([i_pid(:,5)],findpeaks(i_pid(:,5))),:);
d_pid_i_pks = d_pid(ismember([d_pid(:,5)],findpeaks(d_pid(:,5))),:);
%% Peak output displacements
% out_disp_pks = figure;
% plot(open_um_d_pks(:,1),open_um_d_pks(:,3));
% hold on;
% plot(open_box_d_pks(:,1),open_box_d_pks(:,3));
% plot(open_lt_d_pks(:,1),open_lt_d_pks(:,3));
% plot(v_pid_d_pks(:,1),v_pid_d_pks(:,3));
% plot(i_pid_d_pks(:,1),i_pid_d_pks(:,3));
% plot(d_pid_d_pks(:,1),d_pid_d_pks(:,3));
% axis square;
% grid on;
% grid minor;
% title('Excursion Comparison');
% xlabel('Time / s');
% ylabel('Displacement / m');
% legend({'Freestanding','Mounted','Linkwitz-Transformed','Voltage-controlled','Current-controlled','Displacement-controlled'},'Location','northeast');
% exportgraphics(out_disp_pks,'out_disp_pks.png','Resolution',400');
%% Output displacements
out_disp = figure;
plot(open_um(:,1),open_um(:,3));
hold on;
plot(open_box(:,1),open_box(:,3));
plot(open_lt(:,1),open_lt(:,3));
plot(v_pid(:,1),v_pid(:,3));
plot(i_pid(:,1),i_pid(:,3));
plot(d_pid(:,1),d_pid(:,3));
axis square;
grid on;
grid minor;
title('Excursion Comparison');
xlabel('Time / s');
ylabel('Displacement / m');
legend({'Freestanding','Mounted','Linkwitz-Transformed','Voltage-controlled','Current-controlled','Displacement-controlled'},'Location','southeast');
exportgraphics(out_disp,'out_disp.png','Resolution',400');
%% Peak output currents
% out_i_pks = figure;
% plot(open_um_i_pks(:,1),open_um_i_pks(:,5));
% hold on;
% plot(open_box_i_pks(:,1),open_box_i_pks(:,5),'-');
% plot(open_lt_i_pks(:,1),open_lt_i_pks(:,5));
% plot(v_pid_i_pks(:,1),v_pid_i_pks(:,5));
% plot(i_pid_i_pks(:,1),i_pid_i_pks(:,5));
% plot(d_pid_i_pks(:,1),d_pid_i_pks(:,5),':');
% axis square;
% grid on;
% grid minor;
% title('Coil Current Comparison');
% xlabel('Time / s');
% ylabel('Current / A');
% legend({'Freestanding','Mounted','Linkwitz-Transformed','Voltage-controlled','Current-controlled','Displacement-controlled'},'Location','northeast');
% exportgraphics(out_i_pks,'out_i_pks.png','Resolution',400');
%% Output currents
out_i = figure;
plot(open_um(:,1),open_um(:,5));
hold on;
plot(open_box(:,1),open_box(:,5));
plot(open_lt(:,1),open_lt(:,5));
plot(v_pid(:,1),v_pid(:,5));
plot(i_pid(:,1),i_pid(:,5));
plot(d_pid(:,1),d_pid(:,5));
axis square;
grid on;
grid minor;
title('Coil Current Comparison');
xlabel('Time / s');
ylabel('Current / A');
legend({'Freestanding','Mounted','Linkwitz-Transformed','Voltage-controlled','Current-controlled','Displacement-controlled'},'Location','southeast');
exportgraphics(out_i,'out_i.png','Resolution',400');