function Dictator_GameV2

% clear old variables etc. 
clearvars;
clear RECS;

% set root directory (not necessary)
% DG.ROOT_DIR = pwd;

% define indexed variables we're working with
COIN.rectangles = [];
COIN.selected = [];
BOX.selected = [];

% some settings to call
commandwindow;
PsychDefaultSetup(2); % calls UnifyKeyNames
AssertOpenGL;
Screen('Preference', 'SkipSyncTests', 1); % set this to 0 for hard and robust measurements
rng shuffle
ListenChar(2); % enables listening for keyboard input
Priority(2); % only on macs
HideCursor; % initially hide the cursor

% settings for colours, screens etc
DG.mon = 0;
DG.backgroundColor = [0 0 0];
DG.textSize = 40; % text size for message
DG.textColor = [255 255 240]; % text size for message
DG.unselRecColour = [255 255 255];
DG.selRecColour = [247 153 12];
DG.unselRecSize = 3;
DG.selRecSize = 8;
DG.redColour = [255,0,0]; 

DG.screenKey = 'space';
DG.exitKey = 'ESCAPE';
DG.ESC = 0;

% Open Screen
[DG.wid, DG.wRect] = Screen('OpenWindow', 0, [0 0 0],[0 0 1100, 900]); % small screen

%     [DG.wid, DG.wRect] = Screen('OpenWindow', 0, DG.backgroundColor); % open a psychtoolbox window % 0 is fullscreen, 1 is not full screen

% more settings for the screen
priorityLevel=MaxPriority(DG.wid); 
Priority(priorityLevel);

Screen('BlendFunction', DG.wid,'GL_SRC_ALPHA','GL_ONE_MINUS_SRC_ALPHA'); % allow for transparency
Screen('TextFont', DG.wid, 'Arial');
Screen('TextSize', DG.wid, DG.textSize);
Screen('TextColor', DG.wid, DG.textColor);

% setting this to fixate rectangles to
DG.origin = [floor(DG.wRect(3)/2) floor(DG.wRect(4)/2)]; % center of the screen

% call the cursor again (to show it after opening the screen
ShowCursor;

% Show the text once the screen is open
fixation = 'Hello there';
DrawFormattedText(DG.wid, fixation, 'center', 'center', [255 255 255]);
Screen('Flip', DG.wid);
WaitSecs(2); % time f

% Setting the locations and rectangles for the coins and boxes
COIN(1).coins = [DG.origin(1)-100 DG.origin(2)-250 DG.origin(1)+100 DG.origin(2)-50];
COIN(2).box = [DG.origin(1)-200 DG.origin(2)+250 DG.origin(1)-100 DG.origin(2)+350];
COIN(3).box = [DG.origin(1)+100 DG.origin(2)+200 DG.origin(1)+200 DG.origin(2)+350];

BOX(1).box = [DG.origin(1)-350 DG.origin(2)+150 DG.origin(1)-50 DG.origin(2)+400];
BOX(2).box = [DG.origin(1)+50 DG.origin(2)+150 DG.origin(1)+350 DG.origin(2)+400];

% Load the textures for the coins and the boxes (coin is a filled
% rectangle)
for i = 1:length(COIN)
    Screen('FillRect', DG.wid, DG.redColour, COIN(i).coins);
end

for i = 1:length(BOX)
    Screen('FrameRect', DG.wid, DG.unselRecColour, BOX(i).box, DG.unselRecSize);
end

% initially, show one red coin square, and two empty boxes
Screen('Flip', DG.wid);

%         WaitSecs(1);
%         picked_cards = 0;

% Set the value for the while loop to stop to 0
Screenpress = 0;
MousePress1 = 0;
MousePress2 = 0;

% this while loop stops until Screenpress is set to 1. This made sense in
% the risk game code, but here it should probably stop until after the
% second mouse press.

% maybe this should use two mousepresses instead. 
while Screenpress==0 %checks for completion
     
    % wait for input from keyboard
    [keyIsDown, keyTime, keyCode] = KbCheck;
        if keyIsDown
            keyStroke = KbName(keyCode);
            if any(strcmpi(keyStroke,DG.screenKey))
                Screenpress = 1; % change this for the second mouse press?
                RT = round((keyTime - timage)*1000);
            elseif any(strcmpi(keyStroke,DG.exitKey))
                DG.ESC = 1;
                break;
            end
        end         

        % wait for input from mouse 
        [mx,my,buttons1]=GetMouse();  %waits for a key-press
        
        % I put this here again, since the coin didn't stay on the screen
        % for the length of COIN, which is 1 currently, either draw a red square with a rectangle around it
        % if it is selected, or else just draw the square by itself. The
        % value for "selected" has not been defined yet at this point. 
        for i = 1:length(COIN)
            if COIN(i).selected == 1
                Screen('FillRect', DG.wid, DG.redColour, COIN(i).coins);
                Screen('FrameRect', DG.wid, DG.selRecColour, COIN(i).coins, DG.selRecSize);
            elseif COIN(i).selected == 0
                Screen('FillRect', DG.wid, DG.redColour, COIN(i).coins);
%                 Screen('FrameRect', DG.wid, DG.unselRecColour, COIN(i).coins, DG.unselRecSize);
            end
        end
        
        % Should I put this here?
        Screen('Flip', DG.wid);
        
        % if a mouse button press was detected
        if sum(buttons1) > 0
            MousePress1 = 1;
            
            % then if it was inside the coin square, define that coin as
            % selected. this is used in the next loop.
             if IsInRect(mx, my, COIN(1).coins) == 1 
                 COIN(1).selected = 1;
                 selected = 1;
             else
                 COIN(1).selected = 0;
                 selected = 0;
                 MousePress1 = 0;
             end

        
        % This is now here as well, following the risk game format
        % for the length of COIN, which is 1 currently, either draw a red square with a rectangle around it
        % if it is selected, or else just draw the square by itself. The
        % value for "selected" has not been defined yet at this point. 
        for i = 1:length(COIN)
            if COIN(i).selected == 1
                Screen('FillRect', DG.wid, DG.redColour, COIN(i).coins);
                Screen('FrameRect', DG.wid, DG.selRecColour, COIN(i).coins, DG.selRecSize);
            elseif COIN(i).selected == 0
                Screen('FillRect', DG.wid, DG.redColour, COIN(i).coins);
%                 Screen('FrameRect', DG.wid, DG.unselRecColour, COIN(i).coins, DG.unselRecSize);
            end
        end

        % draw this to the screen (if it was selected, draw the rectangle)
        Screen('Flip', DG.wid);
        
        end
        
        % Now we need to wait for another keypress in one of the two
        % squares at the bottom. We need to keep the coin highlighted while
        % this happens.
        
        if MousePress1 == 1
        % so detect another mouse press
        [zx,zy,buttons2] = GetMouse();
        
        % put this here too now 
       
        for i = 1:length(COIN)
            if COIN(i).selected == 1
                Screen('FillRect', DG.wid, DG.redColour, COIN(i).coins);
                Screen('FrameRect', DG.wid, DG.selRecColour, COIN(i).coins, DG.selRecSize);
            elseif COIN(i).selected == 0
                Screen('FillRect', DG.wid, DG.redColour, COIN(i).coins);
%                 Screen('FrameRect', DG.wid, DG.unselRecColour, COIN(i).coins, DG.unselRecSize);
            end
        end
                   
        for i = 1:length(BOX)
            BOX(i).selected = 0;
        end
        % if a second mouse press is detected
         if sum(buttons2) > 0
             MousePress2 = 1;
            
             % find which box it was in
             if IsInRect(zx, zy, BOX(1).box) == 1
                 BOX(1).selected = 1;
                 BOX(2).selected = 0;
             elseif IsInRect(zx, zy, BOX(2).box) == 1
                 BOX(2).selected = 1;
                 BOX(1).selected = 0;
             else
                 MousePress2 = 0;
             end
             
         
         % Make the coin texture again
         for i = 1:length(COIN)
            if COIN(i).selected == 1
                Screen('FillRect', DG.wid, DG.redColour, COIN(i).coins);
                Screen('FrameRect', DG.wid, DG.selRecColour, COIN(i).coins, DG.selRecSize);
            elseif COIN(i).selected == 0
                Screen('FillRect', DG.wid, DG.redColour, COIN(i).coins);
%                 Screen('FrameRect', DG.wid, DG.unselRecColour, COIN(i).coins, DG.unselRecSize);
            end
         end
            
         % draw a selected rectangle around the chosen box
         for i = 1:length(BOX)
            if BOX(i).selected == 1
                Screen('FrameRect', DG.wid, DG.selRecColour, BOX(i).box, DG.selRecSize);
            else
                Screen('FrameRect', DG.wid, DG.unselRecColour, BOX(i).box, DG.unselRecSize);
            end
         end
            
         % show both the coin and the selected box
         Screen('Flip', DG.wid);
         WaitSecs(2); 
         
         end
         
        end
        
%         if MousePress2 == 1
%              for i = 1:length(BOX)
%                 if BOX(i).selected == 1
%                     Screen('FrameRect', DG.wid, DG.selRecColour, BOX(i).box, DG.selRecSize);
%                     Screen('FillRect', DG.wid, DG.redColour, COIN(i).box);
%                 else
%                     Screen('FrameRect', DG.wid, DG.unselRecColour, BOX(i).box, DG.unselRecSize);
%                 end
%              end
%             
%          Screen('Flip', DG.wid);
%          WaitSecs(2); 
%          
%         end
         
end
    clear global DG;
    clear global COIN;
    clear global BOX;
    Screen('Close'); % textures?
    Screen('CloseAll'); % close screen
    Priority(0); % return Matlab's priority level to normal
    ListenChar(0); % allow keystrokes to Matlab
% sca;

end
         
