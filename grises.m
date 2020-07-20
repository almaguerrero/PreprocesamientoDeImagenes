function varargout = grises(varargin)
% GRISES MATLAB code for grises.fig
%      GRISES, by itself, creates a new GRISES or raises the existing
%      singleton*.
%
%      H = GRISES returns the handle to a new GRISES or the handle to
%      the existing singleton*.
%
%      GRISES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRISES.M with the given input arguments.
%
%      GRISES('Property','Value',...) creates a new GRISES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before grises_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to grises_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help grises

% Last Modified by GUIDE v2.5 03-Nov-2019 14:42:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @grises_OpeningFcn, ...
                   'gui_OutputFcn',  @grises_OutputFcn, ...
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


% --- Executes just before grises is made visible.
function grises_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to grises (see VARARGIN)

% Choose default command line output for grises
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes grises wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = grises_OutputFcn(hObject, eventdata, handles) 
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
ImgOrg=im2double(ImgColor);

ImgGrisProm=(ImgOrg(:,:,1)+ImgOrg(:,:,2)+ImgOrg(:,:,3))/3.0;
ImgGrisPrecisa=0.299*ImgOrg(:,:,1)+0.587*ImgOrg(:,:,2)+0.114*ImgOrg(:,:,3);
ImgGrisMatlab=rgb2gray(ImgOrg);

subplot(handles.color),imshow(ImgColor),title('imagen Color');
subplot(handles.prom);imshow(ImgGrisProm);title('Promedio');
subplot(handles.pres);imshow(ImgGrisPrecisa);title('Precisa');
subplot(handles.mat);imshow(ImgGrisMatlab);title('Matlab');
