%% Setup
% Sweep settings
sweep_start = 10;
sweep_end = 200;
sweep_step = 5;
open_tf = [];
box_tf = [];
lt_tf = [];
% IEEE-friendly Appearance
set(0,'defaultAxesFontName','Times New Roman');
set(0,'defaultTextFontName','Times New Roman');
set(0,'defaultLegendFontName','Times New Roman');
set(0,'defaultAxesGridLineStyle','-');
set(0,'defaultAxesFontSize',14);
%% Completely open
set_param('pyle_tf/switch1','Value','0');
set_param('pyle_tf/switch2','Value','0');
for i = sweep_start:sweep_step:sweep_end
    rad = 2*pi*i;
    disp(rad);
    set_param('pyle_tf/Sine Wave','Frequency',num2str(rad));
    out = sim('pyle_tf');
    open_tf = [open_tf;i 20*log10(max(out.open_tf(:,2))/max(out.open_tf(:,1)))];
end
%% Open, in box
set_param('pyle_tf/switch1','Value','1');
set_param('pyle_tf/switch2','Value','0');
for i = sweep_start:sweep_step:sweep_end
    rad = 2*pi*i;
    disp(rad);
    set_param('pyle_tf/Sine Wave','Frequency',num2str(rad));
    out = sim('pyle_tf');
    box_tf = [box_tf;i 20*log10(max(out.open_tf(:,2))/max(out.open_tf(:,1)))];
end
%% LT
set_param('pyle_tf/switch1','Value','1');
set_param('pyle_tf/switch2','Value','1');
for i = sweep_start:sweep_step:sweep_end
    rad = 2*pi*i;
    disp(rad);
    set_param('pyle_tf/Sine Wave','Frequency',num2str(rad));
    out = sim('pyle_tf');
    lt_tf = [lt_tf;i 20*log10(max(out.open_tf(:,2))/max(out.open_tf(:,1)))];
end
%% Plots
figure;
plot(open_tf(:,1),open_tf(:,2));
hold on;
plot(box_tf(:,1),box_tf(:,2));
plot(lt_tf(:,1),lt_tf(:,2));