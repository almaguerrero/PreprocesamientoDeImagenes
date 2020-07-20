function varargout = derivada(varargin)
% DERIVADA MATLAB code for derivada.fig
%      DERIVADA, by itself, creates a new DERIVADA or raises the existing
%      singleton*.
%
%      H = DERIVADA returns the handle to a new DERIVADA or the handle to
%      the existing singleton*.
%
%      DERIVADA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DERIVADA.M with the given input arguments.
%
%      DERIVADA('Property','Value',...) creates a new DERIVADA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before derivada_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to derivada_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help derivada

% Last Modified by GUIDE v2.5 25-Nov-2019 00:20:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @derivada_OpeningFcn, ...
                   'gui_OutputFcn',  @derivada_OutputFcn, ...
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


% --- Executes just before derivada is made visible.
function derivada_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to derivada (see VARARGIN)

% Choose default command line output for derivada
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes derivada wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = derivada_OutputFcn(hObject, eventdata, handles) 
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


I=rgb2gray(ImgColor);
kernelX=[-1 1]
kernelY=[-1; 1]
filteredImageX = conv2(double(I), kernelX, 'same');
filteredImageY = conv2(double(I), kernelY, 'same');
subplot(handles.equis),imshow(filteredImageX, []);,title('Derivada X');
subplot(handles.ye),imshow(filteredImageY, []);,title('DerivadaY');

