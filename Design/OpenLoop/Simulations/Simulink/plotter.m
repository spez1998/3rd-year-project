% IEEE-friendly Appearance
set(0,'defaultAxesFontName','Times New Roman');
set(0,'defaultTextFontName','Times New Roman');
set(0,'defaultLegendFontName','Times New Roman');
set(0,'defaultAxesGridLineStyle','-');
set(0,'defaultAxesFontSize',14);

figure;
plot(open_time,open(:,7),'Color','#964B00');
hold on;
plot(open_box_time,open_box(:,7),'r');
plot(lt_time,lt(:,7),'k');
axis square;