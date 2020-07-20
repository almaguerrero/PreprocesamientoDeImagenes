function varargout = HistoTresCanales(varargin)
% HISTOTRESCANALES MATLAB code for HistoTresCanales.fig
%      HISTOTRESCANALES, by itself, creates a new HISTOTRESCANALES or raises the existing
%      singleton*.
%
%      H = HISTOTRESCANALES returns the handle to a new HISTOTRESCANALES or the handle to
%      the existing singleton*.
%
%      HISTOTRESCANALES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HISTOTRESCANALES.M with the given input arguments.
%
%      HISTOTRESCANALES('Property','Value',...) creates a new HISTOTRESCANALES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HistoTresCanales_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HistoTresCanales_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HistoTresCanales

% Last Modified by GUIDE v2.5 27-Oct-2019 09:37:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HistoTresCanales_OpeningFcn, ...
                   'gui_OutputFcn',  @HistoTresCanales_OutputFcn, ...
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


% --- Executes just before HistoTresCanales is made visible.
function HistoTresCanales_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HistoTresCanales (see VARARGIN)

% Choose default command line output for HistoTresCanales
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HistoTresCanales wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = HistoTresCanales_OutputFcn(hObject, eventdata, handles) 
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
subplot(handles.color),imshow(ImgColor),title('imagen Color');

Rojo=ImgColor(:,:,1)
Verde=ImgColor(:,:,2)
Azul=ImgColor(:,:,3)
title('histograma de los tres canales')
figure,
subplot(2,3,1);imshow(Rojo)
subplot(2,3,2);imshow(Verde)
subplot(2,3,3);imshow(Azul)
subplot(2,3,4);imhist(Rojo)
subplot(2,3,5);imhist(Verde)
subplot(2,3,6);imhist(Azul)
