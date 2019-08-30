function varargout = SVDtrain_sungai(varargin)
jpg_lists1 =dir(fullfile('GAMBAR LATIH/sungai/','*.jpg'));
dir_count =size(jpg_lists1,1);
Umat=[]; Smat=[]; Vmat=[]; USmat=[]; SVmat=[]; UVmat=[]; USVmat=[];
Uclass=[]; Sclass=[]; Vclass=[]; USclass=[]; SVclass=[]; UVclass=[]; USVclass=[];

for i=1:dir_count
  disp(['data latih ke ', num2str(i)]);
    disp(['GAMBAR LATIH/sungai/' jpg_lists1(i).name]);
    
    Img=imread(['GAMBAR LATIH/sungai/' jpg_lists1(i).name]);
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
       Uclass=[Uclass;"sungai"];
       Sclass=[Sclass;"sungai"];
       Vclass=[Vclass;"sungai"];
       USclass=[USclass;"sungai"];
       SVclass=[SVclass;"sungai"];
       UVclass=[UVclass;"sungai"];
       USVclass=[USVclass;"sungai"];
    
end
save('GAMBAR LATIH/sungai/Usungai.mat','Umat');
save('GAMBAR LATIH/sungai/Uclasssungai.mat','Uclass');
save('GAMBAR LATIH/sungai/Ssungai.mat','Smat');
save('GAMBAR LATIH/sungai/Sclasssungai.mat','Sclass');
save('GAMBAR LATIH/sungai/Vsungai.mat','Vmat');
save('GAMBAR LATIH/sungai/Vclasssungai.mat','Vclass');
save('GAMBAR LATIH/sungai/USsungai.mat','USmat');
save('GAMBAR LATIH/sungai/USclasssungai.mat','USclass');
save('GAMBAR LATIH/sungai/SVsungai.mat','SVmat');
save('GAMBAR LATIH/sungai/SVclasssungai.mat','SVclass');
save('GAMBAR LATIH/sungai/UVsungai.mat','UVmat');
save('GAMBAR LATIH/sungai/UVclasssungai.mat','UVclass');
save('GAMBAR LATIH/sungai/USVsungai.mat','USVmat');
save('GAMBAR LATIH/sungai/USVclasssungai.mat','USVclass');
end