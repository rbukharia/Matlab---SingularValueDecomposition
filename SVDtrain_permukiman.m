function varargout = SVDtrain_permukiman(varargin)
jpg_lists1 =dir(fullfile('GAMBAR LATIH/permukiman/','*.jpg'));
dir_count =size(jpg_lists1,1);
Umat=[]; Smat=[]; Vmat=[]; USmat=[]; SVmat=[]; UVmat=[]; USVmat=[];
Uclass=[]; Sclass=[]; Vclass=[]; USclass=[]; SVclass=[]; UVclass=[]; USVclass=[];

for i=1:dir_count
  disp(['data latih ke ', num2str(i)]);
    disp(['GAMBAR LATIH/permukiman/' jpg_lists1(i).name]);
    
    Img=imread(['GAMBAR LATIH/permukiman/' jpg_lists1(i).name]);
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
       Uclass=[Uclass;"permukiman"];
       Sclass=[Sclass;"permukiman"];
       Vclass=[Vclass;"permukiman"];
       USclass=[USclass;"permukiman"];
       SVclass=[SVclass;"permukiman"];
       UVclass=[UVclass;"permukiman"];
       USVclass=[USVclass;"permukiman"];
    
end
save('GAMBAR LATIH/permukiman/Upermukiman.mat','Umat');
save('GAMBAR LATIH/permukiman/Uclasspermukiman.mat','Uclass');
save('GAMBAR LATIH/permukiman/Spermukiman.mat','Smat');
save('GAMBAR LATIH/permukiman/Sclasspermukiman.mat','Sclass');
save('GAMBAR LATIH/permukiman/Vpermukiman.mat','Vmat');
save('GAMBAR LATIH/permukiman/Vclasspermukiman.mat','Vclass');
save('GAMBAR LATIH/permukiman/USpermukiman.mat','USmat');
save('GAMBAR LATIH/permukiman/USclasspermukiman.mat','USclass');
save('GAMBAR LATIH/permukiman/SVpermukiman.mat','SVmat');
save('GAMBAR LATIH/permukiman/SVclasspermukiman.mat','SVclass');
save('GAMBAR LATIH/permukiman/UVpermukiman.mat','UVmat');
save('GAMBAR LATIH/permukiman/UVclasspermukiman.mat','UVclass');
save('GAMBAR LATIH/permukiman/USVpermukiman.mat','USVmat');
save('GAMBAR LATIH/permukiman/USVclasspermukiman.mat','USVclass');
end