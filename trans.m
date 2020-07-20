function varargout = trans(varargin)
% TRANS MATLAB code for trans.fig
%      TRANS, by itself, creates a new TRANS or raises the existing
%      singleton*.
%
%      H = TRANS returns the handle to a new TRANS or the handle to
%      the existing singleton*.
%
%      TRANS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANS.M with the given input arguments.
%
%      TRANS('Property','Value',...) creates a new TRANS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before trans_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to trans_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help trans

% Last Modified by GUIDE v2.5 02-Nov-2019 00:16:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @trans_OpeningFcn, ...
                   'gui_OutputFcn',  @trans_OutputFcn, ...
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


% --- Executes just before trans is made visible.
function trans_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to trans (see VARARGIN)

% Choose default command line output for trans
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes trans wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = trans_OutputFcn(hObject, eventdata, handles) 
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
subplot(handles.color),imshow(ImgColor),title('imagen Original'); %imhist(ImgOrg)
subplot(handles.hist1),imhist(ImgColor),title('imagen Original'); %imhist(ImgOrg)


% m=86;
% M=214;
% 
% R=(ImgColor-m)*(255/(M-m));
R= imadjustn(ImgColor);
%Gris=rgb2gray(a);
subplot(handles.r), imshow(R); title('Imagen estiramiento');
subplot(handles.hist2); imhist(R); title('Histo de estiramiento');
