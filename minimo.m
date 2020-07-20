function varargout = minimo(varargin)
% MINIMO MATLAB code for minimo.fig
%      MINIMO, by itself, creates a new MINIMO or raises the existing
%      singleton*.
%
%      H = MINIMO returns the handle to a new MINIMO or the handle to
%      the existing singleton*.
%
%      MINIMO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MINIMO.M with the given input arguments.
%
%      MINIMO('Property','Value',...) creates a new MINIMO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before minimo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to minimo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help minimo

% Last Modified by GUIDE v2.5 17-Nov-2019 19:45:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @minimo_OpeningFcn, ...
                   'gui_OutputFcn',  @minimo_OutputFcn, ...
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


% --- Executes just before minimo is made visible.
function minimo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to minimo (see VARARGIN)

% Choose default command line output for minimo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes minimo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = minimo_OutputFcn(hObject, eventdata, handles) 
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
A=ImgColor;
A = rgb2gray(A);
B=zeros(size(A));

modifyA=padarray(A,[1 1]);

        x=[1:3]';
        y=[1:3]';
       
for i= 1:size(modifyA,1)-2
    for j=1:size(modifyA,2)-2
       window=reshape(modifyA(i+x-1,j+y-1),[],1);
        B(i,j)=min(window);
    end
end
B=uint8(B);
subplot(handles.filtro),imshow(B),title('Filtro min');
