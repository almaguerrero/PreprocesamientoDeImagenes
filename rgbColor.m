function varargout = rgbColor(varargin)
% RGBCOLOR MATLAB code for rgbColor.fig
%      RGBCOLOR, by itself, creates a new RGBCOLOR or raises the existing
%      singleton*.
%
%      H = RGBCOLOR returns the handle to a new RGBCOLOR or the handle to
%      the existing singleton*.
%
%      RGBCOLOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RGBCOLOR.M with the given input arguments.
%
%      RGBCOLOR('Property','Value',...) creates a new RGBCOLOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before rgbColor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to rgbColor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help rgbColor

% Last Modified by GUIDE v2.5 26-Oct-2019 21:25:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @rgbColor_OpeningFcn, ...
                   'gui_OutputFcn',  @rgbColor_OutputFcn, ...
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


% --- Executes just before rgbColor is made visible.
function rgbColor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to rgbColor (see VARARGIN)

% Choose default command line output for rgbColor
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes rgbColor wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = rgbColor_OutputFcn(hObject, eventdata, handles) 
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
[nombre]=uigetfile('*.jpg','Abrir imagen');
if nombre == 0
  return
end
ImgColor = imread(fullfile(nombre));
subplot(handles.color),imshow(ImgColor),title('imagen Original');

b_rojo=ImgColor;
b_verde=ImgColor;
b_azul=ImgColor;

b_rojo(:,:,2)=0;
b_rojo(:,:,3)=0;

b_verde(:,:,1)=0;
b_verde(:,:,3)=0;

b_azul(:,:,1)=0;
b_azul(:,:,2)=0;


subplot(handles.r); imshow(b_rojo); title('Canal Rojo');
subplot(handles.g); imshow(b_verde); title('Canal Verde');
subplot(handles.b); imshow(b_azul); title('Canal Azul');

a_recuperada1=b_rojo+b_verde+b_azul;
subplot(handles.suma); imshow(a_recuperada1);title('suma de las imagenes');
