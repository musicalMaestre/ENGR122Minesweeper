function varargout = minesweeperGUI2(varargin)
% MINESWEEPERGUI2 MATLAB code for minesweeperGUI2.fig
%      MINESWEEPERGUI2, by itself, creates a new MINESWEEPERGUI2 or raises the existing
%      singleton*.
%
%      H = MINESWEEPERGUI2 returns the handle to a new MINESWEEPERGUI2 or the handle to
%      the existing singleton*.
%
%      MINESWEEPERGUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MINESWEEPERGUI2.M with the given input arguments.
%
%      MINESWEEPERGUI2('Property','Value',...) creates a new MINESWEEPERGUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before minesweeperGUI2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to minesweeperGUI2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help minesweeperGUI2

% Last Modified by GUIDE v2.5 05-Mar-2018 22:21:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @minesweeperGUI2_OpeningFcn, ...
                   'gui_OutputFcn',  @minesweeperGUI2_OutputFcn, ...
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


% --- Executes just before minesweeperGUI2 is made visible.
function minesweeperGUI2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to minesweeperGUI2 (see VARARGIN)
    %Variable declaration
    handles.mineTable = [];
    handles.X = 0;
    handles.Y = 0;
    handles.bombs = 0;
    load('statistics.mat');
    
% Choose default command line output for minesweeperGUI2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes minesweeperGUI2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = minesweeperGUI2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Beginner.
function Beginner_Callback(hObject, eventdata, handles)
% hObject    handle to Beginner (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.X = 9;
handles.Y = 9;
handles.bombs = 10;
initializeGame(handles.X, handles.Y, handles.bombs);
guidata(hObject, handles);



% --- Executes on button press in Intermediate.
function Intermediate_Callback(hObject, eventdata, handles)
% hObject    handle to Intermediate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Intermediate
handles.X = 16;
handles.Y = 16;
handles.bombs = 40;
initializeGame(handles.X, handles.Y, handles.bombs);
guidata(hObject, handles);

% --- Executes on button press in Custom.
function Custom_Callback(hObject, eventdata, handles)
% hObject    handle to Custom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
initializeGame(handles.X, handles.Y, handles.bombs);

% --- Executes on button press in Expert.
function Expert_Callback(hObject, eventdata, handles)
% hObject    handle to Expert (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.X = 24;
handles.Y = 24;
handles.bombs = 99;
initializeGame(handles.X, handles.Y, handles.bombs);
guidata(hObject, handles);

% Custom Y value callback
function CustomY_Callback(hObject, eventdata, handles)
% hObject    handle to CustomY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CustomY as text
%        str2double(get(hObject,'String')) returns contents of CustomY as a double
handles.Y = str2double(get(hObject,'String'));
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function CustomY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CustomY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CustomBombs_Callback(hObject, eventdata, handles)
% hObject    handle to CustomBombs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CustomBombs as text
%        str2double(get(hObject,'String')) returns contents of CustomBombs as a double


% --- Executes during object creation, after setting all properties.
function CustomBombs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CustomBombs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


% Custom X value callback
function CustomX_Callback(hObject, eventdata, handles)
% hObject    handle to CustomX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CustomX as text
%        str2double(get(hObject,'String')) returns contents of CustomX as a double
handles.X = str2double(get(hObject,'String'));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function CustomX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CustomX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function initializeGame(X, Y, bombs)
    uncovered = imread('facingDown.jpg');
    for i = 0:X
        for j = 0:Y
            image([0+i 1+i], [0+j 1+j], uncovered);
            hold on
        end
    end
    axis([0 X 0 Y]);
    
