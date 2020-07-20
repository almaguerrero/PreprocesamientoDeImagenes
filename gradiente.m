function varargout = gradiente(varargin)
% GRADIENTE MATLAB code for gradiente.fig
%      GRADIENTE, by itself, creates a new GRADIENTE or raises the existing
%      singleton*.
%
%      H = GRADIENTE returns the handle to a new GRADIENTE or the handle to
%      the existing singleton*.
%
%      GRADIENTE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRADIENTE.M with the given input arguments.
%
%      GRADIENTE('Property','Value',...) creates a new GRADIENTE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gradiente_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gradiente_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gradiente

% Last Modified by GUIDE v2.5 15-Nov-2019 19:58:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gradiente_OpeningFcn, ...
                   'gui_OutputFcn',  @gradiente_OutputFcn, ...
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


% --- Executes just before gradiente is made visible.
function gradiente_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gradiente (see VARARGIN)

% Choose default command line output for gradiente
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gradiente wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gradiente_OutputFcn(hObject, eventdata, handles) 
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

I = ImgColor;
I=rgb2gray(I);
[Gx, Gy] = imgradientxy(I,'prewitt');
subplot(handles.union);imshowpair(Gx, Gy, 'montage');title('')

P = atan2(Gy,Gx)
subplot(handles.grad),imshow(P),title('Ángulo');

Gx_c=Gx.^2
Gy_c=Gy.^2

total=Gx_c+Gy_c;
B = sqrt(total)
subplot(handles.mag),imshow(B),title('Magnitud');


