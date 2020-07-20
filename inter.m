function varargout = inter(varargin)
% INTER MATLAB code for inter.fig
%      INTER, by itself, creates a new INTER or raises the existing
%      singleton*.
%
%      H = INTER returns the handle to a new INTER or the handle to
%      the existing singleton*.
%
%      INTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTER.M with the given input arguments.
%
%      INTER('Property','Value',...) creates a new INTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before inter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to inter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help inter

% Last Modified by GUIDE v2.5 20-Nov-2019 11:03:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @inter_OpeningFcn, ...
                   'gui_OutputFcn',  @inter_OutputFcn, ...
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


% --- Executes just before inter is made visible.
function inter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to inter (see VARARGIN)

% Choose default command line output for inter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes inter wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = inter_OutputFcn(hObject, eventdata, handles) 
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

ImgOrg=ImgColor
tam=25;
ImgNearest=imresize(ImgOrg,tam,'nearest');
subplot(handles.vecinos),imshow(ImgNearest),title('Vecinos');
ImgBilinear=imresize(ImgOrg,tam,'bilinear');
subplot(handles.linear),imshow(ImgBilinear),title('bilinear');
ImgBicubica=imresize(ImgOrg,tam,'bicubic');
subplot(handles.cubica),imshow(ImgBicubica),title('bicubic');
