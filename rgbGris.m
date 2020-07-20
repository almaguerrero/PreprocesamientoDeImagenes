function varargout = rgbGris(varargin)
% RGBGRIS MATLAB code for rgbGris.fig
%      RGBGRIS, by itself, creates a new RGBGRIS or raises the existing
%      singleton*.
%
%      H = RGBGRIS returns the handle to a new RGBGRIS or the handle to
%      the existing singleton*.
%
%      RGBGRIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RGBGRIS.M with the given input arguments.
%
%      RGBGRIS('Property','Value',...) creates a new RGBGRIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before rgbGris_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to rgbGris_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help rgbGris

% Last Modified by GUIDE v2.5 26-Oct-2019 22:38:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @rgbGris_OpeningFcn, ...
                   'gui_OutputFcn',  @rgbGris_OutputFcn, ...
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


% --- Executes just before rgbGris is made visible.
function rgbGris_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to rgbGris (see VARARGIN)

% Choose default command line output for rgbGris
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes rgbGris wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = rgbGris_OutputFcn(hObject, eventdata, handles) 
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

comp_rojo=ImgColor(:,:,1);
comp_verde=ImgColor(:,:,2);
comp_azul=ImgColor(:,:,3);

subplot(handles.r); imshow(comp_rojo); title('Canal Rojo');
subplot(handles.g); imshow(comp_verde); title('Canal Verde');
subplot(handles.b); imshow(comp_azul); title('Canal Azul');

a_recuperada1=comp_rojo+comp_verde+comp_azul;
subplot(handles.suma); imshow(a_recuperada1);title('suma de las imagenes en grises');
