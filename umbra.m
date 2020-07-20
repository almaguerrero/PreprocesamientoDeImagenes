function varargout = umbra(varargin)
% UMBRA MATLAB code for umbra.fig
%      UMBRA, by itself, creates a new UMBRA or raises the existing
%      singleton*.
%
%      H = UMBRA returns the handle to a new UMBRA or the handle to
%      the existing singleton*.
%
%      UMBRA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UMBRA.M with the given input arguments.
%
%      UMBRA('Property','Value',...) creates a new UMBRA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before umbra_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to umbra_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help umbra

% Last Modified by GUIDE v2.5 03-Nov-2019 10:16:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @umbra_OpeningFcn, ...
                   'gui_OutputFcn',  @umbra_OutputFcn, ...
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


% --- Executes just before umbra is made visible.
function umbra_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to umbra (see VARARGIN)

% Choose default command line output for umbra
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes umbra wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = umbra_OutputFcn(hObject, eventdata, handles) 
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

imgsize=size(ImgOrg)
if length(imgsize)==3
   ImgOrg-rgb2gray(ImgOrg); 
end

J = imresize(ImgOrg, 0.5);

J=im2double(J);


subplot(handles.color),imshow(J),title('imagen Original');
subplot(handles.hist); imhist(J); title('Histo de ImgOrg')


ImgDst=histeq(J)
[ax,ay]= size(J)
umbral=0.2;
for m=1:ax
    for n=1:ay
        if J(m,n)<umbral
            J(m,n)=0;
        else
            J(m,n)=1;
        end
    end
end


subplot(handles.bina); imshow(ImgDst); title('Umbralizda');
subplot(handles.hist1); imhist(ImgDst); title('Histo Umbralizada')
