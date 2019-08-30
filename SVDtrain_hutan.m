function varargout = SVDtrain_hutan(varargin)
jpg_lists1 =dir(fullfile('GAMBAR LATIH/hutan/','*.jpg'));
dir_count =size(jpg_lists1,1);
Umat=[]; Smat=[]; Vmat=[]; USmat=[]; SVmat=[]; UVmat=[]; USVmat=[];
Uclass=[]; Sclass=[]; Vclass=[]; USclass=[]; SVclass=[]; UVclass=[]; USVclass=[];

for i=1:dir_count
  disp(['data latih ke ', num2str(i)]);
    disp(['GAMBAR LATIH/hutan/' jpg_lists1(i).name]);
    
    Img=imread(['GAMBAR LATIH/hutan/' jpg_lists1(i).name]);
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
       Uclass=[Uclass;"hutan"];
       Sclass=[Sclass;"hutan"];
       Vclass=[Vclass;"hutan"];
       USclass=[USclass;"hutan"];
       SVclass=[SVclass;"hutan"];
       UVclass=[UVclass;"hutan"];
       USVclass=[USVclass;"hutan"];
    
end
save('GAMBAR LATIH/hutan/Uhutan.mat','Umat');
save('GAMBAR LATIH/hutan/Uclasshutan.mat','Uclass');
save('GAMBAR LATIH/hutan/Shutan.mat','Smat');
save('GAMBAR LATIH/hutan/Sclasshutan.mat','Sclass');
save('GAMBAR LATIH/hutan/Vhutan.mat','Vmat');
save('GAMBAR LATIH/hutan/Vclasshutan.mat','Vclass');
save('GAMBAR LATIH/hutan/UShutan.mat','USmat');
save('GAMBAR LATIH/hutan/USclasshutan.mat','USclass');
save('GAMBAR LATIH/hutan/SVhutan.mat','SVmat');
save('GAMBAR LATIH/hutan/SVclasshutan.mat','SVclass');
save('GAMBAR LATIH/hutan/UVhutan.mat','UVmat');
save('GAMBAR LATIH/hutan/UVclasshutan.mat','UVclass');
save('GAMBAR LATIH/hutan/USVhutan.mat','USVmat');
save('GAMBAR LATIH/hutan/USVclasshutan.mat','USVclass');
end