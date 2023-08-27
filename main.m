clear
clc
close all

% Data Latih/Train
cd('D:\KULIAH SEMESTER 6\Prak. Kontrol Cerdas\Projek UAS'); %Mengakses Directory File
datasetku = {'normal';'retak'};

% Fungsi GLCM
[fitur_mat,kelas] = pelatihan(datasetku);

% Model klasifikasi Naive Bayes
% model=fitcnb(fitur_mat,kelas');

% Model klasifikasi K-NN
 model=fitcknn(fitur_mat,kelas');

%Pengujian akurasi menggunakan data uji
[uji,target,klasifikasi] = pengujian(model);
[{'Contrast','Correlation','Energy', 'Homogeneity', 'Target', 'Kelas'};
    num2cell([uji target' klasifikasi'])]

%Confusion Matrix
cm = confusionmat(target', klasifikasi')
akurasiTrain = (sum(sum(cm))/sum(sum(cm)))*100
akurasiTest = (sum(diag(cm))/sum(sum(cm)))*100

