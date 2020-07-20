function varargout = trasnLineal(varargin)
% TRASNLINEAL MATLAB code for trasnLineal.fig
%      TRASNLINEAL, by itself, creates a new TRASNLINEAL or raises the existing
%      singleton*.
%
%      H = TRASNLINEAL returns the handle to a new TRASNLINEAL or the handle to
%      the existing singleton*.
%
%      TRASNLINEAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRASNLINEAL.M with the given input arguments.
%
%      TRASNLINEAL('Property','Value',...) creates a new TRASNLINEAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before trasnLineal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to trasnLineal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help trasnLineal

% Last Modified by GUIDE v2.5 01-Nov-2019 18:15:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @trasnLineal_OpeningFcn, ...
                   'gui_OutputFcn',  @trasnLineal_OutputFcn, ...
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


% --- Executes just before trasnLineal is made visible.
function trasnLineal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to trasnLineal (see VARARGIN)

% Choose default command line output for trasnLineal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes trasnLineal wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = trasnLineal_OutputFcn(hObject, eventdata, handles) 
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
