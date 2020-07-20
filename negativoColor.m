function varargout = negativoColor(varargin)
% NEGATIVOCOLOR MATLAB code for negativoColor.fig
%      NEGATIVOCOLOR, by itself, creates a new NEGATIVOCOLOR or raises the existing
%      singleton*.
%
%      H = NEGATIVOCOLOR returns the handle to a new NEGATIVOCOLOR or the handle to
%      the existing singleton*.
%
%      NEGATIVOCOLOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEGATIVOCOLOR.M with the given input arguments.
%
%      NEGATIVOCOLOR('Property','Value',...) creates a new NEGATIVOCOLOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before negativoColor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to negativoColor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help negativoColor

% Last Modified by GUIDE v2.5 16-Nov-2019 10:59:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @negativoColor_OpeningFcn, ...
                   'gui_OutputFcn',  @negativoColor_OutputFcn, ...
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


% --- Executes just before negativoColor is made visible.
function negativoColor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to negativoColor (see VARARGIN)

% Choose default command line output for negativoColor
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes negativoColor wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = negativoColor_OutputFcn(hObject, eventdata, handles) 
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

[ax,ay,az]= size(ImgColor);

for m=1:ax
 for n=1:ay
   for o=1:az
     ImgColorNeg(m,n,o)=255-ImgColor(m,n,o);
   end
 end
end
subplot(handles.negativa);imshow(ImgColorNeg);title('ColorNegativo');
