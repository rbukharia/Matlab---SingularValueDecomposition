function varargout = SVDtrain_padangrumput(varargin)
jpg_lists1 =dir(fullfile('GAMBAR LATIH/padang rumput/','*.jpg'));
dir_count =size(jpg_lists1,1);
Umat=[]; Smat=[]; Vmat=[]; USmat=[]; SVmat=[]; UVmat=[]; USVmat=[];
Uclass=[]; Sclass=[]; Vclass=[]; USclass=[]; SVclass=[]; UVclass=[]; USVclass=[];

for i=1:dir_count
  disp(['data latih ke ', num2str(i)]);
    disp(['GAMBAR LATIH/padang rumput/' jpg_lists1(i).name]);
    
    Img=imread(['GAMBAR LATIH/padang rumput/' jpg_lists1(i).name]);
    resize=imresize(Img,[1024 1024]); %resize 256x256 pixel
    J=imadjust(resize,[40/255 204/255],[0/255 255/255]);  %peningkatan contrast citra
    grayImage = rgb2gray(J); %mengubah gambar latih ke grayscale

    D=double(grayImage);
    [U,S,V]=svd(D); %melakukan SVD
    Ac1=U;   %menyimpan tiap matrix SVD di variable A1,A2,dan A3
    Ac2=S;
    Ac3=V;
    My=Ac1*Ac2; %US
    Ny=Ac2*Ac3; %SV
    Cy=Ac1*Ac3; %UV
    By=Ac1*Ac2*Ac3; %USV

       Ac1=transpose(Ac1(:));
       Ac2=transpose(Ac2(:));
       Ac3=transpose(Ac3(:));
       My=transpose(My(:));
       Ny=transpose(Ny(:));
       Cy=transpose(Cy(:));
       By=transpose(By(:));
       
       Umat=[Umat; Ac1];
       Smat=[Smat; Ac2];
       Vmat=[Vmat; Ac3];
       USmat=[USmat; My];
       SVmat=[SVmat; Ny];
       UVmat=[UVmat; Cy];
       USVmat=[USVmat; By];
       Uclass=[Uclass;"padang rumput"];
       Sclass=[Sclass;"padang rumput"];
       Vclass=[Vclass;"padang rumput"];
       USclass=[USclass;"padang rumput"];
       SVclass=[SVclass;"padang rumput"];
       UVclass=[UVclass;"padang rumput"];
       USVclass=[USVclass;"padang rumput"];
    
end
save('GAMBAR LATIH/padang rumput/Upadang_rumput.mat','Umat');
save('GAMBAR LATIH/padang rumput/Uclasspadang_rumput.mat','Uclass');
save('GAMBAR LATIH/padang rumput/Spadang_rumput.mat','Smat');
save('GAMBAR LATIH/padang rumput/Sclasspadang_rumput.mat','Sclass');
save('GAMBAR LATIH/padang rumput/Vpadang_rumput.mat','Vmat');
save('GAMBAR LATIH/padang rumput/Vclasspadang_rumput.mat','Vclass');
save('GAMBAR LATIH/padang rumput/USpadang_rumput.mat','USmat');
save('GAMBAR LATIH/padang rumput/USclasspadang_rumput.mat','USclass');
save('GAMBAR LATIH/padang rumput/SVpadang_rumput.mat','SVmat');
save('GAMBAR LATIH/padang rumput/SVclasspadang_rumput.mat','SVclass');
save('GAMBAR LATIH/padang rumput/UVpadang_rumput.mat','UVmat');
save('GAMBAR LATIH/padang rumput/UVclasspadang_rumput.mat','UVclass');
save('GAMBAR LATIH/padang rumput/USVpadang_rumput.mat','USVmat');
save('GAMBAR LATIH/padang rumput/USVclasspadang_rumput.mat','USVclass');
end