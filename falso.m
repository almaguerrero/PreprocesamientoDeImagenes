function varargout = falso(varargin)
% FALSO MATLAB code for falso.fig
%      FALSO, by itself, creates a new FALSO or raises the existing
%      singleton*.
%
%      H = FALSO returns the handle to a new FALSO or the handle to
%      the existing singleton*.
%
%      FALSO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FALSO.M with the given input arguments.
%
%      FALSO('Property','Value',...) creates a new FALSO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before falso_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to falso_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help falso

% Last Modified by GUIDE v2.5 03-Nov-2019 16:05:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @falso_OpeningFcn, ...
                   'gui_OutputFcn',  @falso_OutputFcn, ...
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


% --- Executes just before falso is made visible.
function falso_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to falso (see VARARGIN)

% Choose default command line output for falso
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes falso wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = falso_OutputFcn(hObject, eventdata, handles) 
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
x = ImgOrg;
%conversion a pseudocolor
xpseu = zeros(size(x));
%obtenemos el tamaño de la imagen
tam = size(x);

%x = rgb2gray(x);

for i = 1 : tam(1)
for j = 1 : tam(2)
if (x(i,j,1) <= 0 && x(i,j,1) < 95)
xpseu(i,j,1) = double(0);
elseif (x(i,j,1) < 95 && x(i,j,1) < 159)
xpseu(i,j,1) = double((x(i,j,1)*4)-34);
elseif (x(i,j,1) <= 159 && x(i,j,1) <= 223)
xpseu(i,j,1) = double(255);
elseif (x(i,j,1) < 223 && x(i,j,1) <= 255)
xpseu(i,j,1) = double((x(i,j,1)*-4)+892);
end
end
end

for i = 1 : tam(1)
for j = 1 : tam(2)
if (x(i,j,2) <= 0 && x(i,j,2) < 31)
xpseu(i,j,2) = double(0);
elseif (x(i,j,2) < 31 && x(i,j,2) < 95)
xpseu(i,j,2) = double((x(i,j,2)*4)-124);
elseif (x(i,j,2) <= 95 && x(i,j,2) <= 159)
xpseu(i,j,2) = double(255);
elseif (x(i,j,2) < 159 && x(i,j,2) <= 223)
xpseu(i,j,2) = double((x(i,j,2)*-4)+636);
elseif (x(i,j,2) <= 223 && x(i,j,2) <= 255)
xpseu(i,j,2) = double(0);
end
end
end

for i = 1 : tam(1)
for j = 1 : tam(2)
if (x(i,j,3) <= 0 && x(i,j,3) < 31)
xpseu(i,j,3) = double((x(i,j,3) *4)-131);
elseif (x(i,j,3) <= 31 && x(i,j,3) <= 95)
xpseu(i,j,3) = double(255);
elseif (x(i,j,3) < 95 && x(i,j,3) < 159)
xpseu(i,j,3) = double((x(i,j,3) *-4)+380);
elseif (x(i,j,3) <= 159 && x(i,j,3) <= 255)
xpseu(i,j,3) = double(0);
end
end
end
subplot(handles.falso);imshow(xpseu),title('imagen Color falso');