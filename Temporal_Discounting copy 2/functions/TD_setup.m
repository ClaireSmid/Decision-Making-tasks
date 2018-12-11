function TD_setup

%% make variables global
global TD ROOT_DIR 
global ESC wrapat max_stimulus_shown delay trials fixation_time
global feedback_time

rng('shuffle')

cd(ROOT_DIR);
% path(path,'functions'); % allow access to all subfunctions


%% initialize psychtoolbox

TD.mon = 0;
TD.backgroundColor = [69 58 223];
TD.textSize = 40; % text size for message
TD.textColor = [255 255 240]; % text size for message
TD.fixationSize = 100;
TD.fixationColor = [255 255 255];
TD.choicetextsize = 40;
TD.choiceboxColor = [230 225 110];
TD.scaleColor = [0 0 128];
TD.sliderColor = [247 153 12]; % orange
TD.AttChoiceCol = [230 225 110];
TD.backgroundColors = [0 0 0; % black
    230 225 110; % yellow
    110 150 220; % light blue
    255 255 255; % grey
    0 0 128; % navy blue
    69 58 223]; % purple

wrapat = 80;


%% Timings
max_stimulus_shown = 60;
fixation_time = 1.4; % modelled after Julia's paper
delay = (0:50); % jittered delay ranges from 0-200 ms
feedback_time = 2; 

%% Trials
stimuli = 18; % We have 20 stimuli in total
trials = stimuli; % trials per block


%% RESPONSE BUTTONS 
%%% left = 97 (left arrow) right = 100 (down arrow) 52 = ESC (Cogent
%%% markings)
% responsekeys = [KbName('LeftArrow') KbName('DownArrow') KbName('space') KbName('ESCAPE')];

TD.leftKey = 'LeftArrow';
TD.rightKey = 'DownArrow';
TD.screenKey = 'space';
TD.exitKey = 'ESCAPE';

ESC = 0;

end
