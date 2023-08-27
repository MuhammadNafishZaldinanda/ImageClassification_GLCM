function [fitur_mat,kelas] = pelatihan(datasetku)
   jmlkls=length (datasetku);       % Panjang Data Latih/Train
   
   %Mengambil berapa banyak jumlah data di folder data Latih/Train
   for n=1:jmlkls
       cd(char(datasetku(n)));                  %Mengakses Directory datasetku
       datacitra=dir('*.jpg');                  %Membaca seluruh citra
       jmldata=length(datacitra);
       for i=1:jmldata
           namafile=datacitra(i).name;          %Mengambil nama gambar
           citrai=rgb2gray(imread(namafile));   %Gambar dikonversi ke Grayscale
           citrai2=im2bw(citrai);               %Gambar dikonversi ke Biner
          
       %Menggunakan Praproses Citra Grayscale   
           % menggunakan parameter sudut GLCM 0 derajat
           %fitur = graycoprops(graycomatrix(citrai, 'offset', [0 1]));
           % menggunakan parameter sudut GLCM 45 derajat
           %fitur = graycoprops(graycomatrix(citrai, 'offset', [-1 1]));
           % menggunakan parameter sudut GLCM 90 derajat
           %fitur = graycoprops(graycomatrix(citrai, 'offset', [-1 0]));
           % menggunakan parameter sudut GLCM 135 derajat
           %fitur = graycoprops(graycomatrix(citrai, 'offset', [-1 -1]));
           
       %Menggunakan Praproses Citra Biner    
           % menggunakan parameter sudut GLCM 0 derajat
           fitur = graycoprops(graycomatrix(citrai2, 'offset', [0 1]));
           % menggunakan parameter sudut GLCM 45 derajat
           %fitur = graycoprops(graycomatrix(citrai2, 'offset', [-1 1]));
           % menggunakan parameter sudut GLCM 90 derajat
           %fitur = graycoprops(graycomatrix(citrai2, 'offset', [-1 0]));
           % menggunakan parameter sudut GLCM 135 derajat
           %fitur = graycoprops(graycomatrix(citrai2, 'offset', [-1 -1]));
           
           % Fitur yang digunakan pada GLCM
           fitur_mat(i+jmldata*(n-1),1)=fitur.Contrast;
           fitur_mat(i+jmldata*(n-1),2)=fitur.Correlation;
           fitur_mat(i+jmldata*(n-1),3)=fitur.Energy;
           fitur_mat(i+jmldata*(n-1),4)=fitur.Homogeneity;
           
          
           % Membuat kelas untuk menentukan termasuk kelas yang mana
           kelas(i+jmldata*(n-1))=n;
       end
       cd('..');
   end
end