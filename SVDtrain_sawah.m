function varargout = SVDtrain_sawah(varargin)
jpg_lists1 =dir(fullfile('GAMBAR LATIH/sawah/','*.jpg'));
dir_count =size(jpg_lists1,1);
Umat=[]; Smat=[]; Vmat=[]; USmat=[]; SVmat=[]; UVmat=[]; USVmat=[];
Uclass=[]; Sclass=[]; Vclass=[]; USclass=[]; SVclass=[]; UVclass=[]; USVclass=[];

for i=1:dir_count
  disp(['data latih ke ', num2str(i)]);
    disp(['GAMBAR LATIH/sawah/' jpg_lists1(i).name]);
    
    Img=imread(['GAMBAR LATIH/sawah/' jpg_lists1(i).name]);
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
       Uclass=[Uclass;"sawah"];
       Sclass=[Sclass;"sawah"];
       Vclass=[Vclass;"sawah"];
       USclass=[USclass;"sawah"];
       SVclass=[SVclass;"sawah"];
       UVclass=[UVclass;"sawah"];
       USVclass=[USVclass;"sawah"];
    
end
save('GAMBAR LATIH/sawah/Usawah.mat','Umat');
save('GAMBAR LATIH/sawah/Uclasssawah.mat','Uclass');
save('GAMBAR LATIH/sawah/Ssawah.mat','Smat');
save('GAMBAR LATIH/sawah/Sclasssawah.mat','Sclass');
save('GAMBAR LATIH/sawah/Vsawah.mat','Vmat');
save('GAMBAR LATIH/sawah/Vclasssawah.mat','Vclass');
save('GAMBAR LATIH/sawah/USsawah.mat','USmat');
save('GAMBAR LATIH/sawah/USclasssawah.mat','USclass');
save('GAMBAR LATIH/sawah/SVsawah.mat','SVmat');
save('GAMBAR LATIH/sawah/SVclasssawah.mat','SVclass');
save('GAMBAR LATIH/sawah/UVsawah.mat','UVmat');
save('GAMBAR LATIH/sawah/UVclasssawah.mat','UVclass');
save('GAMBAR LATIH/sawah/USVsawah.mat','USVmat');
save('GAMBAR LATIH/sawah/USVclasssawah.mat','USVclass');
end