function [uji,target,klasifikasi] = pengujian(model)

% Data Uji/Testing
cd('D:\KULIAH SEMESTER 6\Prak. Kontrol Cerdas\Projek UAS\Data uji');  %Mengakses Directory File
data={'normal';'retak'};
jmlkls=length(data);         % Panjang data uji/testing

% Mengambil berapa banyak jumlah data di folder data uji/testing
for n=1:jmlkls
    cd(char(data(n)));
    datacitra=dir('*.jpg');
    jmldata=length(datacitra);
    for i=1:jmldata
        namafile=datacitra(i).name;                 %Mengambil nama gambar
        a=rgb2gray(imread(namafile));               %Menkonversi ke Grayscale
        a2=im2bw(a);                                %Menkonversi ke Biner
        
        
    %Menggunakan Praproses Citra Grayscale  
        % menggunakan parameter sudut GLCM 0 derajat
        %m=graycomatrix(a, 'offset', [0 1]);
        % menggunakan parameter sudut GLCM 45 derajat
        %m=graycomatrix(a, 'offset', [-1 1]);
        % menggunakan parameter sudut GLCM 90 derajat
        %m=graycomatrix(a, 'offset', [-1 0]);
        % menggunakan parameter sudut GLCM 135 derajat
        %m=graycomatrix(a, 'offset', [-1 -1]);
       
    %Menggunakan Praproses Citra Biner 
        % menggunakan parameter sudut GLCM 0 derajat
        m=graycomatrix(a2, 'offset', [0 1]);
        % menggunakan parameter sudut GLCM 45 derajat
        %m=graycomatrix(a2, 'offset', [-1 1]);
        % menggunakan parameter sudut GLCM 90 derajat
        %m=graycomatrix(a2, 'offset', [-1 0]);
        % menggunakan parameter sudut GLCM 135 derajat
        %m=graycomatrix(a2, 'offset', [-1 -1]);
        
        % Fitur yang digunakan pada GLCM
        g=graycoprops(m);
        uji(i+jmldata*(n-1),1)=g.Contrast;
        uji(i+jmldata*(n-1),2)=g.Correlation;
        uji(i+jmldata*(n-1),3)=g.Energy;
        uji(i+jmldata*(n-1),4)=g.Homogeneity;
        
        
     
        % melakukan prediksi dari model
        target(i+jmldata*(n-1))=n;
        klasifikasi(i+jmldata*(n-1))= model.predict(uji(i+jmldata*(n-1),:));
        
    end
    cd('..');
 end
end
