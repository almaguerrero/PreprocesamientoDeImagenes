function varargout = foto1(varargin)
% FOTO1 MATLAB code for foto1.fig
%      FOTO1, by itself, creates a new FOTO1 or raises the existing
%      singleton*.
%
%      H = FOTO1 returns the handle to a new FOTO1 or the handle to
%      the existing singleton*.
%
%      FOTO1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FOTO1.M with the given input arguments.
%
%      FOTO1('Property','Value',...) creates a new FOTO1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before foto1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to foto1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help foto1

% Last Modified by GUIDE v2.5 03-Nov-2019 13:28:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @foto1_OpeningFcn, ...
                   'gui_OutputFcn',  @foto1_OutputFcn, ...
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


% --- Executes just before foto1 is made visible.
function foto1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to foto1 (see VARARGIN)

% Choose default command line output for foto1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes foto1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = foto1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ImgOrg1 = imread('A.jpg');
ImgOrg1=im2double(ImgOrg1);
[ax,ay,az]=size(ImgOrg1);
%ImgOrg2 = imread('volleyball1.jpg');
%ImgOrg2 = imread('university-of-tsukuba-campus.jpg');
ImgOrg2 = imread('F.jpg');
ImgOrg2=im2double(ImgOrg2);
[bx,by,bz]=size(ImgOrg2);

ImgOrg1=imresize(ImgOrg1,[bx,by]);
[ax,ay,az]=size(ImgOrg1);


subplot(handles.imagen1); imshow(ImgOrg1);title('Imagen 1');
subplot(handles.imagen2); imshow(ImgOrg2);title('Imagen 2');

ImgGris=rgb2gray(ImgOrg1);
[bx,by]=size(ImgGris);
ImgBW=ImgGris;
umbral=194/255.0;
ImgBW=imbinarize(ImgGris,umbral);

for m=1:bx
    for n=1:by
        if (ImgGris(m,n)<umbral)
                ImgBW(m,n)=0;
            else
                ImgBW(m,n)=1;
        end
    end
end

NegImgBW=1-ImgBW;

% figure,
% subplot(1,2,1);imshow(ImgBW)
% subplot(1,2,2);imshow(NegImgBW);

NegImgBW2(:,:,1)=NegImgBW;
NegImgBW2(:,:,2)=NegImgBW;
NegImgBW2(:,:,3)=NegImgBW;

ImgAux1=ImgOrg1.*NegImgBW2;
%figure,imshow(ImgAux1);

ImgBW22(:,:,1)=ImgBW;
ImgBW22(:,:,2)=ImgBW;
ImgBW22(:,:,3)=ImgBW;

ImgBW3=ImgBW22;
ImgAux2=ImgOrg2.*ImgBW3;
% figure,imshow(ImgAux2);

ImgMontaje=ImgAux1+ImgAux2;
% figure,imshow(ImgMontaje);
subplot(handles.foto); imshow(ImgMontaje);title('Imagen 2');
