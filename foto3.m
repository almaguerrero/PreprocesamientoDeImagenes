function varargout = foto3(varargin)
% FOTO3 MATLAB code for foto3.fig
%      FOTO3, by itself, creates a new FOTO3 or raises the existing
%      singleton*.
%
%      H = FOTO3 returns the handle to a new FOTO3 or the handle to
%      the existing singleton*.
%
%      FOTO3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FOTO3.M with the given input arguments.
%
%      FOTO3('Property','Value',...) creates a new FOTO3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before foto3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to foto3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help foto3

% Last Modified by GUIDE v2.5 02-Dec-2019 11:58:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @foto3_OpeningFcn, ...
                   'gui_OutputFcn',  @foto3_OutputFcn, ...
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


% --- Executes just before foto3 is made visible.
function foto3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to foto3 (see VARARGIN)

% Choose default command line output for foto3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes foto3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = foto3_OutputFcn(hObject, eventdata, handles) 
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
[filename,pathname]=uigetfile(...
    {'*.*', 'All Files(*.*)'},...
    'Picka file')
path(path,pathname);
a=imread(filename);
a=im2double(a);
[ax,ay,az] = size(a);

[filename,pathname]=uigetfile(...
    {'*.*', 'All Files(*.*)'},...
    'Picka file')
path(path,pathname);
b=imread(filename);
b=imresize(b,[ax ay]);
b=im2double(b);


subplot(handles.foto1),imshow(a),title('imagen Uno');
subplot(handles.foto2),imshow(b),title('imagen Dos');



umbral1=0.7;

for m=1:ax
    for n=1:ay
        for l=1:az
        if a(m,n,l)<umbral1
           % nc(m,n)=1;
            c(m,n)=0;
        else
           % nc(m,n)=0;
            c(m,n)=1;
        end
        end
    end
end

se = strel('rectangle',[3,3]);
erc = imerode(c,se);
c = imdilate(erc,se); 



for m=1:ax
    for n=1:ay
           if c(m,n) == 1
                nc(m,n)=0;
           else
                nc(m,n)=1;
        end
    end
end


nccolor(:,:,1)=nc;
nccolor(:,:,2)=nc;
nccolor(:,:,3)=nc;

T1 = a .* nccolor;

ccolor(:,:,1)=c;
ccolor(:,:,2)=c;
ccolor(:,:,3)=c;

T2 = b .* ccolor;

R=T1+T2;
subplot(handles.foto3),imshow(R),title('Fotomontaje');