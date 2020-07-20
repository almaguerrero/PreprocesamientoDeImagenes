function varargout = aritdos(varargin)
% ARITDOS MATLAB code for aritdos.fig
%      ARITDOS, by itself, creates a new ARITDOS or raises the existing
%      singleton*.
%
%      H = ARITDOS returns the handle to a new ARITDOS or the handle to
%      the existing singleton*.
%
%      ARITDOS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ARITDOS.M with the given input arguments.
%
%      ARITDOS('Property','Value',...) creates a new ARITDOS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before aritdos_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to aritdos_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help aritdos

% Last Modified by GUIDE v2.5 03-Nov-2019 21:01:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @aritdos_OpeningFcn, ...
                   'gui_OutputFcn',  @aritdos_OutputFcn, ...
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


% --- Executes just before aritdos is made visible.
function aritdos_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to aritdos (see VARARGIN)

% Choose default command line output for aritdos
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes aritdos wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = aritdos_OutputFcn(hObject, eventdata, handles) 
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
subplot(handles.color1),imshow(ImgColor),title('imagen Color');

[nombre]=uigetfile('*.jpg','Abrir imagen');
if nombre == 0
  return
end
ImgColor2 = imread(fullfile(nombre));
subplot(handles.color2),imshow(ImgColor2),title('imagen Color');



A = imresize(ImgColor,[300 300]);
M = imresize(ImgColor2,[300 300]);

R=abs(M-A)
S=(M+A)
MUL=M.*A
DIV=M./A
subplot(handles.suma),imshow(S),title('Suma');
subplot(handles.resta),imshow(R),title('Resta');
subplot(handles.multi),imshow(MUL),title('Multiplicación');
subplot(handles.div),imshow(DIV),title('División');
