function varargout = GUI_MAIN(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 28-Jul-2018 15:27:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_MAIN_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_MAIN_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before untitled is made visible.
function GUI_MAIN_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% create an axes that spans the whole gui
ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
% import the background image and show it on the axes
bg = imread('summer.jpg'); imagesc(bg);
% prevent plotting over the background and turn the axis off
set(ah,'handlevisibility','off','visible','off')
% making sure the background is behind all the other uicontrols
uistack(ah, 'bottom');

logo1=imread('telu.jpg');
logo2=imread('telu.jpg');
logo3=imread('IMG_0562 IQ.jpg');
imshow(logo1,'Parent',handles.axes7);
imshow(logo2,'Parent',handles.axes9);
imshow(logo3,'Parent',handles.axes10);
set(handles.edit1, 'String', '1');
% Update handles structure
guidata(hObject, handles);

% --- Executes when selected object is changed in GUI_MAIN_OutputFcn.
function GUI_MAIN_OutputFcn(~, ~, ~)
% hObject    handle to the selected object in GUI_MAIN_OutputFcn 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
% function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes when selected object is changed in uibuttongroup3.
function uibuttongroup3_SelectionChangedFcn(~, ~, ~)
% hObject    handle to the selected object in uibuttongroup3 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, ~, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[Filename,Pathname]=uigetfile('*.jpg');
name=strcat(Pathname,Filename);
Img2=imread(name); %membaca gambar sesuai directory

resize2=imresize(Img2, [1024 1024]); %me-resize gambar menjadi 256x256 pixel

imshow(Img2,'Parent',handles.axes19);
J2=imadjust(resize2,[40/255 204/255],[0/255 255/255]); %peningkatan contrast citra
grayImage2 = rgb2gray(J2); %mengubah gambar uji ke grayscale
imshow(grayImage2,'Parent',handles.axes12);

K=double(grayImage2); %merubah nilai menjadi satuan bilangan "double"
[U,S,V]=svd(K); %melakukan SVD

handles.A1=U;
handles.A2=S;
handles.A3=V;
handles.A4=U*S; %US
handles.A5=S*V; %SV
handles.A6=U*V; %UV
handles.A7=U*S*V; %USV
handles.A8=double(grayImage2); %test pixel
imshow(handles.A1,'Parent',handles.axes15);
imshow(handles.A2,'Parent',handles.axes17);
imshow(handles.A3,'Parent',handles.axes18);
imshow(handles.A4,'Parent',handles.axes27);
imshow(handles.A5,'Parent',handles.axes30);
imshow(handles.A6,'Parent',handles.axes31);
imshow(handles.A7,'Parent',handles.axes32);
set(handles.text30, 'String', '0');
set(handles.text31, 'String', '0');

set(handles.text2, 'String', '.....');
set(handles.text11, 'String', '.....');

guidata(hObject,handles)



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, ~, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%<----Proses Uji---->

f = waitbar(0,'Please wait...');
str = get(handles.popupmenu4,'Value');
%str = get( hObject, 'String' );
switch str
    case 1
%if strcmp( str, 'None' )
% msgbox('Invalid Value, Choose a Parameter Except None', 'Error','error');
%hutan
mat1= load('GAMBAR LATIH/hutan/USVhutan.mat');
cmat1= load('GAMBAR LATIH/hutan/USVclasshutan.mat');
%padang rumput
mat2= load('GAMBAR LATIH/padang rumput/USVpadang_rumput.mat');
cmat2= load('GAMBAR LATIH/padang rumput/USVclasspadang_rumput.mat');
%pelabuhan
mat3= load('GAMBAR LATIH/pelabuhan/USVpelabuhan.mat');
cmat3= load('GAMBAR LATIH/pelabuhan/USVclasspelabuhan.mat');
%permukiman
mat4= load('GAMBAR LATIH/permukiman/USVpermukiman.mat');
cmat4= load('GAMBAR LATIH/permukiman/USVclasspermukiman.mat');
%perkebunan
mat5= load('GAMBAR LATIH/perkebunan/USVperkebunan.mat');
cmat5= load('GAMBAR LATIH/perkebunan/USVclassperkebunan.mat');
%sawah
mat6= load('GAMBAR LATIH/sawah/USVsawah.mat');
cmat6= load('GAMBAR LATIH/sawah/USVclasssawah.mat');
%sungai
mat7= load('GAMBAR LATIH/sungai/USVsungai.mat');
cmat7= load('GAMBAR LATIH/sungai/USVclasssungai.mat');

mat=[mat1.USVmat; mat2.USVmat; mat3.USVmat; mat4.USVmat; mat5.USVmat; mat6.USVmat; mat7.USVmat];
cmat=[cmat1.USVclass; cmat2.USVclass; cmat3.USVclass; cmat4.USVclass; cmat5.USVclass; cmat6.USVclass; cmat7.USVclass];

%end
    case 2
%if strcmp( str, 'U Matrix' )
%hutan
mat1= load('GAMBAR LATIH/hutan/Uhutan.mat');
cmat1= load('GAMBAR LATIH/hutan/Uclasshutan.mat');
%padang rumput
mat2= load('GAMBAR LATIH/padang rumput/Upadang_rumput.mat');
cmat2= load('GAMBAR LATIH/padang rumput/Uclasspadang_rumput.mat');
%pelabuhan
mat3= load('GAMBAR LATIH/pelabuhan/Upelabuhan.mat');
cmat3= load('GAMBAR LATIH/pelabuhan/Uclasspelabuhan.mat');
%permukiman
mat4= load('GAMBAR LATIH/permukiman/Upermukiman.mat');
cmat4= load('GAMBAR LATIH/permukiman/Uclasspermukiman.mat');
%perkebunan
mat5= load('GAMBAR LATIH/perkebunan/Uperkebunan.mat');
cmat5= load('GAMBAR LATIH/perkebunan/Uclassperkebunan.mat');
%sawah
mat6= load('GAMBAR LATIH/sawah/Usawah.mat');
cmat6= load('GAMBAR LATIH/sawah/Uclasssawah.mat');
%sungai
mat7= load('GAMBAR LATIH/sungai/Usungai.mat');
cmat7= load('GAMBAR LATIH/sungai/Uclasssungai.mat');

mat=[mat1.Umat; mat2.Umat; mat3.Umat; mat4.Umat; mat5.Umat; mat6.Umat; mat7.Umat];
cmat=[cmat1.Uclass; cmat2.Uclass; cmat3.Uclass; cmat4.Uclass; cmat5.Uclass; cmat6.Uclass; cmat7.Uclass];

%end
    case 3
%if strcmp( str, 'S Matrix' )
%hutan
mat1= load('GAMBAR LATIH/hutan/Shutan.mat');
cmat1= load('GAMBAR LATIH/hutan/Sclasshutan.mat');
%padang rumput
mat2= load('GAMBAR LATIH/padang rumput/Spadang_rumput.mat');
cmat2= load('GAMBAR LATIH/padang rumput/Sclasspadang_rumput.mat');
%pelabuhan
mat3= load('GAMBAR LATIH/pelabuhan/Spelabuhan.mat');
cmat3= load('GAMBAR LATIH/pelabuhan/Sclasspelabuhan.mat');
%permukiman
mat4= load('GAMBAR LATIH/permukiman/Spermukiman.mat');
cmat4= load('GAMBAR LATIH/permukiman/Sclasspermukiman.mat');
%perkebunan
mat5= load('GAMBAR LATIH/perkebunan/Sperkebunan.mat');
cmat5= load('GAMBAR LATIH/perkebunan/Sclassperkebunan.mat');
%sawah
mat6= load('GAMBAR LATIH/sawah/Ssawah.mat');
cmat6= load('GAMBAR LATIH/sawah/Sclasssawah.mat');
%sungai
mat7= load('GAMBAR LATIH/sungai/Ssungai.mat');
cmat7= load('GAMBAR LATIH/sungai/Sclasssungai.mat');

mat=[mat1.Smat; mat2.Smat; mat3.Smat; mat4.Smat; mat5.Smat; mat6.Smat; mat7.Smat];
cmat=[cmat1.Sclass; cmat2.Sclass; cmat3.Sclass; cmat4.Sclass; cmat5.Sclass; cmat6.Sclass; cmat7.Sclass];

%end
    case 4
%if strcmp( str, 'V Matrix' )
%hutan
mat1= load('GAMBAR LATIH/hutan/Vhutan.mat');
cmat1= load('GAMBAR LATIH/hutan/Vclasshutan.mat');
%padang rumput
mat2= load('GAMBAR LATIH/padang rumput/Vpadang_rumput.mat');
cmat2= load('GAMBAR LATIH/padang rumput/Vclasspadang_rumput.mat');
%pelabuhan
mat3= load('GAMBAR LATIH/pelabuhan/Vpelabuhan.mat');
cmat3= load('GAMBAR LATIH/pelabuhan/Vclasspelabuhan.mat');
%permukiman
mat4= load('GAMBAR LATIH/permukiman/Vpermukiman.mat');
cmat4= load('GAMBAR LATIH/permukiman/Vclasspermukiman.mat');
%perkebunan
mat5= load('GAMBAR LATIH/perkebunan/Vperkebunan.mat');
cmat5= load('GAMBAR LATIH/perkebunan/Vclassperkebunan.mat');
%sawah
mat6= load('GAMBAR LATIH/sawah/Vsawah.mat');
cmat6= load('GAMBAR LATIH/sawah/Vclasssawah.mat');
%sungai
mat7= load('GAMBAR LATIH/sungai/Vsungai.mat');
cmat7= load('GAMBAR LATIH/sungai/Vclasssungai.mat');

mat=[mat1.Vmat; mat2.Vmat; mat3.Vmat; mat4.Vmat; mat5.Vmat; mat6.Vmat; mat7.Vmat];
cmat=[cmat1.Vclass; cmat2.Vclass; cmat3.Vclass; cmat4.Vclass; cmat5.Vclass; cmat6.Vclass; cmat7.Vclass];

%end
    case 5
%if strcmp( str, 'US Matrix' )
%hutan
mat1= load('GAMBAR LATIH/hutan/UShutan.mat');
cmat1= load('GAMBAR LATIH/hutan/USclasshutan.mat');
%padang rumput
mat2= load('GAMBAR LATIH/padang rumput/USpadang_rumput.mat');
cmat2= load('GAMBAR LATIH/padang rumput/USclasspadang_rumput.mat');
%pelabuhan
mat3= load('GAMBAR LATIH/pelabuhan/USpelabuhan.mat');
cmat3= load('GAMBAR LATIH/pelabuhan/USclasspelabuhan.mat');
%permukiman
mat4= load('GAMBAR LATIH/permukiman/USpermukiman.mat');
cmat4= load('GAMBAR LATIH/permukiman/USclasspermukiman.mat');
%perkebunan
mat5= load('GAMBAR LATIH/perkebunan/USperkebunan.mat');
cmat5= load('GAMBAR LATIH/perkebunan/USclassperkebunan.mat');
%sawah
mat6= load('GAMBAR LATIH/sawah/USsawah.mat');
cmat6= load('GAMBAR LATIH/sawah/USclasssawah.mat');
%sungai
mat7= load('GAMBAR LATIH/sungai/USsungai.mat');
cmat7= load('GAMBAR LATIH/sungai/USclasssungai.mat');

mat=[mat1.USmat; mat2.USmat; mat3.USmat; mat4.USmat; mat5.USmat; mat6.USmat; mat7.USmat];
cmat=[cmat1.USclass; cmat2.USclass; cmat3.USclass; cmat4.USclass; cmat5.USclass; cmat6.USclass; cmat7.USclass];

%end
    case 6
%if strcmp( str, 'UV Matrix' )
%hutan
mat1= load('GAMBAR LATIH/hutan/UVhutan.mat');
cmat1= load('GAMBAR LATIH/hutan/UVclasshutan.mat');
%padang rumput
mat2= load('GAMBAR LATIH/padang rumput/UVpadang_rumput.mat');
cmat2= load('GAMBAR LATIH/padang rumput/UVclasspadang_rumput.mat');
%pelabuhan
mat3= load('GAMBAR LATIH/pelabuhan/UVpelabuhan.mat');
cmat3= load('GAMBAR LATIH/pelabuhan/UVclasspelabuhan.mat');
%permukiman
mat4= load('GAMBAR LATIH/permukiman/UVpermukiman.mat');
cmat4= load('GAMBAR LATIH/permukiman/UVclasspermukiman.mat');
%perkebunan
mat5= load('GAMBAR LATIH/perkebunan/UVperkebunan.mat');
cmat5= load('GAMBAR LATIH/perkebunan/UVclassperkebunan.mat');
%sawah
mat6= load('GAMBAR LATIH/sawah/UVsawah.mat');
cmat6= load('GAMBAR LATIH/sawah/UVclasssawah.mat');
%sungai
mat7= load('GAMBAR LATIH/sungai/UVsungai.mat');
cmat7= load('GAMBAR LATIH/sungai/UVclasssungai.mat');

mat=[mat1.UVmat; mat2.UVmat; mat3.UVmat; mat4.UVmat; mat5.UVmat; mat6.UVmat; mat7.UVmat];
cmat=[cmat1.UVclass; cmat2.UVclass; cmat3.UVclass; cmat4.UVclass; cmat5.UVclass; cmat6.UVclass; cmat7.UVclass];

%end
    case 7
%if strcmp( str, 'SV Matrix' )
%hutan
mat1= load('GAMBAR LATIH/hutan/SVhutan.mat');
cmat1= load('GAMBAR LATIH/hutan/SVclasshutan.mat');
%padang rumput
mat2= load('GAMBAR LATIH/padang rumput/SVpadang_rumput.mat');
cmat2= load('GAMBAR LATIH/padang rumput/SVclasspadang_rumput.mat');
%pelabuhan
mat3= load('GAMBAR LATIH/pelabuhan/SVpelabuhan.mat');
cmat3= load('GAMBAR LATIH/pelabuhan/SVclasspelabuhan.mat');
%permukiman
mat4= load('GAMBAR LATIH/permukiman/SVpermukiman.mat');
cmat4= load('GAMBAR LATIH/permukiman/SVclasspermukiman.mat');
%perkebunan
mat5= load('GAMBAR LATIH/perkebunan/SVperkebunan.mat');
cmat5= load('GAMBAR LATIH/perkebunan/SVclassperkebunan.mat');
%sawah
mat6= load('GAMBAR LATIH/sawah/SVsawah.mat');
cmat6= load('GAMBAR LATIH/sawah/SVclasssawah.mat');
%sungai
mat7= load('GAMBAR LATIH/sungai/SVsungai.mat');
cmat7= load('GAMBAR LATIH/sungai/SVclasssungai.mat');

mat=[mat1.SVmat; mat2.SVmat; mat3.SVmat; mat4.SVmat; mat5.SVmat; mat6.SVmat; mat7.SVmat];
cmat=[cmat1.SVclass; cmat2.SVclass; cmat3.SVclass; cmat4.SVclass; cmat5.SVclass; cmat6.SVclass; cmat7.SVclass];

%end
    case 8
%if strcmp( str, 'USV Matrix' )
%hutan
mat1= load('GAMBAR LATIH/hutan/USVhutan.mat');
cmat1= load('GAMBAR LATIH/hutan/USVclasshutan.mat');
%padang rumput
mat2= load('GAMBAR LATIH/padang rumput/USVpadang_rumput.mat');
cmat2= load('GAMBAR LATIH/padang rumput/USVclasspadang_rumput.mat');
%pelabuhan
mat3= load('GAMBAR LATIH/pelabuhan/USVpelabuhan.mat');
cmat3= load('GAMBAR LATIH/pelabuhan/USVclasspelabuhan.mat');
%permukiman
mat4= load('GAMBAR LATIH/permukiman/USVpermukiman.mat');
cmat4= load('GAMBAR LATIH/permukiman/USVclasspermukiman.mat');
%perkebunan
mat5= load('GAMBAR LATIH/perkebunan/USVperkebunan.mat');
cmat5= load('GAMBAR LATIH/perkebunan/USVclassperkebunan.mat');
%sawah
mat6= load('GAMBAR LATIH/sawah/USVsawah.mat');
cmat6= load('GAMBAR LATIH/sawah/USVclasssawah.mat');
%sungai
mat7= load('GAMBAR LATIH/sungai/USVsungai.mat');
cmat7= load('GAMBAR LATIH/sungai/USVclasssungai.mat');

mat=[mat1.USVmat; mat2.USVmat; mat3.USVmat; mat4.USVmat; mat5.USVmat; mat6.USVmat; mat7.USVmat];
cmat=[cmat1.USVclass; cmat2.USVclass; cmat3.USVclass; cmat4.USVclass; cmat5.USVclass; cmat6.USVclass; cmat7.USVclass];

end

%set(handles.text40, 'String', str);

set(handles.text2, 'String', 'Tidak Diketahui');
set(handles.text11, 'String', 'Tidak Diketahui');

widthBox=get(handles.edit1,'String');
ws = str2double(widthBox);

%str=get(handles.text40,'String');
%z = clock; 
tic; %waktu komputasi mulai
 
 GuiHandle = ancestor(hObject, 'figure');

waitbar(.50,f,'Processing your data');
switch str
    case 1
%if strcmp( str, '1' )
[label,D] = kNearestNeighbors(handles.A8, mat, cmat, ws, GuiHandle);
label = label{1};
D = mean(D);
%end
    case 2
%if strcmp( str, 'U Matrix' )
[label,D] = kNearestNeighbors(handles.A1, mat, cmat, ws, GuiHandle);
label = label{1};
D = mean(D);
%end
    case 3
%if strcmp( str, 'S Matrix' )
[label,D] = kNearestNeighbors(handles.A2, mat, cmat, ws, GuiHandle);
label = label{1};
D = mean(D);
%end
    case 4
%if strcmp( str, 'V Matrix' )
[label,D] = kNearestNeighbors(handles.A3, mat, cmat, ws, GuiHandle);
label = label{1};
D = mean(D);
%end
    case 5
%if strcmp( str, 'US Matrix' )
[label,D] = kNearestNeighbors(handles.A4, mat, cmat, ws, GuiHandle);
label = label{1};
D = mean(D);
%end
    case 6
%if strcmp( str, 'SV Matrix' )
[label,D] = kNearestNeighbors(handles.A5, mat, cmat, ws, GuiHandle);
label = label{1};
D = mean(D);
%end
    case 7
%if strcmp( str, 'UV Matrix' )
[label,D] = kNearestNeighbors(handles.A6, mat, cmat, ws, GuiHandle);
label = label{1};
D = mean(D);
%end
    case 8
%if strcmp( str, 'USV Matrix' )
[label,D] = kNearestNeighbors(handles.A7, mat, cmat, ws, GuiHandle);
label = label{1};
D = mean(D);
end


waitbar(1,f,'Finishing');
pause(0.1)
if label == "sungai"
     set(handles.text2, 'String', 'Tidak Bervegetasi'); 
         set(handles.text11, 'String', 'Sungai');
end

if label == "sawah"
     set(handles.text2, 'String', 'Bervegetasi');
         set(handles.text11, 'String', 'Sawah');
end

if label == "perkebunan"
     set(handles.text2, 'String', 'Bervegetasi');
         set(handles.text11, 'String', 'Perkebunan');
end

if label == "permukiman"
     set(handles.text2, 'String', 'Tidak Bervegetasi');
         set(handles.text11, 'String', 'Permukiman');
end

if label == "pelabuhan"
     set(handles.text2, 'String', 'Tidak Bervegetasi');
         set(handles.text11, 'String', 'Pelabuhan');
end

if label == "padang rumput"
     set(handles.text2, 'String', 'Bervegetasi');
         set(handles.text11, 'String', 'Padang Rumput');
end

if label == "hutan"
     set(handles.text2, 'String', 'Bervegetasi');
         set(handles.text11, 'String', 'Hutan');
end

close(f)

%waktu=etime(clock, z)
waktu=toc; %waktu komputasi selesai
set(handles.text30, 'String', waktu);
set(handles.text31, 'String', D);
guidata(hObject,handles)



% --- Executes on button press in radiobutton17.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton17


% --- Executes on button press in radiobutton18.
function radiobutton18_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton18


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(findobj('style','axes12'), 'Value', 0);
set(findobj('style','axes19'), 'Value', 0);
set(findobj('style','radiobutton18'), 'Value', 0);
set(handles.text2, 'String', '.....');
set(handles.text11, 'String', '.....');
set(handles.text30, 'String', '0');
set(handles.text31, 'String', '0');
set(handles.text64, 'String', '0');
set(handles.edit1, 'String', '1');
set(handles.radiobutton18, 'String', 'None');
set(handles.radiobutton18, 'Value', 1);
cla(handles.axes12);
cla(handles.axes19);
cla(handles.axes15);
cla(handles.axes17);
cla(handles.axes18);
cla(handles.axes27);
cla(handles.axes30);
cla(handles.axes31);
cla(handles.axes32);


% --- Executes on button press in pushbutton16.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic
f = waitbar(0,'Please wait...');
SVDtrain_hutan;
waitbar(.15,f,'Processing your data');
SVDtrain_padangrumput;
waitbar(.30,f,'Processing your data');
SVDtrain_pelabuhan;
waitbar(.45,f,'Processing your data');
SVDtrain_permukiman;
waitbar(.60,f,'Processing your data');
SVDtrain_perkebunan;
waitbar(.70,f,'Processing your data');
SVDtrain_sawah;
waitbar(.80,f,'Processing your data');
SVDtrain_sungai;
waitbar(.90,f,'Processing your data');
waitbar(1,f,'Finishing');
pause(0.1)
t=toc;
close(f)
set(handles.text64, 'String', t);



function edit41_Callback(hObject, eventdata, handles)
% hObject    handle to edit41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit41 as text
%        str2double(get(hObject,'String')) returns contents of edit41 as a double


% --- Executes during object creation, after setting all properties.
function edit41_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
