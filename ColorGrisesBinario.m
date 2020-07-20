function varargout = ColorGrisesBinario(varargin)
% COLORGRISESBINARIO MATLAB code for ColorGrisesBinario.fig
%      COLORGRISESBINARIO, by itself, creates a new COLORGRISESBINARIO or raises the existing
%      singleton*.
%
%      H = COLORGRISESBINARIO returns the handle to a new COLORGRISESBINARIO or the handle to
%      the existing singleton*.
%
%      COLORGRISESBINARIO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COLORGRISESBINARIO.M with the given input arguments.
%
%      COLORGRISESBINARIO('Property','Value',...) creates a new COLORGRISESBINARIO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ColorGrisesBinario_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ColorGrisesBinario_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ColorGrisesBinario

% Last Modified by GUIDE v2.5 16-Nov-2019 10:57:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ColorGrisesBinario_OpeningFcn, ...
                   'gui_OutputFcn',  @ColorGrisesBinario_OutputFcn, ...
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


% --- Executes just before ColorGrisesBinario is made visible.
function ColorGrisesBinario_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ColorGrisesBinario (see VARARGIN)

% Choose default command line output for ColorGrisesBinario
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ColorGrisesBinario wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ColorGrisesBinario_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_carga.
function btn_carga_Callback(hObject, eventdata, handles)
% hObject    handle to btn_carga (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[nombre]=uigetfile('*.jpg','Abrir imagen');
if nombre == 0
  return
end
img = imread(fullfile(nombre));
subplot(handles.color),imshow(img),title('imagen Color');
%%gris
Gris=rgb2gray(img);
subplot(handles.gris),imshow(Gris);title('GRAY')

%%Binaria
binaria=im2bw(Gris,0.5);
subplot(handles.binario),imshow(binaria);title('Binaria')
