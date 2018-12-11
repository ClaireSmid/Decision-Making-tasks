function TD_attractive_block

global TD ROOT_DIR IMG
global Test_session SJNB Age
global wrapat max_stimulus_shown delay trials feedback_time
global ESC dataFileName formatString Date fixation_time

%% Stimuli Order
%%% delay between trials (jittered task)
delay = linspace(min(delay),max(delay),trials); % generate averagely spaced delay values per trial
delay = (delay(randperm(length(delay)))); % randomise delay per trial
delay = delay/100;

Timing = 'None';
Stimuli_type = 4;
Screen('Flip',TD.wid)

att_order = [18 10 6 2 12 7]; 

for trial = 1:length(att_order)
    if ESC == 0
        
        % Show fixation cross
        Screen('TextSize',TD.wid, TD.fixationSize);
%         Screen('TextColor',TD.wid, TD.fixationColor);
        fixation = '+';
        DrawFormattedText(TD.wid, fixation, 'center', 'center', TD.fixationColor);
        Screen('Flip', TD.wid);
        WaitSecs(fixation_time); % time fixation cross shown in ms
        
        % show stimulus image
        Screen('TextSize',TD.wid, TD.choicetextsize);
%         Screen('TextColor',TD.wid, TD.textColor);
        TD_choice = 'LEFT                                    DOWN';
        DrawFormattedText(TD.wid,TD_choice,'center',TD.origin(2)+0.4*TD.wRect(4),TD.textColor,wrapat,[],[],1.5);
        Screen('DrawTexture', TD.wid, IMG(trial).AttTexture);
        Screen('Flip', TD.wid);
        timage = GetSecs;
        WaitSecs(delay(trial));
        timedout=false;
        
        % wait for keypress
        while ~timedout
            [keyIsDown, keyTime, keyCode] = KbCheck;
            if keyIsDown && ((keyTime-timage) < max_stimulus_shown)
                keyStroke = KbName(keyCode);
                if any(strcmpi(keyStroke,TD.leftKey)) || any(strcmpi(keyStroke,TD.rightKey)) || any(strcmpi(keyStroke,TD.exitKey))
                    break;
                end
            end
            if ((keyTime-timage) > max_stimulus_shown)
                timedout = true;
                RT = 0;
            end
        end

        % Show border around chosen option if not timed out
        if(~timedout)
            boxsize = [300 400];
            rect1 = [TD.origin(1)-1.75*boxsize(1) TD.origin(2)-0.75*boxsize(2) TD.origin(1)-0.1*boxsize(1) TD.origin(2)+0.65*boxsize(2)];
            rect2 = [TD.origin(1)+0.1*boxsize(1) TD.origin(2)-0.75*boxsize(2) TD.origin(1)+1.75*boxsize(1) TD.origin(2)+0.65*boxsize(2)];
            RT = round((keyTime - timage)*1000);

            Screen('DrawTexture', TD.wid, IMG(trial).AttTexture);
            
            if any(strcmpi(keyStroke,TD.leftKey)) % pressed left
                rect_to_use = rect1;
%                 Screen('FrameRect', TD.wid, [1 0 0], rect1, 3);

            elseif any(strcmpi(keyStroke,TD.rightKey)) % they pressed right 
                rect_to_use = rect2;
%                 Screen('FrameRect', TD.wid, [1 0 0], rect2, 3);

            elseif any(strcmpi(keyStroke,TD.exitKey))
                ESC = 1;
                break;
            end
            Screen('FrameRect', TD.wid, TD.AttChoiceCol, rect_to_use, 3);
            Screen('Flip',TD.wid);
            WaitSecs(feedback_time);
                
        end
      
        time_rate = GetSecs;
        % Show picture and box from trial
        Screen('DrawTexture', TD.wid, IMG(trial).AttTexture);
        Screen('FrameRect', TD.wid, TD.AttChoiceCol, rect_to_use, 3);

        % Draw text
        Screen('TextSize',TD.wid, TD.textSize);
        Screen('TextColor', TD.wid, TD.textColor);
        Attractive_text = 'Show on the scale how much you like this option.\nPress space when you''re ready.';
        DrawFormattedText(TD.wid, Attractive_text,'center',TD.origin(2)-0.4*TD.wRect(4),[],wrapat,[],[],1.5);

        % ticks on axis scale
        tick_5 = [TD.origin(1)-502 TD.origin(2)+315 TD.origin(1)-498 TD.origin(2)+335];
        tick_4 = [TD.origin(1)-402 TD.origin(2)+315 TD.origin(1)-398 TD.origin(2)+335];
        tick_3 = [TD.origin(1)-302 TD.origin(2)+315 TD.origin(1)-298 TD.origin(2)+335];
        tick_2 = [TD.origin(1)-202 TD.origin(2)+315 TD.origin(1)-198 TD.origin(2)+335];
        tick_1 = [TD.origin(1)-102 TD.origin(2)+315 TD.origin(1)-98 TD.origin(2)+335];
        tick0 = [TD.origin(1)-2 TD.origin(2)+315 TD.origin(1)+2 TD.origin(2)+335];
        tick1 = [TD.origin(1)+98 TD.origin(2)+315 TD.origin(1)+102 TD.origin(2)+335];
        tick2 = [TD.origin(1)+198 TD.origin(2)+315 TD.origin(1)+202 TD.origin(2)+335];
        tick3 = [TD.origin(1)+298 TD.origin(2)+315 TD.origin(1)+302 TD.origin(2)+335];
        tick4 = [TD.origin(1)+398 TD.origin(2)+315 TD.origin(1)+402 TD.origin(2)+335];
        tick5 = [TD.origin(1)+498 TD.origin(2)+315 TD.origin(1)+502 TD.origin(2)+335];
        
        Screen('FillRect', TD.wid, TD.scaleColor, tick_5, 3);
        Screen('FillRect', TD.wid, TD.scaleColor, tick_4, 3);
        Screen('FillRect', TD.wid, TD.scaleColor, tick_3, 3);
        Screen('FillRect', TD.wid, TD.scaleColor, tick_2, 3);
        Screen('FillRect', TD.wid, TD.scaleColor, tick_1, 3);
        Screen('FillRect', TD.wid, TD.scaleColor, tick0, 3);
        Screen('FillRect', TD.wid, TD.scaleColor, tick1, 3);
        Screen('FillRect', TD.wid, TD.scaleColor, tick2, 3);
        Screen('FillRect', TD.wid, TD.scaleColor, tick3, 3);
        Screen('FillRect', TD.wid, TD.scaleColor, tick4, 3);
        Screen('FillRect', TD.wid, TD.scaleColor, tick5, 3);
        
        % Numbers with ticks
        Screen('DrawText',TD.wid, '-5', 435, 900);
        Screen('DrawText',TD.wid, '-4', 535, 900);
        Screen('DrawText',TD.wid, '-3', 635, 900);
        Screen('DrawText',TD.wid, '-2', 735, 900);
        Screen('DrawText',TD.wid, '-1', 835, 900);
        Screen('DrawText',TD.wid, '0', 950, 900);
        Screen('DrawText',TD.wid, '1', 1050, 900);
        Screen('DrawText',TD.wid, '2', 1150, 900);
        Screen('DrawText',TD.wid, '3', 1250, 900);
        Screen('DrawText',TD.wid, '4', 1350, 900);
        Screen('DrawText',TD.wid, '5', 1450, 900);
        
        % thumb up and down
        thumbdown = [TD.origin(1)-565 TD.origin(2)+300 TD.origin(1)-520 TD.origin(2)+340];
        thumbup = [TD.origin(1)+520 TD.origin(2)+300 TD.origin(1)+565 TD.origin(2)+340];
        Screen('DrawTexture', TD.wid, TD.thumbdownT,[],thumbdown);
        Screen('DrawTexture', TD.wid, TD.thumbupT,[],thumbup);
%         Screen('DrawTexture', TD.wid, TD.thumbdownT,[],thumbdown+[0 0.05*TD.wRect(4) 0 0.05*TD.wRect(4)]);
%         Screen('DrawTexture', TD.wid, TD.thumbupT,[],thumbup+[0 0.05*TD.wRect(4) 0 0.05*TD.wRect(4)]);
        
        % scale and slider
        scale = [TD.origin(1)-500 TD.origin(2)+320 TD.origin(1)+500 TD.origin(2)+330];
        Screen('FrameRect', TD.wid, TD.scaleColor, scale, 8);
        slider = [TD.origin(1)-10 TD.origin(2)+310 TD.origin(1)+10 TD.origin(2)+340];
        Screen('FillRect', TD.wid, TD.sliderColor, slider, 2);

        % Show everything
        Screen('Flip', TD.wid);
        
         % Old axis with text
%         axis_size = [1000,20];
%         axis_1 = [TD.origin(1)-2.2*axis_size(1) TD.origin(2)+1.6*axis_size(2) ...
%                   TD.origin(1)-1.2*axis_size(1) TD.origin(2)+2.6*axis_size(2)];
        

%         Screen('TextSize',TD.wid, 30);
%         DrawFormattedText(TD.wid,X_axis_text,'center',TD.origin(2)+0.35*TD.wRect(4),[],wrapat,[],[],1.5);

        % Show scale, axis and slider
%         axis_1 = [TD.origin(1)-510 TD.origin(2)+340 TD.origin(1)+510 TD.origin(2)+360];
%         Screen('DrawTexture', TD.wid, TD.x_axis,[],axis_1+[0 0.05*TD.wRect(4) 0 0.05*TD.wRect(4)]);
        
        % axis scale
%         axis_1 = [TD.origin(1)-510 TD.origin(2)+350 TD.origin(1)-30 TD.origin(2)+370];
%         axis_2 = [TD.origin(1)+30 TD.origin(2)+350 TD.origin(1)+510 TD.origin(2)+370];
%         axis_0 = [TD.origin(1)-10 TD.origin(2)+350 TD.origin(1)+10 TD.origin(2)+370];
%         
%         Screen('DrawTexture', TD.wid, TD.x_axis1,[],axis_1);
%         Screen('DrawTexture', TD.wid, TD.x_axis2,[],axis_2);
%         Screen('DrawTexture', TD.wid, TD.x_axis0,[],axis_0);
        
        % Scaled using multiplication (works)
%         Screen('DrawTexture', TD.wid, TD.x_axis1,[],axis_1+[0 0.05*TD.wRect(4) 0 0.05*TD.wRect(4)]);
%         Screen('DrawTexture', TD.wid, TD.x_axis2,[],axis_2+[0 0.05*TD.wRect(4) 0 0.05*TD.wRect(4)]);
%         Screen('DrawTexture', TD.wid, TD.x_axis0,[],axis_0+[0 0.05*TD.wRect(4) 0 0.05*TD.wRect(4)]);
        
        % Set starting values for slider
        x = -10;
        y = +10;
        
        screenkeypress = 0;
        while ~screenkeypress
            [keyIsDown, keyTime, keyCode] = KbCheck;
            if keyIsDown
                keyStroke = KbName(keyCode);
                if any(strcmpi(keyStroke,TD.leftKey))
%                     action = 'decrease';
                       x = x+-5; % now it's slower but more sensitive
                       y = y+-5;

%                        x = x+-10; % was too crude
%                        y = y+-10;
                       
                       if x < -500
                           x = -510;
                           y = -490;
                       end
                           
                elseif any(strcmpi(keyStroke,TD.rightKey))
%                     action = 'increase';

                        x = x+5;
                        y = y+5;

%                     x = x+10;
%                     y = y+10;
                    
                       if y > 500
                           x = 490;
                           y = 510;
                       end
                elseif any(strcmpi(keyStroke,TD.screenKey))
                    screenkeypress = 1;
                    
                elseif any(strcmpi(keyStroke,TD.exitKey))
                    ESC = 1;
                    break;
                end
                
            % Show picture and box from trial  
            Screen('DrawTexture', TD.wid, IMG(trial).AttTexture);
            Screen('FrameRect', TD.wid, TD.AttChoiceCol, rect_to_use, 3);

            % Draw text
            Screen('TextSize',TD.wid, TD.textSize);
            Screen('TextColor', TD.wid, TD.textColor);
            Attractive_text = 'Show on the scale how much you like this option.\nPress space when you''re ready.';
            DrawFormattedText(TD.wid, Attractive_text,'center',TD.origin(2)-0.4*TD.wRect(4),[],wrapat,[],[],1.5);

            % ticks on axis scale
            tick_5 = [TD.origin(1)-502 TD.origin(2)+315 TD.origin(1)-498 TD.origin(2)+335];
            tick_4 = [TD.origin(1)-402 TD.origin(2)+315 TD.origin(1)-398 TD.origin(2)+335];
            tick_3 = [TD.origin(1)-302 TD.origin(2)+315 TD.origin(1)-298 TD.origin(2)+335];
            tick_2 = [TD.origin(1)-202 TD.origin(2)+315 TD.origin(1)-198 TD.origin(2)+335];
            tick_1 = [TD.origin(1)-102 TD.origin(2)+315 TD.origin(1)-98 TD.origin(2)+335];
            tick0 = [TD.origin(1)-2 TD.origin(2)+315 TD.origin(1)+2 TD.origin(2)+335];
            tick1 = [TD.origin(1)+98 TD.origin(2)+315 TD.origin(1)+102 TD.origin(2)+335];
            tick2 = [TD.origin(1)+198 TD.origin(2)+315 TD.origin(1)+202 TD.origin(2)+335];
            tick3 = [TD.origin(1)+298 TD.origin(2)+315 TD.origin(1)+302 TD.origin(2)+335];
            tick4 = [TD.origin(1)+398 TD.origin(2)+315 TD.origin(1)+402 TD.origin(2)+335];
            tick5 = [TD.origin(1)+498 TD.origin(2)+315 TD.origin(1)+502 TD.origin(2)+335];

            Screen('FillRect', TD.wid, TD.scaleColor, tick_5, 3);
            Screen('FillRect', TD.wid, TD.scaleColor, tick_4, 3);
            Screen('FillRect', TD.wid, TD.scaleColor, tick_3, 3);
            Screen('FillRect', TD.wid, TD.scaleColor, tick_2, 3);
            Screen('FillRect', TD.wid, TD.scaleColor, tick_1, 3);
            Screen('FillRect', TD.wid, TD.scaleColor, tick0, 3);
            Screen('FillRect', TD.wid, TD.scaleColor, tick1, 3);
            Screen('FillRect', TD.wid, TD.scaleColor, tick2, 3);
            Screen('FillRect', TD.wid, TD.scaleColor, tick3, 3);
            Screen('FillRect', TD.wid, TD.scaleColor, tick4, 3);
            Screen('FillRect', TD.wid, TD.scaleColor, tick5, 3);

            % Numbers with ticks
            Screen('DrawText',TD.wid, '-5', 435, 900);
            Screen('DrawText',TD.wid, '-4', 535, 900);
            Screen('DrawText',TD.wid, '-3', 635, 900);
            Screen('DrawText',TD.wid, '-2', 735, 900);
            Screen('DrawText',TD.wid, '-1', 835, 900);
            Screen('DrawText',TD.wid, '0', 950, 900);
            Screen('DrawText',TD.wid, '1', 1050, 900);
            Screen('DrawText',TD.wid, '2', 1150, 900);
            Screen('DrawText',TD.wid, '3', 1250, 900);
            Screen('DrawText',TD.wid, '4', 1350, 900);
            Screen('DrawText',TD.wid, '5', 1450, 900);

            % thumb up and down
            thumbdown = [TD.origin(1)-565 TD.origin(2)+300 TD.origin(1)-520 TD.origin(2)+340];
            thumbup = [TD.origin(1)+520 TD.origin(2)+300 TD.origin(1)+565 TD.origin(2)+340];
            Screen('DrawTexture', TD.wid, TD.thumbdownT,[],thumbdown);
            Screen('DrawTexture', TD.wid, TD.thumbupT,[],thumbup);

            % scale and slider
            scale = [TD.origin(1)-500 TD.origin(2)+320 TD.origin(1)+500 TD.origin(2)+330];
            Screen('FrameRect', TD.wid, TD.scaleColor, scale, 8);
           
            % free moving slider
            slider = [TD.origin(1)+x TD.origin(2)+310 TD.origin(1)+y TD.origin(2)+340]; 
            Screen('FillRect', TD.wid, TD.sliderColor, slider, 2);
            
            % Show everything
            Screen('Flip', TD.wid);
                
            end
                

        end
        
        Choice_time = GetSecs;
        
        % RT for choosing a scale
        Att_RT = round((Choice_time - time_rate)*1000);
        
        % logging the actual coordinates
        Att_x = x;
        Att_y = y;
        
        % Scoring the continous scale into 0.5 bins
        if Att_x >= -510 && Att_x < -480
            Scale = -5;
        elseif Att_x >= -480 && Att_x < -420
            Scale = -4.5;
        elseif Att_x >= -420 && Att_x < -380
            Scale = -4;
        elseif Att_x >= -380 && Att_x < -320
            Scale = -3.5;
        elseif Att_x >= -320 && Att_x < -280
            Scale = -3;
        elseif Att_x >= -280 && Att_x < -220
            Scale = -2.5;
        elseif Att_x >= -220 && Att_x < -180
            Scale = -2;
        elseif Att_x >= -180 && Att_x < -120
            Scale = -1.5;
        elseif Att_x >= -120 && Att_x < -80
            Scale = -1;
        elseif Att_x >= -80 && Att_x < -20
            Scale = -0.5;
        elseif Att_x >= -20 && Att_x <= 20
            Scale = 0;
        elseif Att_x <= 80 && Att_x > 20
            Scale = 0.5;
        elseif Att_x <= 120 && Att_x > 80
            Scale = 1;
        elseif Att_x <= 180 && Att_x > 120
            Scale = 1.5;
        elseif Att_x <= 220 && Att_x > 180
            Scale = 2;
        elseif Att_x <= 280 && Att_x > 220
            Scale = 2.5;
        elseif Att_x <= 320 && Att_x > 280 
            Scale = 3;
        elseif Att_x <= 380 && Att_x > 320 
            Scale = 3.5;
        elseif Att_x <= 420 && Att_x > 380  
            Scale = 4;
        elseif Att_x <= 480 && Att_x > 420
            Scale = 4.5;
        elseif Att_x <= 510 && Att_x > 480 
            Scale = 5;
        else % error code
            Scale = 9;
        end
         
    else
         break;
    end
    
     %%% save results
   dataFile = fopen(dataFileName, 'a');
%      fprintf(dataFile, '%s \n', 'SJNB, Test_session, Date, Age, trial, Stimuli_type, key, timage, tkey, RT, Timing, Scale, Att_RT, Att_x, Att_y');
   fprintf(dataFile, formatString, SJNB, Test_session, Date, Age, trial, Stimuli_type, keyStroke, timage, keyTime, RT, Timing, Scale, Att_RT, Att_x, Att_y);
   fclose(dataFile);
   
end

cd(ROOT_DIR);

end