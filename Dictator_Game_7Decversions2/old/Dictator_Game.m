
function Dictator_Game

clearvars;
clear RECS;


DG.ROOT_DIR = pwd;

COIN.rectangles = [];
COIN.selected = [];
BOX.selected = [];
% ANIMAL = [];

% path(path,[DG.ROOT_DIR, '/functions']);
% path(path,[DG.ROOT_DIR, '/images']);
% path(path,[DG.ROOT_DIR, '/results']);


% results_path = ([DG.ROOT_DIR, '/results']);

commandwindow;
PsychDefaultSetup(2); % calls UnifyKeyNames
AssertOpenGL;

% KbName('UnifyKeyNames'); % already called in PsychDefaultSetup(2)

Screen('Preference', 'SkipSyncTests', 1); % set this to 0 for hard and robust measurements

rng shuffle

ListenChar(2); % enables listening for keyboard input
Priority(2); % only on macs
HideCursor;

DG.mon = 0;
DG.backgroundColor = [0 0 0];
DG.textSize = 40; % text size for message
DG.textColor = [255 255 240]; % text size for message
DG.fixationSize = 100;
DG.fixationColor = [255 255 255];
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

    priorityLevel=MaxPriority(DG.wid); 
    Priority(priorityLevel);
    
    Screen('BlendFunction', DG.wid,'GL_SRC_ALPHA','GL_ONE_MINUS_SRC_ALPHA'); % allow for transparency
    Screen('TextFont', DG.wid, 'Arial');
    Screen('TextSize', DG.wid, DG.textSize);
    Screen('TextColor', DG.wid, DG.textColor);
    
    DG.origin = [floor(DG.wRect(3)/2) floor(DG.wRect(4)/2)]; % center of the screen

% file = sprintf('Old_Maid_Risk_Game.dat');
% dataFileName = fullfile(results_path,file);

 ShowCursor;
 
        fixation = 'Hello there';
        DrawFormattedText(DG.wid, fixation, 'center', 'center', [255 255 255]);
        Screen('Flip', DG.wid);
        WaitSecs(2); % time f

        COIN(1).coins = [DG.origin(1)-100 DG.origin(2)-250 DG.origin(1)+100 DG.origin(2)-50];
%         COIN(2).coins = [DG.origin(1)-300 DG.origin(2)+15 DG.origin(1)-100 DG.origin(2)+350];
%         COIN(3).coins = [DG.origin(1)+100 DG.origin(2)+15 DG.origin(1)+300 DG.origin(2)+350];
        
        BOX(1).box = [DG.origin(1)-350 DG.origin(2)+150 DG.origin(1)-50 DG.origin(2)+400];
        BOX(2).box = [DG.origin(1)+50 DG.origin(2)+150 DG.origin(1)+350 DG.origin(2)+400];
        
        
        for i = 1:length(COIN)
            Screen('FillRect', DG.wid, DG.redColour, COIN(i).coins);
        end
        
        for i = 1:length(BOX)
            Screen('FrameRect', DG.wid, DG.unselRecColour, BOX(i).box, DG.unselRecSize);
        end
        
        timage = GetSecs;
        Screen('Flip', DG.wid);
%         WaitSecs(1);
%         picked_cards = 0;
        Screenpress = 0;
        
%         for coins = 1 %1:6

        while Screenpress==0 && DG.ESC == 0 %checks for cDGpletion
            
            
        [keyIsDown, keyTime, keyCode] = KbCheck;
            if keyIsDown
                keyStroke = KbName(keyCode);
                if any(strcmpi(keyStroke,DG.screenKey))
                    Screenpress = 1;
                    RT = round((keyTime - timage)*1000);
                elseif any(strcmpi(keyStroke,DG.exitKey))
                    DG.ESC = 1;
                    break;
                end
            end         

            [mx,my,buttons]=GetMouse();  %waits for a key-press
                
                for i = 1:length(COIN)
                    if COIN(i).selected == 1
                        Screen('FillRect', DG.wid, DG.redColour, COIN(i).coins);
                        Screen('FrameRect', DG.wid, DG.selRecColour, COIN(i).coins, DG.selRecSize);
                    elseif COIN(i).selected == 0
                        Screen('FillRect', DG.wid, DG.redColour, COIN(i).coins);
                        Screen('FrameRect', DG.wid, DG.unselRecColour, COIN(i).coins, DG.unselRecSize);
                    end
                end
                
                if sum(buttons) > 0
        
                     if IsInRect(mx, my, COIN(1).coins) == 1 
%                          if sum(buttons) > 0
                             COIN(1).selected = 1;
                             selected = 1;
                     else
                         selected = 0;
                             
%                              box = left;
%                          end

%                      elseif IsInRect(mx, my, COIN(2).coins) == 1
%                          if sum(buttons) > 0
%                              COIN(2).selected = 1;
% %                              box = right;
%                          end
                     end
                     
%                      Screen('Flip', DG.wid);
                     
                     if selected == 1
                         
                      for i = 1:length(COIN)
                            if COIN(i).selected == 1
                                Screen('FrameRect', DG.wid, DG.selRecColour, COIN(i).coins, DG.selRecSize);
                            else %elseif RECS(i).pressed == 0
                                Screen('FrameRect', DG.wid, DG.unselRecColour, COIN(i).coins, DG.unselRecSize);
                            end
                      end
                          
                      Screen('Flip', DG.wid);
                          % get buttons again for which box the coins go to
                         [zx,zy,buttons2] = GetMouse();
                         
                         if sum(buttons2) > 0
                             
                             if IsInRect(zx, zy, BOX(1).box) == 1
                                 BOX(1).selected = 1;
                             elseif IsInRect(zx, zy, BOX(2).box) == 1
                                 BOX(2).selected = 1;
                             end
                             
%                              if BOX(1).selected == 1
%                                  Screen('FrameRect', DG.wid, DG.selRecColour, BOX(1).box, DG.selRecSize);
%                              else
%                                  Screen('FrameRect', DG.wid, DG.unselRecColour, B(i).coins, DG.unselRecSize);
%                              end
%                              
%                             for i = 1:length(BOX)
%                                 if IsInRect(zx, zy, BOX(i).box) == 1 
%                                     BOX(i).selected = 1;
%                                 end
%                             end
                            
                            for i = 1:length(BOX)
                                if BOX(i).selected == 1
                                    Screen('FrameRect', DG.wid, DG.selRecColour, BOX(i).box, DG.selRecSize);
                                else
                                    Screen('FrameRect', DG.wid, DG.unselRecColour, BOX(i).box, DG.unselRecSize);
                                end
                            end

                            Screen('Flip', DG.wid);
                            
%                             Screenpress = 1;
                         end
                         
                     end
                     
                end
                
                sca;
                
        end
                        
%                          if sum(buttons) > 0
%                              COIN(1).selected = 1;
%                              selected = 1;
                             
                  
%                   a = find(RECS.pressed == 1);
%                   disp(a);
%                   Screen('Flip', OM.wid);
                     
        