function varargout = sepia(varargin)
% SEPIA MATLAB code for sepia.fig
%      SEPIA, by itself, creates a new SEPIA or raises the existing
%      singleton*.
%
%      H = SEPIA returns the handle to a new SEPIA or the handle to
%      the existing singleton*.
%
%      SEPIA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SEPIA.M with the given input arguments.
%
%      SEPIA('Property','Value',...) creates a new SEPIA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sepia_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sepia_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sepia

% Last Modified by GUIDE v2.5 03-Nov-2019 15:25:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sepia_OpeningFcn, ...
                   'gui_OutputFcn',  @sepia_OutputFcn, ...
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


% --- Executes just before sepia is made visible.
function sepia_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sepia (see VARARGIN)

% Choose default command line output for sepia
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sepia wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sepia_OutputFcn(hObject, eventdata, handles) 
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


ImgOrg=im2double(ImgColor);
[az,ay,ax]=size(ImgOrg);

a_color=ImgOrg;
a_sepia=zeros(size(ImgOrg));

%%Matriz de tonos sepia cafe claro
m_sepia=[0.393, 0.769, 0.189
         0.349, 0.686,  0.168
         0.272, 0.534,  0.131];
     
a_sepia(:,:,1) =a_color(:,:,1)*m_sepia(1,1)+a_color(:,:,2)*m_sepia(1,2)+a_color(:,:,3)*m_sepia(1,3);
a_sepia(:,:,2) =a_color(:,:,1)*m_sepia(2,1)+a_color(:,:,2)*m_sepia(2,2)+a_color(:,:,3)*m_sepia(2,3);
a_sepia(:,:,3) =a_color(:,:,1)*m_sepia(3,1)+a_color(:,:,2)*m_sepia(3,2)+a_color(:,:,3)*m_sepia(3,3);

subplot(handles.color);imshow(a_color),title('imagen Color');
subplot(handles.sepia);imshow(a_sepia);title('Imagen sepia');
