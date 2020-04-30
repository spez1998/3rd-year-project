%% Setup
% Sweep settings
sweep_start = 10;
sweep_end = 200;
sweep_step = 5;
open_tf = [];
box_tf = [];
lt_tf = [];
v_pid_tf = [];
i_pid_tf = [];
d_pid_tf = [];
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
    out = sim('pyle_tf');
    open_tf = [open_tf;i 20*log10(max(out.open_tf(:,2))/max(out.open_tf(:,1)))];
    box_tf = [box_tf;i 20*log10(max(out.box_tf(:,2))/max(out.box_tf(:,1)))];
    lt_tf = [lt_tf;i 20*log10(max(out.lt_tf(:,2))/max(out.lt_tf(:,1)))];
    v_pid_tf = [v_pid_tf;i 20*log10(max(out.v_pid_tf(:,2))/max(out.v_pid_tf(:,1)))];
    i_pid_tf = [i_pid_tf;i 20*log10(max(out.i_pid_tf(:,2))/max(out.i_pid_tf(:,1)))];
    d_pid_tf = [d_pid_tf;i 20*log10(max(out.d_pid_tf(:,2))/max(out.d_pid_tf(:,1)))];
end
%% Group Delays
delay = [out.delay.time out.delay.signals.values];
key_locs = find(delay(:,2) < delay(:,3));
%% Plots
figure;
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