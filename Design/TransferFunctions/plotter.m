%% Setup
% Sweep settings
sweep_start = 10;
sweep_end = 200;
sweep_step = 5;
open_tf = []; box_tf = []; lt_tf = []; v_pid_tf = []; i_pid_tf = []; d_pid_tf = [];
open_delay = []; box_delay = []; lt_delay = []; v_pid_delay = []; i_pid_delay = []; d_pid_delay = [];
open_delay2 = []; box_delay2 = []; lt_delay2 = []; v_pid_delay2 = []; i_pid_delay2 = []; d_pid_delay2 = [];
open_ph = []; box_ph = []; lt_ph= []; v_pid_ph = []; i_pid_ph = []; d_pid_ph = [];
% IEEE-friendly Appearance
set(0,'defaultAxesFontName','Times New Roman');
set(0,'defaultTextFontName','Times New Roman');
set(0,'defaultLegendFontName','Times New Roman');
set(0,'defaultAxesGridLineStyle','-');
set(0,'defaultAxesFontSize',14);
%% Magnitudes
for i = sweep_start:sweep_step:sweep_end
    rad = 2*pi*i;
    disp(rad);
    set_param('pyle_tf/Sine Wave','Frequency',num2str(rad));
    set_param('pyle_tf/mean_open','Freq',num2str(i));
    set_param('pyle_tf/mean_box','Freq',num2str(i));
    set_param('pyle_tf/mean_lt','Freq',num2str(i));
    set_param('pyle_tf/mean_v_pid','Freq',num2str(i));
    set_param('pyle_tf/mean_i_pid','Freq',num2str(i));
    set_param('pyle_tf/mean_d_pid','Freq',num2str(i));
    out = sim('pyle_tf');
    open_tf = [open_tf;i 20*log10(max(out.open_tf(:,2))/max(out.open_tf(:,1)))];
    box_tf = [box_tf;i 20*log10(max(out.box_tf(:,2))/max(out.box_tf(:,1)))];
    lt_tf = [lt_tf;i 20*log10(max(out.lt_tf(:,2))/max(out.lt_tf(:,1)))];
    v_pid_tf = [v_pid_tf;i 20*log10(max(out.v_pid_tf(:,2))/max(out.v_pid_tf(:,1)))];
    i_pid_tf = [i_pid_tf;i 20*log10(max(out.i_pid_tf(:,2))/max(out.i_pid_tf(:,1)))];
    d_pid_tf = [d_pid_tf;i 20*log10(max(out.d_pid_tf(:,2))/max(out.d_pid_tf(:,1)))];
    open_delay = [open_delay;i mean(dutycycle(out.open_delay.signals.values(:,1),out.open_delay.time,'Polarity','Positive'))*mean(pulseperiod(out.open_delay.signals.values(:,1),out.open_delay.time,'Polarity','Positive'))];
    box_delay = [box_delay;i mean(dutycycle(out.box_delay.signals.values(:,1),out.box_delay.time,'Polarity','Positive'))*mean(pulseperiod(out.box_delay.signals.values(:,1),out.box_delay.time,'Polarity','Positive'))];
    lt_delay = [lt_delay;i mean(dutycycle(out.lt_delay.signals.values(:,1),out.lt_delay.time,'Polarity','Positive'))*mean(pulseperiod(out.lt_delay.signals.values(:,1),out.lt_delay.time,'Polarity','Positive'))];
    v_pid_delay = [v_pid_delay;i mean(dutycycle(out.v_pid_delay.signals.values(:,1),out.v_pid_delay.time,'Polarity','Positive'))*mean(pulseperiod(out.v_pid_delay.signals.values(:,1),out.v_pid_delay.time,'Polarity','Positive'))];
    i_pid_delay = [i_pid_delay;i mean(dutycycle(out.i_pid_delay.signals.values(:,1),out.i_pid_delay.time,'Polarity','Positive'))*mean(pulseperiod(out.i_pid_delay.signals.values(:,1),out.i_pid_delay.time,'Polarity','Positive'))];
    d_pid_delay = [d_pid_delay;i mean(dutycycle(out.d_pid_delay.signals.values(:,1),out.d_pid_delay.time,'Polarity','Positive'))*mean(pulseperiod(out.d_pid_delay.signals.values(:,1),out.d_pid_delay.time,'Polarity','Positive'))];
    open_ph = [open_ph;i ((360 * out.open_ph.signals.values(end)))];
    box_ph = [box_ph;i ((360 * out.box_ph.signals.values(end)))];
    lt_ph = [lt_ph;i ((360 * out.lt_ph.signals.values(end)))];
    v_pid_ph = [v_pid_ph;i ((360 * out.v_pid_ph.signals.values(end)))];
    i_pid_ph = [i_pid_ph;i ((360 * out.i_pid_ph.signals.values(end)))];
    d_pid_ph = [d_pid_ph;i ((360 * out.d_pid_ph.signals.values(end)))];
end
%% Plots
% Magnitude
mag_plot = figure;
plot(open_tf(:,1),open_tf(:,2));
hold on;
plot(box_tf(:,1),box_tf(:,2));
plot(lt_tf(:,1),lt_tf(:,2));
plot(v_pid_tf(:,1),v_pid_tf(:,2));
plot(i_pid_tf(:,1),i_pid_tf(:,2));
plot(d_pid_tf(:,1),d_pid_tf(:,2));
legend({'open','box','lt','v','i','d'});
axis square;
grid on;
grid minor;
title('System Magnitude Response Comparisons');
xlabel('Frequency/Hz');
ylabel('Magnitude / dB');
legend({'Freestanding','Mounted','Linkwitz-Transformed','Voltage-controlled','Current-controlled','Displacement-controlled'},'Location','southeast');
% Group Delay
group_del_plot = figure;
plot(open_delay(:,1),open_delay(:,2));
hold on;
plot(box_delay(:,1),box_delay(:,2));
plot(lt_delay(:,1),lt_delay(:,2));
plot(v_pid_delay(:,1),v_pid_delay(:,2));
plot(i_pid_delay(:,1),i_pid_delay(:,2));
plot(d_pid_delay(:,1),d_pid_delay(:,2));
axis square;
grid on;
grid minor;
title('System Group Delay Comparisons');
xlabel('Frequency / Hz');
ylabel('Delay / s');
legend({'Freestanding','Mounted','Linkwitz-Transformed','Voltage-controlled','Current-controlled','Displacement-controlled'},'Location','northeast');
% Phase
phase_plot = figure;
plot(open_ph(:,1),open_ph(:,2));
hold on;
plot(box_ph(:,1),box_ph(:,2));
plot(lt_ph(:,1),lt_ph(:,2));
plot(v_pid_ph(:,1),v_pid_ph(:,2));
plot(i_pid_ph(:,1),i_pid_ph(:,2));
plot(d_pid_ph(:,1),d_pid_ph(:,2));
title('System Phase Response Comparisons');
xlabel('Frequency / Hz');
ylabel('Phase / Degrees');
legend({'Freestanding','Mounted','Linkwitz-Transformed','Voltage-controlled','Current-controlled','Displacement-controlled'},'Location','northeast');