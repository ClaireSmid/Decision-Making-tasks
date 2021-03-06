function Old_Maid_riskgame

clearvars;
clear RECS;


OM.ROOT_DIR = pwd;

RECS.rectangles = [];
RECS.pressed = [];
ANIMAL = [];

% path(path,[OM.ROOT_DIR, '/functions']);
% path(path,[OM.ROOT_DIR, '/images']);
% path(path,[OM.ROOT_DIR, '/results']);
% 
% 
% results_path = ([OM.ROOT_DIR, '/results']);

commandwindow;
PsychDefaultSetup(2); % calls UnifyKeyNames
AssertOpenGL;

% KbName('UnifyKeyNames'); % already called in PsychDefaultSetup(2)



% file = sprintf('Old_Maid_Risk_Game.dat');
% dataFileName = fullfile(results_path,file);
% 
% % t = datetime;
% % d = char(t);
% % Date = d(1:11);
% 
% formatString = '%s,%d,%d,%d\n'; % this is for dataoutput
% %fprintf(file, 'keyStroke, RT, card_count, loss');
% 
% 
% if exist(dataFileName,'file') == 0
%     dataFile = fopen(dataFileName, 'a');
%     fprintf(dataFile, '%s \n', 'keyStroke, RT, card_count, loss');
%     fclose('all');
% else
%     cont=input('File already exists. Continue? (1=yes, 2=no): '); %to avoid overriding
%     if cont~=1
%         return 
%     end
% end

Screen('Preference', 'SkipSyncTests', 1); % set this to 0 for hard and robust measurements

rng shuffle

ListenChar(2); % enables listening for keyboard input
Priority(2); % only on macs
HideCursor;



% Risk_setup;

OM.mon = 0;
OM.backgroundColor = [0 0 0];
OM.textSize = 40; % text size for message
OM.textColor = [255 255 240]; % text size for message
OM.fixationSize = 100;
OM.fixationColor = [255 255 255];
OM.unselRecColour = [255 255 255];
OM.selRecColour = [247 153 12];
OM.unselRecSize = 3;
OM.selRecSize = 8;
OM.redColour = [255,0,0]; 

OM.screenKey = 'space';
OM.exitKey = 'ESCAPE';

OM.ESC = 0;

% Open Screen
    [OM.wid, OM.wRect] = Screen('OpenWindow', 0, [0 0 0],[0 0 1100, 900]); % small screen
    
%     [OM.wid, OM.wRect] = Screen('OpenWindow', 0, OM.backgroundColor); % open a psychtoolbox window % 0 is fullscreen, 1 is not full screen

    priorityLevel=MaxPriority(OM.wid); 
    Priority(priorityLevel);
    
    Screen('BlendFunction', OM.wid,'GL_SRC_ALPHA','GL_ONE_MINUS_SRC_ALPHA'); % allow for transparency
    Screen('TextFont', OM.wid, 'Arial');
    Screen('TextSize', OM.wid, OM.textSize);
    Screen('TextColor', OM.wid, OM.textColor);
    
    OM.origin = [floor(OM.wRect(3)/2) floor(OM.wRect(4)/2)]; % center of the screen
    
    
%     animals = {'1.png'; '2.png'; '3.png'; '4.png';
%     '5.png'; '6.png'; '7.png'; '8.png'; '9.png';
%     '10.png'; '11.png'; '12.png'; '13.png'; '14.png';
%     '15.png'; '16.png'; '17.png'; '18.png'};
% 
% for i = 1:length(animals)
%     ANIMAL(i).Ani = animals{i};
%     [image,~,alpha] = imread(['images/',ANIMAL(i).Ani]);
%     image(:,:,4) = alpha(:,:);
%     ANIMAL(i).AniTexture = Screen('MakeTexture', OM.wid, image);
% end

% a = length(animals)+1;
% Animal(a).Ani = 'troll.png';
% [image,~,alpha] = imread(['images/',ANIMAL(a).Ani]);
% image(:,:,4) = alpha(:,:);
% ANIMAL(a).AniTexture = Screen('MakeTexture', OM.wid, image);
% 
% OM.troll = 'troll.png';
% [image,~,alpha] = imread(['images/',OM.troll]);
% image(:,:,4) = alpha(:,:);
% OM.trollTexture = Screen('MakeTexture', OM.wid, image);


    
    fixation = 'Hello there';
        DrawFormattedText(OM.wid, fixation, 'center', 'center', [255 255 255]);
        Screen('Flip', OM.wid);
        WaitSecs(2); % time f
        
        ShowCursor;
        
        RECS(1).rectangles = [OM.origin(1)-100 OM.origin(2)-250 OM.origin(1)+100 OM.origin(2)-50];
        RECS(2).rectangles = [OM.origin(1)-350 OM.origin(2)+150 OM.origin(1)-50 OM.origin(2)+400];
        RECS(3).rectangles = [OM.origin(1)+50 OM.origin(2)+150 OM.origin(1)+350 OM.origin(2)+400];
%         RECS(4).rectangles = [OM.origin(1)+180 OM.origin(2)-350 OM.origin(1)+480 OM.origin(2)-15];
%         RECS(5).rectangles = [OM.origin(1)+500 OM.origin(2)-350 OM.origin(1)+800 OM.origin(2)-15];
%         RECS(6).rectangles = [OM.origin(1)-800 OM.origin(2)+15 OM.origin(1)-500 OM.origin(2)+350];
%         RECS(7).rectangles = [OM.origin(1)-480 OM.origin(2)+15 OM.origin(1)-180 OM.origin(2)+350];
%         RECS(8).rectangles = [OM.origin(1)-160 OM.origin(2)+15 OM.origin(1)+160 OM.origin(2)+350];
%         RECS(9).rectangles = [OM.origin(1)+180 OM.origin(2)+15 OM.origin(1)+480 OM.origin(2)+350];
%         RECS(10).rectangles = [OM.origin(1)+500 OM.origin(2)+15 OM.origin(1)+800 OM.origin(2)+350];
        
        
        % Setting the locations and rectangles for the coins and boxes
% COIN(1).coins = [DG.origin(1)-100 DG.origin(2)-250 DG.origin(1)+100 DG.origin(2)-50];
% COIN(2).box = [DG.origin(1)-200 DG.origin(2)+250 DG.origin(1)-100 DG.origin(2)+350];
% COIN(3).box = [DG.origin(1)+100 DG.origin(2)+200 DG.origin(1)+200 DG.origin(2)+350];
% 
% BOX(1).box = [DG.origin(1)-350 DG.origin(2)+150 DG.origin(1)-50 DG.origin(2)+400];
% BOX(2).box = [DG.origin(1)+50 DG.origin(2)+150 DG.origin(1)+350 DG.origin(2)+400];
        

%     for trial = 1:5
        
        
%         sequence = [1 0 0 0 0 0 0 0 0 0];
%         sequence = sequence(randperm(length(sequence)));

        for i = 1:length(RECS)
            Screen('FrameRect', OM.wid, OM.unselRecColour, RECS(i).rectangles, OM.unselRecSize);
        end
        
        timage = GetSecs;
        Screen('Flip', OM.wid);
%         WaitSecs(1);
%         picked_cards = 0;
        Screenpress = 0;
        loss = 0;
       
%         MousePress=0; %initializes flag to indicate no response
        
        while Screenpress==0 && OM.ESC == 0 %checks for completion
            
            
        [keyIsDown, keyTime, keyCode] = KbCheck;
            if keyIsDown
                keyStroke = KbName(keyCode);
                if any(strcmpi(keyStroke,OM.screenKey))
                    Screenpress = 1;
                    RT = round((keyTime - timage)*1000);
                elseif any(strcmpi(keyStroke,OM.exitKey))
                    OM.ESC = 1;
                    break;
                end
            end         

            [mx,my,buttons]=GetMouse();  %waits for a key-press
                
                for i = 1:length(RECS)
                    if RECS(i).pressed == 1
                        Screen('FrameRect', OM.wid, OM.selRecColour, RECS(i).rectangles, OM.selRecSize);
                    else
                        Screen('FrameRect', OM.wid, OM.unselRecColour, RECS(i).rectangles, OM.unselRecSize);
                    end
                end
                
                if sum(buttons) > 0
                    
                    % didn't work
%                     for i = 1:length(RECS)
%                         if IsInRect(mx, my, RECS(i).rectangles == 1)
%                             RECS(i).pressed = 1;
%                         end
%                     end
                    

                    
                    
                    
                 if IsInRect(mx, my, RECS(1).rectangles) == 1 
                         if sum(buttons) > 0
                             RECS(1).pressed = 1;
                         end

                  elseif IsInRect(mx, my, RECS(2).rectangles) == 1
                         if sum(buttons) > 0
                             RECS(2).pressed = 1;
                             RECS(3).pressed = 0;
                         end

                  elseif IsInRect(mx, my, RECS(3).rectangles) == 1
                         if sum(buttons) > 0
                             RECS(3).pressed = 1;
                             RECS(2).pressed = 0;
                         end

%                   elseif IsInRect(mx, my, RECS(4).rectangles) == 1
%                          if sum(buttons) > 0
%                              RECS(4).pressed = 1;
%                          end
%                   elseif IsInRect(mx, my, RECS(5).rectangles) == 1
% 
%                          if sum(buttons) > 0
%                              RECS(5).pressed = 1;
%                          end
%                   elseif IsInRect(mx, my, RECS(6).rectangles) == 1
%                          if sum(buttons) > 0
%                              RECS(6).pressed = 1;
%                          end
%                   elseif IsInRect(mx, my, RECS(7).rectangles) == 1
%                          if sum(buttons) > 0
%                              RECS(7).pressed = 1;
%                          end
%                   elseif IsInRect(mx, my, RECS(8).rectangles) == 1
%                          if sum(buttons) > 0
%                              RECS(8).pressed = 1;
%                          end
%                   elseif IsInRect(mx, my, RECS(9).rectangles) == 1
%                          if sum(buttons) > 0
%                              RECS(9).pressed = 1;
%                          end
%                   elseif IsInRect(mx, my, RECS(10).rectangles) == 1
%                          if sum(buttons) > 0
%                              RECS(10).pressed = 1;
%                          end
                 end
                 
                 
                for i = 1:length(RECS)
                    if RECS(i).pressed == 1
                        Screen('FrameRect', OM.wid, OM.selRecColour, RECS(i).rectangles, OM.selRecSize);
                    else %elseif RECS(i).pressed == 0
                        Screen('FrameRect', OM.wid, OM.unselRecColour, RECS(i).rectangles, OM.unselRecSize);
                    end
                end
                  
%                   a = find(RECS.pressed == 1);
%                   disp(a);
                  Screen('Flip', OM.wid);
%                   WaitSecs(1);
              
                  
                end
%         end
            
%         card_count = 0;
%         % display animations
%         for i = 1:length(RECS)
%             if RECS(i).pressed == 1
%                 Screen('FrameRect', OM.wid, OM.selRecColour, RECS(i).rectangles, OM.selRecSize);
%                 if sequence(i) == 0 % normal animal
%                     Screen('DrawTexture', OM.wid, ANIMAL(i).AniTexture, [], RECS(i).rectangles);
%                     
%                 elseif sequence(i) == 1 % troll face
%                     Screen('FillRect', OM.wid, OM.redColour, RECS(i).rectangles)
%                     Screen('DrawTexture', OM.wid, OM.trollTexture, [], RECS(i).rectangles);
%                     
%                     loss = 1;
%                 end
%                 card_count = card_count + 1;
%             elseif RECS(i).pressed == 0 %else
%                 Screen('FrameRect', OM.wid, OM.unselRecColour, RECS(i).rectangles, OM.unselRecSize);
%             end
% %                 Screen('Flip', OM.wid);
% %                 WaitSecs(0.5);
%         end
        

        Screen('Flip', OM.wid);
        WaitSecs(3);
        
end
        
%         if loss == 1
%             message = 'Oh no! You lost all your cards for this round...';
%             DrawFormattedText(OM.wid, message, 'center', 'center', OM.textColor);
% 
%         elseif loss == 0
%             message = sprintf('Well done! You''ve won %d cards this round!', card_count);
%             DrawFormattedText(OM.wid, message, 'center', 'center', OM.textColor);
%         end
%             
%             Screen('Flip',OM.wid);
%             WaitSecs(1);
%             
%             
%         dataFile = fopen(dataFileName, 'a');
% %      fprintf(dataFile, '%s \n', 'SJNB, Test_session, Date, Age, trial, Stimuli_type, key, timage, tkey, RT, Timing, Scale, Att_RT, Att_x, Att_y');
%         fprintf(dataFile, formatString, keyStroke, RT, card_count, loss);
%         fclose(dataFile);
%         

%         for i = 1:10
%             RECS(i).pressed = [];
%         end
        
%     end
%         WaitSecs(5);
        
        sca;
end

