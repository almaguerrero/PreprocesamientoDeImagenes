function varargout = bool(varargin)
% BOOL MATLAB code for bool.fig
%      BOOL, by itself, creates a new BOOL or raises the existing
%      singleton*.
%
%      H = BOOL returns the handle to a new BOOL or the handle to
%      the existing singleton*.
%
%      BOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BOOL.M with the given input arguments.
%
%      BOOL('Property','Value',...) creates a new BOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bool

% Last Modified by GUIDE v2.5 03-Nov-2019 13:35:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bool_OpeningFcn, ...
                   'gui_OutputFcn',  @bool_OutputFcn, ...
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


% --- Executes just before bool is made visible.
function bool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bool (see VARARGIN)

% Choose default command line output for bool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bool wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = bool_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%subplot(handles.img2),imshow(img),title('imagen 2');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A=get(handles.img1);
B=get(handles.img2);

A1=imbinarize(A)
%%muestra la imagen con ls instruccion imagesc
%%y el mapa de colores en gris para poder visualizar la imagen binaria
%figure,imagesc(A);colormap(gray);
subplot(handles.img1),imshow(A1),title('imagen 1');


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=imread('taj.jpg');
%figure, imshow(a); title('color');
subplot(handles.img1),imshow(a),title('imagen 1');
%imresize
A = imresize(a,[300 300]);
Gris=rgb2gray(A);
binaria=im2bw(Gris,0.5);
subplot(handles.b1),imshow(binaria);title('Binaria')

b=imread('F.jpg');
%figure, imshow(a); title('color');
subplot(handles.img2),imshow(b),title('imagen 2');
%imresize
B = imresize(b,[300 300]);
Gris=rgb2gray(B);
binaria2=im2bw(Gris,0.5);
subplot(handles.b2),imshow(binaria2);title('Binaria')

c=A&B
subplot(handles.and),imagesc(c);colormap(gray)


d=A|B
subplot(handles.or),imagesc(d);colormap(gray)

e = xor(A,B)
subplot(handles.xor),imagesc(e);colormap(gray)
