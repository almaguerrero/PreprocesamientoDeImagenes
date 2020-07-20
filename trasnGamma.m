function varargout = trasnGamma(varargin)
% TRASNGAMMA MATLAB code for trasnGamma.fig
%      TRASNGAMMA, by itself, creates a new TRASNGAMMA or raises the existing
%      singleton*.
%
%      H = TRASNGAMMA returns the handle to a new TRASNGAMMA or the handle to
%      the existing singleton*.
%
%      TRASNGAMMA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRASNGAMMA.M with the given input arguments.
%
%      TRASNGAMMA('Property','Value',...) creates a new TRASNGAMMA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before trasnGamma_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to trasnGamma_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help trasnGamma

% Last Modified by GUIDE v2.5 03-Nov-2019 20:05:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @trasnGamma_OpeningFcn, ...
                   'gui_OutputFcn',  @trasnGamma_OutputFcn, ...
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


% --- Executes just before trasnGamma is made visible.
function trasnGamma_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to trasnGamma (see VARARGIN)

% Choose default command line output for trasnGamma
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes trasnGamma wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = trasnGamma_OutputFcn(hObject, eventdata, handles) 
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
subplot(handles.color),imshow(ImgColor),title('imagen Original');
subplot(handles.hist1);imhist(ImgColor);title('histograma color')

Gris=rgb2gray(ImgColor); %%
subplot(handles.gris);imshow(Gris);title('GRAY')
subplot(handles.hist2);imhist(Gris);title('histograma gris')
% [X,map] = Gris;
% I = ind2gray(X,map);
J = imadjust(ImgColor,[],[],0.2);
subplot(handles.gamma);imshow(J);title('Gamma')
subplot(handles.hist3);imhist(J);title('histograma gamma')
