function varargout = sobel(varargin)
% SOBEL MATLAB code for sobel.fig
%      SOBEL, by itself, creates a new SOBEL or raises the existing
%      singleton*.
%
%      H = SOBEL returns the handle to a new SOBEL or the handle to
%      the existing singleton*.
%
%      SOBEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOBEL.M with the given input arguments.
%
%      SOBEL('Property','Value',...) creates a new SOBEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sobel_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sobel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sobel

% Last Modified by GUIDE v2.5 15-Nov-2019 19:49:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sobel_OpeningFcn, ...
                   'gui_OutputFcn',  @sobel_OutputFcn, ...
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


% --- Executes just before sobel is made visible.
function sobel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sobel (see VARARGIN)

% Choose default command line output for sobel
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sobel wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sobel_OutputFcn(hObject, eventdata, handles) 
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
subplot(handles.colors),imshow(ImgColor),title('imagen Color');

I=rgb2gray(ImgColor);
%hallando contorno
BW = edge(I,'Prewitt');
%mostrando contorno
BW2 = edge(BW,'Prewitt');
subplot(handles.filtro1),imshow(BW2),title('Prewitt');

I=rgb2gray(ImgColor);
%hallando contorno
BW = edge(I,'Sobel');
%mostrando contorno
BW2 = edge(BW,'Sobel');
subplot(handles.filtro2),imshow(BW2),title('Sobel');
