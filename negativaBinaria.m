function varargout = negativaBinaria(varargin)
% NEGATIVABINARIA MATLAB code for negativaBinaria.fig
%      NEGATIVABINARIA, by itself, creates a new NEGATIVABINARIA or raises the existing
%      singleton*.
%
%      H = NEGATIVABINARIA returns the handle to a new NEGATIVABINARIA or the handle to
%      the existing singleton*.
%
%      NEGATIVABINARIA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEGATIVABINARIA.M with the given input arguments.
%
%      NEGATIVABINARIA('Property','Value',...) creates a new NEGATIVABINARIA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before negativaBinaria_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to negativaBinaria_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help negativaBinaria

% Last Modified by GUIDE v2.5 26-Oct-2019 20:14:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @negativaBinaria_OpeningFcn, ...
                   'gui_OutputFcn',  @negativaBinaria_OutputFcn, ...
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


% --- Executes just before negativaBinaria is made visible.
function negativaBinaria_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to negativaBinaria (see VARARGIN)

% Choose default command line output for negativaBinaria
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes negativaBinaria wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = negativaBinaria_OutputFcn(hObject, eventdata, handles) 
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

ImgGris=rgb2gray(ImgColor) %%%gris
ImgBinaria=imbinarize(ImgGris)%%binaria
subplot(handles.binario);imshow(ImgBinaria);title('imagen Binaria')
[cx,cy]=size(ImgBinaria)
for m=1:cx
    for n=1:cy
           ImgBinariaNeg(m,n)=255-ImgBinaria(m,n);
    end
end

subplot(handles.negativa);imshow(ImgBinariaNeg);title('imagen Binaria negativa');
