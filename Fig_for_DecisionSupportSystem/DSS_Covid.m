
 
 clc
clear all
close all

T = readtable('prediction.csv','NumHeaderLines',3); 
 Test_prediction= table2array(T);
test_label = Test_prediction(:,2);
Predicted_Label = Test_prediction(:,1);

HHO_Ensemble__probability1 =  table2array(readtable('probability_v1.csv','NumHeaderLines',3)); 
HGSORF_probability=HHO_Ensemble__probability1(:,1);

score=HGSORF_probability;
figure
plot(test_label(1:100),'-r')
hold on 
plot(Predicted_Label(1:100))

% test_label(test_label==0)=2;
% Predicted_Label(Predicted_Label==0)=2;

% test_label=test_label;
% Predicted_Label=Predicted_Label;

 k = find(test_label==1); % Asthma yes  
 kk=find(test_label==0);  %sleep
% 
 indx=[kk(1:100); k(20:200)];
% 
 test_label1=test_label(indx,:);
 Predicted_Label1=Predicted_Label(indx,:);

figure
subplot(2,1,1)
plot(test_label1,'-g', 'LineWidth',3)
hold on 
plot(Predicted_Label1,'--k')
legend('True label', 'Predicted label')
 xlim([1 260])
ylim([-0.2 1.2])
%  xlim([1 50])
d=0.5*ones(1,length(test_label));

 score1=score(indx,:);
% score1=score;
% subplot(2,1,2)
% plot(score1(:,1),'-b', 'LineWidth',2)
% 
% 
% hold on 
% plot(d)
% legend('Probability of not affecting COVID ', 'Threshold')
subplot(2,1,2)
plot(score1,'-b', 'LineWidth',2)
hold on 
plot(d(1:length(score1)),'--m', 'LineWidth',1)
legend('Probability of affecting  COVID', 'Threshold')
ylim([-0.2 1.2])
 xlim([1 260])

