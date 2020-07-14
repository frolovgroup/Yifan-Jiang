clc; clear all

%%
N = importdata('data_921.dat');
P = importdata('data_922.dat');

Vbias = 0.1;
Vgate = 0;

%%
figure(1);

RN = Vbias./N.data(:,4);
RP = Vbias./P.data(:,4);

subplot(3,1,1) 
scatter(N.data(:,2),RN,5,'b')
hold
scatter(P.data(:,2),RP,5,'r')
title('Resistance vs. Magnetic Field (Start From -0.5T)')
xlabel('Magnetic Field (T)')
ylabel('Resistance(k\Omega)')
legend(['Device 3332, Vbias = ' num2str(Vbias) 'mV, Vgate = ' num2str(Vgate) 'V'])

dRN = ((Vbias./N.data(:,5))-max(Vbias./N.data(:,5)))*1000;
dRP = ((Vbias./P.data(:,5))-max(Vbias./N.data(:,5)))*1000;

subplot(3,1,2) 
scatter(N.data(:,2),dRN,5,'b')
hold
scatter(P.data(:,2),dRP,5,'r')
title('\DeltaR vs. Magnetic Field (Resistance is substracted from largest resistance)')
xlabel('Magnetic Field (T)')
ylabel('\DeltaR(\Omega)')

subplot(3,1,3) 
scatter(N.data(:,2),((Vbias./N.data(:,5))-max(Vbias./N.data(:,5)))/(max(0.5./N.data(:,5)))*100,5,'b')
hold
scatter(P.data(:,2),((Vbias./P.data(:,5))-max(Vbias./N.data(:,5)))/(max(0.5./N.data(:,5)))*100,5,'r')
title('\DeltaR/R_{MAX} vs. Magnetic Field (Resistance is substracted from largest resistance)')
xlabel('Magnetic Field (T)')
ylabel('\DeltaR(\Omega)/R_{MAX}%')

set(gcf, 'Position', [300, 0, 600, 900])


%%
Vac = 0.1/1000;
G0 = 7.748091729*(10^-5);

VN = N.data(:,4);
VP = P.data(:,4);

figure(2)
plot(N.data(:,2),(VN./(10^6))./Vac./G0,'-o','MarkerSize',4)
hold
plot(P.data(:,2),(VP./(10^6))./Vac./G0,'-o','MarkerSize',4)

xlabel('B (T)')
ylabel('G^{L}_{1-3}(2e^2/h)')
box on
%ylim([0.0105 0.014])
% xlim([-0.2 0.2])

%ay = gca;
%ay.YAxis.TickLabelFormat = '%,.4f';
% yticklabels = get(ay, 'YTickLabel');
% yticklabels{1}='';
% yticklabels{3}='';
% yticklabels{5}='';
% yticklabels{7}='';
% yticklabels{8}='';

% set(ay,'yticklabel',yticklabels)

% ax = gca;
% xticklabels = get(ax, 'XTickLabel');
% xticklabels{2}='';
% set(ax,'xticklabel',xticklabels)

%title 'Vgate = -0.6V, N-N Signal'
set(gca,'FontSize',18)
%%
VN = N.data(:,7);
VP = P.data(:,7);

figure(3)
plot(N.data(:,2),VN.*10^6,'-o','MarkerSize',4)
hold
plot(P.data(:,2),VP.*10^6,'-o','MarkerSize',4)

xlabel('B (T)')
ylabel('V^{N}_{2-4}(\muV)')
box on
%ylim([1 2.8])
% xlim([-0.2 0.2])

% ay = gca;
% %ay.YAxis.TickLabelFormat = '%,.4f';
% yticklabels = get(ay, 'YTickLabel');
% % yticklabels{1}='';
% % yticklabels{3}='';
% % yticklabels{5}='';
% % yticklabels{7}='';
% % yticklabels{8}='';
% % yticklabels{9}='';
% 
% set(ay,'yticklabel',yticklabels)

% ax = gca;
% xticklabels = get(ax, 'XTickLabel');
% xticklabels{2}='';
% set(ax,'xticklabel',xticklabels)

%title 'Vgate = -0.6V, F-F Signal'
set(gca,'FontSize',18)
