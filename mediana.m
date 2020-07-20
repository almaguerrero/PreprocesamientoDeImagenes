function varargout = mediana(varargin)
% MEDIANA MATLAB code for mediana.fig
%      MEDIANA, by itself, creates a new MEDIANA or raises the existing
%      singleton*.
%
%      H = MEDIANA returns the handle to a new MEDIANA or the handle to
%      the existing singleton*.
%
%      MEDIANA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MEDIANA.M with the given input arguments.
%
%      MEDIANA('Property','Value',...) creates a new MEDIANA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mediana_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mediana_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mediana

% Last Modified by GUIDE v2.5 17-Nov-2019 19:37:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mediana_OpeningFcn, ...
                   'gui_OutputFcn',  @mediana_OutputFcn, ...
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


% --- Executes just before mediana is made visible.
function mediana_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mediana (see VARARGIN)

% Choose default command line output for mediana
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mediana wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mediana_OutputFcn(hObject, eventdata, handles) 
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

I=rgb2gray(ImgColor);

J = imnoise(I,'salt & pepper',0.02);
K = medfilt2(J);
subplot(handles.ruido),imshow(J),title('imagen ruido');
subplot(handles.filtro),imshow(K),title('imagen filtro mediana');
