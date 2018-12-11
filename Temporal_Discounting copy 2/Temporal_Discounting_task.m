function Temporal_Discounting_task

% This is the script for the temporal discounting task. It was completed
% for the second pilot study on October 2018, then reworked in November
% 2018 to include confidence scales and some better code. It includes a 
% continuos scale for the confidence rating (adjust step size for more/less
% accuracy / sensitivity.
% Completed on 21 November 2018. Claire Smid

clc;
clear vars;


global TD SJNB Age Test_session ROOT_DIR results_path dataFileName
global formatString Date ESC


try
%% Start up screen

commandwindow;
PsychDefaultSetup(2); % calls UnifyKeyNames
AssertOpenGL;

% KbName('UnifyKeyNames'); % already called in PsychDefaultSetup(2)

Screen('Preference', 'SkipSyncTests', 1); % set this to 0 for hard and robust measurements

rng shuffle

ROOT_DIR = pwd;

% path(path,'functions'); % allow access to all subfunctions
% path(path,'img'); % allow access to all subfunctions
% path(path,'results');
%results_path = ('fullpath');

% needed to get correct file location

%results_path = ('\results');

%results_path = pwd;

path(path,[ROOT_DIR, '/functions']);
path(path,[ROOT_DIR, '/img']);
path(path,[ROOT_DIR, '/results']);

results_path = ([ROOT_DIR, '/results']);

%% get participant data
    
SJNB = input('Participant number: '); % enter info from screen, saves as variable SJNB
Age = input('Participant age: '); 
Test_session = input('Pre (=1) or Post-testing (=2)?: ');

file = sprintf('Temporal_Discounting_data_T%d_s%0.3d.dat', Test_session, SJNB);
dataFileName = fullfile(results_path,file);

t = datetime;
d = char(t);
Date = d(1:11);

formatString = '%0.3d,%d,%s,%d,%d,%d,%s,%d,%d,%d,%s,%0.1f,%d,%d,%d\n'; % this is for dataoutput
%fprintf(file, 'SJNB, Test_session, Date, Age, trial, Stimuli_type, key, timage, tkey, RT, Timing, Scale, Att_RT, Att_x, Att_y\n');


if exist(dataFileName,'file') == 0
    dataFile = fopen(dataFileName, 'a');
    fprintf(dataFile, '%s \n', 'SJNB, Test_session, Date, Age, trial, Stimuli_type, key, timage, tkey, RT, Timing, Scale, Att_RT, Att_x, Att_y');
    fclose('all');
else
    cont=input('File already exists. Continue? (1=yes, 2=no): '); %to avoid overriding
    if cont~=1
        return 
    end
end


ListenChar(2); % enables listening for keyboard input
Priority(2); % only on macs
HideCursor;

    % Get settings
    TD_setup;
    
    % Open Screen
%     [TD.wid, TD.wRect] = Screen('OpenWindow', 0, TD.backgroundColor,[0 0 1100, 900]); % small screen
    
    [TD.wid, TD.wRect] = Screen('OpenWindow', 0, TD.backgroundColor); % open a psychtoolbox window % 0 is fullscreen, 1 is not full screen

    priorityLevel=MaxPriority(TD.wid); 
    Priority(priorityLevel);
    
    Screen('BlendFunction', TD.wid,'GL_SRC_ALPHA','GL_ONE_MINUS_SRC_ALPHA'); % allow for transparency
    Screen('TextFont', TD.wid, 'Arial');
    Screen('TextSize', TD.wid, TD.textSize);
    Screen('TextColor', TD.wid, TD.textColor);
    
    TD.origin = [floor(TD.wRect(3)/2) floor(TD.wRect(4)/2)]; % center of the screen

    %% setup task
    ESC = 0;
    
    % load images
    TD_textures;
       
    % show first instructions (MAKE INSTRUCTIONS PRETTIER!)
    TD_showInstructions(1);
    
    % run decision task
    TD_decision_block

    % show second instructions for attractiveness task
    TD_showInstructions(2);
    
    % run attraction task
    TD_attractive_block
    
    % Show final slide
    TD_showInstructions(3);
    
    fclose('all');
    RestrictKeysForKbCheck;
    ShowCursor(0);
    Screen('Close'); % textures?
    Screen('CloseAll'); % close screen
    Priority(0); % return Matlab's priority level to normal
    ListenChar(0); % allow keystrokes to Matlab

catch ME
    
    disp(getReport(ME));

    clear global TD;
    
    RestrictKeysForKbCheck;
    ShowCursor(0);
    Screen('Close'); % textures?
    Screen('CloseAll'); % close screen
    Priority(0); % return Matlab's priority level to normal
    ListenChar(0); % allow keystrokes to Matlab
    
end
