function varargout = geo(varargin)
% GEO MATLAB code for geo.fig
%      GEO, by itself, creates a new GEO or raises the existing
%      singleton*.
%
%      H = GEO returns the handle to a new GEO or the handle to
%      the existing singleton*.
%
%      GEO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GEO.M with the given input arguments.
%
%      GEO('Property','Value',...) creates a new GEO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before geo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to geo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help geo

% Last Modified by GUIDE v2.5 20-Nov-2019 10:22:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @geo_OpeningFcn, ...
                   'gui_OutputFcn',  @geo_OutputFcn, ...
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


% --- Executes just before geo is made visible.
function geo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to geo (see VARARGIN)

% Choose default command line output for geo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes geo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = geo_OutputFcn(hObject, eventdata, handles) 
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
I = im2double(ImgColor);

h = ones(5,5);

geo_mean = imfilter(log(I), h, 'replicate');
geo_mean = exp(geo_mean);
geo_mean = geo_mean .^ (1/numel(h));
subplot(handles.filtro),imshow(geo_mean, []),title('imagen mediana geométrica');
