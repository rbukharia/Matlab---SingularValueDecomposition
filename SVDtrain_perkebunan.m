function varargout = SVDtrain_perkebunan(varargin)
jpg_lists1 =dir(fullfile('GAMBAR LATIH/perkebunan/','*.jpg'));
dir_count =size(jpg_lists1,1);
Umat=[]; Smat=[]; Vmat=[]; USmat=[]; SVmat=[]; UVmat=[]; USVmat=[];
Uclass=[]; Sclass=[]; Vclass=[]; USclass=[]; SVclass=[]; UVclass=[]; USVclass=[];

for i=1:dir_count
  disp(['data latih ke ', num2str(i)]);
    disp(['GAMBAR LATIH/perkebunan/' jpg_lists1(i).name]);
    
    Img=imread(['GAMBAR LATIH/perkebunan/' jpg_lists1(i).name]);
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
       Uclass=[Uclass;"perkebunan"];
       Sclass=[Sclass;"perkebunan"];
       Vclass=[Vclass;"perkebunan"];
       USclass=[USclass;"perkebunan"];
       SVclass=[SVclass;"perkebunan"];
       UVclass=[UVclass;"perkebunan"];
       USVclass=[USVclass;"perkebunan"];
    
end
save('GAMBAR LATIH/perkebunan/Uperkebunan.mat','Umat');
save('GAMBAR LATIH/perkebunan/Uclassperkebunan.mat','Uclass');
save('GAMBAR LATIH/perkebunan/Sperkebunan.mat','Smat');
save('GAMBAR LATIH/perkebunan/Sclassperkebunan.mat','Sclass');
save('GAMBAR LATIH/perkebunan/Vperkebunan.mat','Vmat');
save('GAMBAR LATIH/perkebunan/Vclassperkebunan.mat','Vclass');
save('GAMBAR LATIH/perkebunan/USperkebunan.mat','USmat');
save('GAMBAR LATIH/perkebunan/USclassperkebunan.mat','USclass');
save('GAMBAR LATIH/perkebunan/SVperkebunan.mat','SVmat');
save('GAMBAR LATIH/perkebunan/SVclassperkebunan.mat','SVclass');
save('GAMBAR LATIH/perkebunan/UVperkebunan.mat','UVmat');
save('GAMBAR LATIH/perkebunan/UVclassperkebunan.mat','UVclass');
save('GAMBAR LATIH/perkebunan/USVperkebunan.mat','USVmat');
save('GAMBAR LATIH/perkebunan/USVclassperkebunan.mat','USVclass');
end