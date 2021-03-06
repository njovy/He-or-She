load('trainingdata.mat');
load('differentsvm.mat');
addpath(genpath('C:\Users\Sarthak\Dropbox\Matlab Workspace\PR Project'));

figure(1);clf;hold on;
title('Using only MFCC Features');
xlabel('FPR');
ylabel('TPR');

disp('Linear Kernel SVM Classifier with only mfcc');
[testlinearmfcc,testlinearmfccaccuracy,testlinearmfccprob]=svmpredict(double(TestingLabels'),double(TestingDataMfcc),svmlinearmfcc);
disp('Degree Kernel SVM Classifier with only mfcc');
[testdegreemfcc,testdegreemfccaccuracy,testdegreemfccprob]=svmpredict(double(TestingLabels'),double(TestingDataMfcc),svmdegreemfcc);
disp('RBF Kernel SVM Classifier with only mfcc');
[testrbfmfcc,testrbfmfccaccuracy,testrbfmfccprob]=svmpredict(double(TestingLabels'),double(TestingDataMfcc),svmrbfmfcc);
[X,Y] = perfcurve(TestingLabels',testrbfmfccprob,1);
plot(X,Y,'r');hold on;
[X,Y] = perfcurve(TestingLabels',testdegreemfccprob,1);
plot(X,Y,'g');hold on;
[X,Y] = perfcurve(TestingLabels',testlinearmfccprob,1);
plot(X,Y,'b');hold on;
legend('RBF Kernel','Degree Kernel','Linear Kernel');

figure(2);clf;hold on;
title('Using only Basic Audio Features Features');
xlabel('FPR');
ylabel('TPR');
legend('Linear Kernel','Degree Kernel','RBF Kernel');
disp('Linear Kernel SVM Classifier with only spectral');
[testlinearspec,testlinearspecaccuracy,testlinearspecprob]=svmpredict(double(TestingLabels'),double(TestingDataSpec),svmlinearspec);
disp('Degree Kernel SVM Classifier with only spectral');
[testdegreespec,testdegreespecaccuracy,testdegreespecprob]=svmpredict(double(TestingLabels'),double(TestingDataSpec),svmdegreespec);
disp('RBF Kernel SVM Classifier with only spectral');
[testrbfspec,testrbfspecaccuracy,testrbfspecprob]=svmpredict(double(TestingLabels'),double(TestingDataSpec),svmrbfspec);
[X,Y] = perfcurve(TestingLabels',testrbfspecprob,1);
plot(X,Y,'r');hold on;
[X,Y] = perfcurve(TestingLabels',testdegreespecprob,1);
plot(X,Y,'g');hold on;
[X,Y] = perfcurve(TestingLabels',testlinearspecprob,1);
plot(X,Y,'b');hold on;
legend('RBF Kernel','Degree Kernel','Linear Kernel');

figure(3);clf;hold on;
title('Using both MFCC and General Audio Features Features');
xlabel('FPR');
ylabel('TPR');
legend('Linear Kernel','Degree Kernel','RBF Kernel');
disp('Linear Kernel SVM Classifier with both');
[testlinearboth,testlinearbothaccuracy,testlinearbothprob]=svmpredict(double(TestingLabels'),double(TestingDataBoth),svmlinearboth);
disp('Degree Kernel SVM Classifier with both');
[testdegreeboth,testdegreebothaccuracy,testdegreebothprob]=svmpredict(double(TestingLabels'),double(TestingDataBoth),svmdegreeboth);
disp('RBF Kernel SVM Classifier with both');
[testrbfboth,testrbfbothaccuracy,testrbfbothprob]=svmpredict(double(TestingLabels'),double(TestingDataBoth),svmrbfboth);
[X,Y] = perfcurve(TestingLabels',testrbfbothprob,1);
plot(X,Y,'r');hold on;
[X,Y] = perfcurve(TestingLabels',testdegreebothprob,1);
plot(X,Y,'g');hold on;
[X,Y] = perfcurve(TestingLabels',testlinearbothprob,1);
plot(X,Y,'b');hold on;
legend('RBF Kernel','Degree Kernel','Linear Kernel');