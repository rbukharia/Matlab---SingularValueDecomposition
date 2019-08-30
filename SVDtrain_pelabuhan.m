function varargout = SVDtrain_pelabuhan(varargin)
jpg_lists1 =dir(fullfile('GAMBAR LATIH/pelabuhan/','*.jpg'));
dir_count =size(jpg_lists1,1);
Umat=[]; Smat=[]; Vmat=[]; USmat=[]; SVmat=[]; UVmat=[]; USVmat=[];
Uclass=[]; Sclass=[]; Vclass=[]; USclass=[]; SVclass=[]; UVclass=[]; USVclass=[];

for i=1:dir_count
  disp(['data latih ke ', num2str(i)]);
    disp(['GAMBAR LATIH/pelabuhan/' jpg_lists1(i).name]);
    
    Img=imread(['GAMBAR LATIH/pelabuhan/' jpg_lists1(i).name]);
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
       Uclass=[Uclass;"pelabuhan"];
       Sclass=[Sclass;"pelabuhan"];
       Vclass=[Vclass;"pelabuhan"];
       USclass=[USclass;"pelabuhan"];
       SVclass=[SVclass;"pelabuhan"];
       UVclass=[UVclass;"pelabuhan"];
       USVclass=[USVclass;"pelabuhan"];
    
end
save('GAMBAR LATIH/pelabuhan/Upelabuhan.mat','Umat');
save('GAMBAR LATIH/pelabuhan/Uclasspelabuhan.mat','Uclass');
save('GAMBAR LATIH/pelabuhan/Spelabuhan.mat','Smat');
save('GAMBAR LATIH/pelabuhan/Sclasspelabuhan.mat','Sclass');
save('GAMBAR LATIH/pelabuhan/Vpelabuhan.mat','Vmat');
save('GAMBAR LATIH/pelabuhan/Vclasspelabuhan.mat','Vclass');
save('GAMBAR LATIH/pelabuhan/USpelabuhan.mat','USmat');
save('GAMBAR LATIH/pelabuhan/USclasspelabuhan.mat','USclass');
save('GAMBAR LATIH/pelabuhan/SVpelabuhan.mat','SVmat');
save('GAMBAR LATIH/pelabuhan/SVclasspelabuhan.mat','SVclass');
save('GAMBAR LATIH/pelabuhan/UVpelabuhan.mat','UVmat');
save('GAMBAR LATIH/pelabuhan/UVclasspelabuhan.mat','UVclass');
save('GAMBAR LATIH/pelabuhan/USVpelabuhan.mat','USVmat');
save('GAMBAR LATIH/pelabuhan/USVclasspelabuhan.mat','USVclass');
end