function varargout = minesweeperGUI(varargin)
% MINESWEEPERGUI MATLAB code for minesweeperGUI.fig
%      MINESWEEPERGUI, by itself, creates a new MINESWEEPERGUI or raises the existing
%      singleton*.
%
%      H = MINESWEEPERGUI returns the handle to a new MINESWEEPERGUI or the handle to
%      the existing singleton*.
%
%      MINESWEEPERGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MINESWEEPERGUI.M with the given input arguments.
%
%      MINESWEEPERGUI('Property','Value',...) creates a new MINESWEEPERGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before minesweeperGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to minesweeperGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help minesweeperGUI

% Last Modified by GUIDE v2.5 30-Jan-2018 10:59:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @minesweeperGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @minesweeperGUI_OutputFcn, ...
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


% --- Executes just before minesweeperGUI is made visible.
function minesweeperGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to minesweeperGUI (see VARARGIN)

% Choose default command line output for minesweeperGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes minesweeperGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = minesweeperGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
