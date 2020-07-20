function varargout = PorCanal(varargin)
% PORCANAL MATLAB code for PorCanal.fig
%      PORCANAL, by itself, creates a new PORCANAL or raises the existing
%      singleton*.
%
%      H = PORCANAL returns the handle to a new PORCANAL or the handle to
%      the existing singleton*.
%
%      PORCANAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PORCANAL.M with the given input arguments.
%
%      PORCANAL('Property','Value',...) creates a new PORCANAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PorCanal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PorCanal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PorCanal

% Last Modified by GUIDE v2.5 19-Nov-2019 19:09:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PorCanal_OpeningFcn, ...
                   'gui_OutputFcn',  @PorCanal_OutputFcn, ...
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


% --- Executes just before PorCanal is made visible.
function PorCanal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PorCanal (see VARARGIN)

% Choose default command line output for PorCanal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PorCanal wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PorCanal_OutputFcn(hObject, eventdata, handles) 
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
a=imread('taj.jpg');
%figure, imshow(a); title('color');
subplot(handles.color),imshow(a),title('imagen Color');
% imagen=get(handles.color);
v=get(handles.popupmenu1,'Value');
valo=str2double(get(handles.valo,'String'));
Rojo=a(:,:,1)
Verde=a(:,:,2)
Azul=a(:,:,3)

if  v==1
   disp('suma') 
   sumR=Rojo+valo;
   sumV=Verde+valo;
   sumA=Azul+valo;
   subplot(handles.r),imshow(sumR),title('Canal R');
   subplot(handles.g),imshow(sumV),title('Canal G');
   subplot(handles.b),imshow(sumA),title('Canal B');
   a_recuperada1=sumR+sumV+sumA;
   subplot(handles.total),imshow(a_recuperada1),title('Imagen Final');
end

if  v==2
   disp('resta') 
   sumR=Rojo-valo;
   sumV=Verde-valo;
   sumA=Azul-valo;
   subplot(handles.r),imshow(sumR),title('Canal R');
   subplot(handles.g),imshow(sumV),title('Canal G');
   subplot(handles.b),imshow(sumA),title('Canal B');
   a_recuperada1=sumR+sumV+sumA;
   subplot(handles.total),imshow(a_recuperada1),title('Imagen Final');
end

if  v==3
   disp('multi') 
   sumR=Rojo.*valo;
   sumV=Verde.*valo;
   sumA=Azul.*valo;
   subplot(handles.r),imshow(sumR),title('Canal R');
   subplot(handles.g),imshow(sumV),title('Canal G');
   subplot(handles.b),imshow(sumA),title('Canal B');
   a_recuperada1=sumR+sumV+sumA;
   subplot(handles.total),imshow(a_recuperada1),title('Imagen Final');

end

if  v==4
   disp('div') 
   disp('resta') 
   sumR=Rojo./valo;
   sumV=Verde./valo;
   sumA=Azul./valo;
   subplot(handles.r),imshow(sumR),title('Canal R');
   subplot(handles.g),imshow(sumV),title('Canal G');
   subplot(handles.b),imshow(sumA),title('Canal B');
   a_recuperada1=sumR+sumV+sumA;
   subplot(handles.total),imshow(a_recuperada1),title('Imagen Final');

end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function valo_Callback(hObject, eventdata, handles)
% hObject    handle to valo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of valo as text
%        str2double(get(hObject,'String')) returns contents of valo as a double


% --- Executes during object creation, after setting all properties.
function valo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to valo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
