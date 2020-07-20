function varargout = His2DCyG(varargin)
% HIS2DCYG MATLAB code for His2DCyG.fig
%      HIS2DCYG, by itself, creates a new HIS2DCYG or raises the existing
%      singleton*.
%
%      H = HIS2DCYG returns the handle to a new HIS2DCYG or the handle to
%      the existing singleton*.
%
%      HIS2DCYG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HIS2DCYG.M with the given input arguments.
%
%      HIS2DCYG('Property','Value',...) creates a new HIS2DCYG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before His2DCyG_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to His2DCyG_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help His2DCyG

% Last Modified by GUIDE v2.5 03-Nov-2019 20:23:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @His2DCyG_OpeningFcn, ...
                   'gui_OutputFcn',  @His2DCyG_OutputFcn, ...
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


% --- Executes just before His2DCyG is made visible.
function His2DCyG_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to His2DCyG (see VARARGIN)

% Choose default command line output for His2DCyG
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes His2DCyG wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = His2DCyG_OutputFcn(hObject, eventdata, handles) 
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


Img_R=ImgOrg(:,:,1);
Img_G=ImgOrg(:,:,2);
Img_B=ImgOrg(:,:,3);
%
axes(handles.r1);
histogram2(Img_R,Img_B,'DisplayStyle','tile','ShowEmptyBins','on', ...
    'XBinLimits',[0 255],'YBinLimits',[0 255]);
axis equal
colorbar
xlabel('Rojo')
ylabel('Azul')
title('R y B')
%%%5
axes(handles.g1);
histogram2(Img_R,Img_G,'DisplayStyle','tile','ShowEmptyBins','on', ...
    'XBinLimits',[0 255],'YBinLimits',[0 255]);
axis equal
colorbar
xlabel('R')
ylabel('b')
title('R Y B')
%%%%
axes(handles.b1);
histogram2(Img_B,Img_G,'DisplayStyle','tile','ShowEmptyBins','on', ...
    'XBinLimits',[0 255],'YBinLimits',[0 255]);
axis equal
colorbar
xlabel('B')
ylabel('G')
title('B y G')
%%%
