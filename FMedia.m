function varargout = FMedia(varargin)
% FMEDIA MATLAB code for FMedia.fig
%      FMEDIA, by itself, creates a new FMEDIA or raises the existing
%      singleton*.
%
%      H = FMEDIA returns the handle to a new FMEDIA or the handle to
%      the existing singleton*.
%
%      FMEDIA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FMEDIA.M with the given input arguments.
%
%      FMEDIA('Property','Value',...) creates a new FMEDIA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FMedia_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FMedia_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FMedia

% Last Modified by GUIDE v2.5 20-Nov-2019 09:10:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FMedia_OpeningFcn, ...
                   'gui_OutputFcn',  @FMedia_OutputFcn, ...
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


% --- Executes just before FMedia is made visible.
function FMedia_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FMedia (see VARARGIN)

% Choose default command line output for FMedia
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FMedia wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FMedia_OutputFcn(hObject, eventdata, handles) 
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
ImgOrg = imread(fullfile(nombre));
subplot(handles.color);imshow(ImgOrg),title('imagen Color');

im=ImgOrg
fn=imnoise(im,'salt & pepper',0.05);
h1=fspecial('average');
h2=fspecial('average',[9,9]);
media1=imfilter(fn,h1);
media2=imfilter(fn,h2);
subplot(handles.ruido);imshow(fn),title('Imagen con ruido');
subplot(handles.limpia);imshow(media1),title('Filtro de media 3X3');
subplot(handles.limpia2),imshow(media2),title('Filtro de media 9X9');
