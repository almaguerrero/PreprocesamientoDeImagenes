function varargout = histGYC(varargin)
% HISTGYC MATLAB code for histGYC.fig
%      HISTGYC, by itself, creates a new HISTGYC or raises the existing
%      singleton*.
%
%      H = HISTGYC returns the handle to a new HISTGYC or the handle to
%      the existing singleton*.
%
%      HISTGYC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HISTGYC.M with the given input arguments.
%
%      HISTGYC('Property','Value',...) creates a new HISTGYC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before histGYC_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to histGYC_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help histGYC

% Last Modified by GUIDE v2.5 16-Nov-2019 18:01:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @histGYC_OpeningFcn, ...
                   'gui_OutputFcn',  @histGYC_OutputFcn, ...
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


% --- Executes just before histGYC is made visible.
function histGYC_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to histGYC (see VARARGIN)

% Choose default command line output for histGYC
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes histGYC wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = histGYC_OutputFcn(hObject, eventdata, handles) 
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

ImgGris=rgb2gray(ImgColor) %%%gris
subplot(handles.gris),imshow(ImgGris),title('imagen grises');

subplot(handles.hist1),imhist(ImgColor),title('histograma Color');
subplot(handles.hist2),imhist(ImgGris),title('histograma grises');
