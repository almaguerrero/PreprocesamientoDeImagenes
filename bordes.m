function varargout = bordes(varargin)
% BORDES MATLAB code for bordes.fig
%      BORDES, by itself, creates a new BORDES or raises the existing
%      singleton*.
%
%      H = BORDES returns the handle to a new BORDES or the handle to
%      the existing singleton*.
%
%      BORDES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BORDES.M with the given input arguments.
%
%      BORDES('Property','Value',...) creates a new BORDES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bordes_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bordes_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bordes

% Last Modified by GUIDE v2.5 17-Nov-2019 23:56:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bordes_OpeningFcn, ...
                   'gui_OutputFcn',  @bordes_OutputFcn, ...
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


% --- Executes just before bordes is made visible.
function bordes_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bordes (see VARARGIN)

% Choose default command line output for bordes
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bordes wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = bordes_OutputFcn(hObject, eventdata, handles) 
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

I=ImgColor;
x=rgb2gray(I);
lab=[0 1 0;
     1 -4 1;
     0 1 0];

 ident=[0 0 0;
        0 1 0;
        0 0 0];
 f=3;
 mul=lab.*f;
 sum=mul+ident;
result= uint8(filter2(sum,x,'same'))

subplot(handles.borde),imshow(result),title('Bordes');

