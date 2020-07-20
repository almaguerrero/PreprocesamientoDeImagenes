function varargout = maxmin(varargin)
% MAXMIN MATLAB code for maxmin.fig
%      MAXMIN, by itself, creates a new MAXMIN or raises the existing
%      singleton*.
%
%      H = MAXMIN returns the handle to a new MAXMIN or the handle to
%      the existing singleton*.
%
%      MAXMIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAXMIN.M with the given input arguments.
%
%      MAXMIN('Property','Value',...) creates a new MAXMIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before maxmin_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to maxmin_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help maxmin

% Last Modified by GUIDE v2.5 24-Nov-2019 22:55:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @maxmin_OpeningFcn, ...
                   'gui_OutputFcn',  @maxmin_OutputFcn, ...
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


% --- Executes just before maxmin is made visible.
function maxmin_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to maxmin (see VARARGIN)

% Choose default command line output for maxmin
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes maxmin wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = maxmin_OutputFcn(hObject, eventdata, handles) 
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
ImgColor1 = imread(fullfile(nombre));
subplot(handles.color1),imshow(ImgColor1),title('imagen Color');

[nombre]=uigetfile('*.jpg','Abrir imagen');
if nombre == 0
  return
end
ImgColor2 = imread(fullfile(nombre));
subplot(handles.color2),imshow(ImgColor2),title('imagen Color');

I = imresize(ImgColor1,[300 300]);
IL = imresize(ImgColor2,[300 300]);
I=rgb2gray(I);
% I=double(I)
IL=rgb2gray(IL);
% IL=img2double(IL)
chalco=min(I, IL)
chalco1=max(I,IL)
subplot(handles.min),imshow(chalco),title('Min');
subplot(handles.max),imshow(chalco1),title('max');
