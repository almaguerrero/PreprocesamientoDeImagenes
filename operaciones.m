function varargout = operaciones(varargin)
% OPERACIONES MATLAB code for operaciones.fig
%      OPERACIONES, by itself, creates a new OPERACIONES or raises the existing
%      singleton*.
%
%      H = OPERACIONES returns the handle to a new OPERACIONES or the handle to
%      the existing singleton*.
%
%      OPERACIONES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPERACIONES.M with the given input arguments.
%
%      OPERACIONES('Property','Value',...) creates a new OPERACIONES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before operaciones_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to operaciones_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help operaciones

% Last Modified by GUIDE v2.5 17-Nov-2019 18:20:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @operaciones_OpeningFcn, ...
                   'gui_OutputFcn',  @operaciones_OutputFcn, ...
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


% --- Executes just before operaciones is made visible.
function operaciones_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to operaciones (see VARARGIN)

% Choose default command line output for operaciones
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes operaciones wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = operaciones_OutputFcn(hObject, eventdata, handles) 
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

Gris=rgb2gray(ImgColor);
BW=im2bw(ImgColor,0.5);
BW3 = bwmorph(BW,'close');
BW4 = bwmorph(BW,'open');
BW5 = bwmorph(BW,'dilate');
BW6 = bwmorph(BW,'erode');
subplot(handles.cerradura),imshow(BW3),title('cerradura')
subplot(handles.apertura),imshow(BW4),title('abierto')
subplot(handles.dilatacion),imshow(BW5),title('dilatación')
subplot(handles.erosion),imshow(BW6),title('erosión')
