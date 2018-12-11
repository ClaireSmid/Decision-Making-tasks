function TD_decision_block

global TD ROOT_DIR IMG
global Test_session SJNB Age
global wrapat max_stimulus_shown delay trials feedback_time
global ESC dataFileName formatString Date fixation_time

%% Stimuli Order
%%% delay between trials (jittered task)
delay = linspace(min(delay),max(delay),trials); % generate averagely spaced delay values per trial
delay = (delay(randperm(length(delay)))); % randomise delay per trial
delay = delay/100;

%% Start block
Screen('Flip',TD.wid)
Scale = 999;
Att_RT = 999;
Att_x = 999;
Att_y = 999;

for trial = 1:trials
    if ESC == 0
        
        % Show fixation cross
        Screen('TextSize',TD.wid, TD.fixationSize);
%         Screen('TextColor',TD.wid, TD.fixationColor);
        fixation = '+';
        DrawFormattedText(TD.wid, fixation, 'center', 'center', TD.fixationColor);     
%         Screen('TextSize',TD.wid, TD.fixationSize);
%         Screen('TextColor', TD.wid, TD.fixationColor);
        Screen('Flip', TD.wid);
        WaitSecs(fixation_time); % time fixation cross shown in ms
        
        % show stimuli
        Screen('TextSize',TD.wid, TD.choicetextsize);
%         Screen('TextColor',TD.wid, TD.textColor);
        TD_choice = 'LEFT                                    DOWN';
        DrawFormattedText(TD.wid,TD_choice,'center',TD.origin(2)+0.4*TD.wRect(4),TD.textColor,wrapat,[],[],1.5);
        Screen('DrawTexture', TD.wid, IMG(trial).TDTexture);
        
        % draw response boxes
        boxsize = [250 200];
            rect1 = [TD.origin(1)-1.5*boxsize(1) TD.origin(2)+1.25*boxsize(2) TD.origin(1)-0.5*boxsize(1) TD.origin(2)+2*boxsize(2)];
            rect2 = [TD.origin(1)+0.5*boxsize(1) TD.origin(2)+1.25*boxsize(2) TD.origin(1)+1.5*boxsize(1) TD.origin(2)+2*boxsize(2)];
        Screen('FrameRect', TD.wid, TD.choiceboxColor, rect1, 3);
        Screen('FrameRect', TD.wid, TD.choiceboxColor, rect2, 3);

        % Rate stimuli type (based on immediate option)
        stimuli = trial;
        if stimuli <= 6
            Stimuli_type = 1;
        elseif stimuli > 6 && stimuli <= 12
            Stimuli_type = 2;
        elseif stimuli > 12 && stimuli <= 18
            Stimuli_type = 3;
        end
        
        Screen('Flip',TD.wid);
        timage = GetSecs;
        WaitSecs(delay(trial));
        timedout=false;
        
        % start loop to wait for key response
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
        
        % record any of the designated keypresses & respond accordingly
        if(~timedout)
                RT = round((keyTime - timage)*1000);
                Screen('DrawTexture', TD.wid, IMG(trial).TDTexture);
                
                boxsize = [250 200];
                    rect1 = [TD.origin(1)-1.5*boxsize(1) TD.origin(2)+1.25*boxsize(2) TD.origin(1)-0.5*boxsize(1) TD.origin(2)+2*boxsize(2)];
                    rect2 = [TD.origin(1)+0.5*boxsize(1) TD.origin(2)+1.25*boxsize(2) TD.origin(1)+1.5*boxsize(1) TD.origin(2)+2*boxsize(2)];
                Screen('FrameRect', TD.wid, TD.choiceboxColor, rect1, 3);
                Screen('FrameRect', TD.wid, TD.choiceboxColor, rect2, 3);

                if any(strcmpi(keyStroke,TD.leftKey)) % pressed left
                    Timing = 'Immediate';
                    
                    feedbacksize = 150;
                    rect1 = [TD.origin(1)-2.2*feedbacksize TD.origin(2)+1.3*feedbacksize ...
                        TD.origin(1)-1.2*feedbacksize TD.origin(2)+2.3*feedbacksize];
                    Screen('DrawTexture',TD.wid,TD.checkTexture,[],rect1+[0 0.05*TD.wRect(4) 0 0.05*TD.wRect(4)]);
                    
                elseif any(strcmpi(keyStroke,TD.rightKey)) % they pressed right 
                    Timing = 'Delayed';
                    
                    feedbacksize = 150;
                    rect1 = [TD.origin(1)+1.2*feedbacksize TD.origin(2)+1.3*feedbacksize ...
                        TD.origin(1)+2.2*feedbacksize TD.origin(2)+2.3*feedbacksize];
                    Screen('DrawTexture',TD.wid,TD.checkTexture,[],rect1+[0 0.05*TD.wRect(4) 0 0.05*TD.wRect(4)]);

                elseif any(strcmpi(keyStroke,TD.exitKey))
                    ESC = 1;
                    break;
                end
                
                Screen('Flip',TD.wid);
                WaitSecs(feedback_time);
                
        end
    else
        break;
    end

       %%% save results
       dataFile = fopen(dataFileName, 'a');
          %fprintf(dataFile, '%s \n', 'SJNB, Test_session, Date, Age, trial, Stimuli_type, key, timage, tkey, RT, Timing, Scale, Att_RT, Att_x, Att_y');
       fprintf(dataFile, formatString, SJNB, Test_session, Date, Age, trial, Stimuli_type, keyStroke, timage, keyTime, RT, Timing, Scale, Att_RT, Att_x, Att_y);
       fclose(dataFile);
end
   
cd(ROOT_DIR);

end

