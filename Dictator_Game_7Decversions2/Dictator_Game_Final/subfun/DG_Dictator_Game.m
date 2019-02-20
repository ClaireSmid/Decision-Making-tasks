function DG_Dictator_Game

global DG COIN BOX BOXCOIN

    box1_count = 0;
    box2_count = 0;
    boxcount1 = '0';
    boxcount2 = '0';

    % to get rid of the loading thing
    ShowCursor('Hand');
    
for trial = 1:6
    MousePress1 = 0;
    MousePress2 = 0;
    

% maybe this should use two mousepresses instead. 
%     while MousePress1 == 0 && DG.ESC == 0 %checks for completion
    
        % This loop is purely to escape out of the game early
        [keyIsDown,~, keyCode] = KbCheck;
        if keyIsDown
            keyStroke = KbName(keyCode);
            if any(strcmpi(keyStroke,DG.exitKey))
                DG.ESC = 1;
                break;
            end
        end         

        % wait for input from mouse
        [mx,my,buttons1] = GetMouse();
%         [mx,my,buttons1] = GetMouse();  %waits for a key-press
        tcoin = GetSecs;
        
        % I put this here again, since the coin didn't stay on the screen
        % for the length of COIN, which is 1 currently, either draw a red square with a rectangle around it
        % if it is selected, or else just draw the square by itself. The
        % value for "selected" has not been defined yet at this point. 
%         for t = 1:length(COIN)
%             Screen('FillRect', DG.wid, DG.redColour, COIN(t).coins);
%         end

        Screen('DrawTexture', DG.wid, DG.skyTexture);
        
        for i = 1:length(COIN)
            if COIN(i).removed == 0
                Screen('DrawTexture', DG.wid, DG.coinTexture, [], COIN(i).coins);
                if COIN(i).selected == 1
                    Screen('FrameRect', DG.wid, DG.selRecColour, COIN(i).coins, DG.selRecSize);
    %                 COIN(i).removed = 1;
                end
            end
        end
        
%         for i = 1:length(COIN)
%             if COIN(i).selected == 0 && COIN(i).removed == 0
%                 Screen('DrawTexture', DG.wid, DG.coinTexture, [], COIN(i).coins);
% %             elseif COIN(i).selected == 1 && COIN(i).removed == 0
% %                 Screen('FrameRect', DG.wid, DG.selRecColour, COIN(i).coins, DG.selRecSize);
% %                 COIN(i).removed = 1;
%             end
%         end
                
        
%         for i = 1:length(COIN)+1-trial
%             Screen('DrawTexture', DG.wid, DG.coinTexture, [], COIN(i).coins);
% %             Screen('FillRect', DG.wid, DG.redColour, COIN(i).coins);
%             if COIN(i).selected == 1
%                 Screen('FrameRect', DG.wid, DG.selRecColour, COIN(i).coins, DG.selRecSize);
% %             elseif COIN(i).selected == 0
% %                 Screen('FillRect', DG.wid, DG.redColour, COIN(i).coins);
% %                 Screen('FrameRect', DG.wid, DG.unselRecColour, COIN(i).coins, DG.unselRecSize);
%             end
%         end
        
        for i = 1:length(BOX)
                Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).box);
        
        end
                
         % show anonymous profile and 'you' above boxes
         Screen('TextSize', DG.wid, 40);
         if DG.box1 == 1
            DrawFormattedText(DG.wid, 'you', DG.youXLeft, DG.youHeight, [255 255 255]);
            Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(2).anon); 
             
         else
            DrawFormattedText(DG.wid, 'you', DG.youXRight, DG.youHeight, [255 255 255]);
            Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(1).anon);
             
         end
             
        
         % counting coins
         Screen('TextSize', DG.wid, 100);
         DrawFormattedText(DG.wid, boxcount1, DG.coinCountleft, DG.coinCountheight, [255 255 255]);
         DrawFormattedText(DG.wid, boxcount2, DG.coinCountright, DG.coinCountheight, [255 255 255]);
            
        
        % Should I put this here?
        WaitSecs(0.1);
        Screen('Flip', DG.wid);
        
        % if a mouse button press was detected
%         if sum(buttons1) > 0
            
            
            % then if it was inside the coin square, define that coin as
            % selected. this is used in the next loop.
    while MousePress1 == 0
        for i = 1:length(COIN)
            if IsInRect(mx, my, COIN(i).coins) == 1 && sum(buttons1) > 0 && COIN(i).removed == 0
                if COIN(i).selected == 0
                    COIN(i).selected = 1;
                    MousePress1 = 1;
                elseif COIN(i).selected == 1
                    COIN(i).selected = 0;
                    MousePress1 = 0;
                end
            end
        end
            
%              if IsInRect(mx, my, COIN(1).coins) == 1 
%                  COIN(1).selected = 1;
%                  MousePress1 = 1;
% %                  selected = 1;
%              elseif IsInRect(mx, my, COIN(2).coins) == 1 
%                  COIN(2).selected = 1;
%                  MousePress1 = 1;
%              elseif IsInRect(mx, my, COIN(3).coins) == 1 
%                  COIN(3).selected = 1;
%                  MousePress1 = 1;
%              elseif IsInRect(mx, my, COIN(4).coins) == 1 
%                  COIN(4).selected = 1;
%                  MousePress1 = 1;
%              elseif IsInRect(mx, my, COIN(5).coins) == 1 
%                  COIN(5).selected = 1;
%                  MousePress1 = 1;
%              elseif IsInRect(mx, my, COIN(6).coins) == 1 
%                  COIN(6).selected = 1;
%                  MousePress1 = 1;    
%              else
%                  MousePress1 = 0;
%              end

        Screen('DrawTexture', DG.wid, DG.skyTexture);
        
        % This is now here as well, following the risk game format
        % for the length of COIN, which is 1 currently, either draw a red square with a rectangle around it
        % if it is selected, or else just draw the square by itself. The
        % value for "selected" has not been defined yet at this point. 
        for i = 1:length(COIN)
            if COIN(i).removed == 0
                Screen('DrawTexture', DG.wid, DG.coinTexture, [], COIN(i).coins);
                if COIN(i).selected == 1
                    Screen('FrameRect', DG.wid, DG.selRecColour, COIN(i).coins, DG.selRecSize);
    %                 COIN(i).removed = 1;
                end
            end
        end
        
%         for i = 1:length(COIN)+1-trial
%             Screen('DrawTexture', DG.wid, DG.coinTexture, [], COIN(i).coins);
%             if COIN(i).selected == 1
%                 Screen('FrameRect', DG.wid, DG.selRecColour, COIN(i).coins, DG.selRecSize);
%             end
%         end
        
        for i = 1:length(BOX)
            Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).box);
        end
                 
          % show anonymous profile and 'you' above boxes
         Screen('TextSize', DG.wid, 40);
         if DG.box1 == 1
            DrawFormattedText(DG.wid, 'you', DG.youXLeft, DG.youHeight, [255 255 255]);
            Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(2).anon); 
             
         else
            DrawFormattedText(DG.wid, 'you', DG.youXRight, DG.youHeight, [255 255 255]);
            Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(1).anon);
             
         end
         
        % counting coins
         Screen('TextSize', DG.wid, 100);
         DrawFormattedText(DG.wid, boxcount1, DG.coinCountleft, DG.coinCountheight, [255 255 255]);
         DrawFormattedText(DG.wid, boxcount2, DG.coinCountright, DG.coinCountheight, [255 255 255]);
         

        % draw this to the screen (if it was selected, draw the rectangle)
        WaitSecs(0.2);
        Screen('Flip', DG.wid);
        
%     end
        
        % Now we need to wait for another keypress in one of the two
        % squares at the bottom. We need to keep the coin highlighted while
        % this happens.
        
    end
        
    while MousePress2 == 0 && DG.ESC == 0
        
        % This loop is purely to escape out of the game early
        [keyIsDown,~, keyCode] = KbCheck;
        if keyIsDown
            keyStroke = KbName(keyCode);
            if any(strcmpi(keyStroke,DG.exitKey))
                DG.ESC = 1;
                break;
            end
        end
        % so detect another mouse press
        [zx,zy,buttons2] = GetMouse();
        
        % put this here too now 
        
        Screen('DrawTexture', DG.wid, DG.skyTexture);
        
        for i = 1:length(COIN)
            if COIN(i).removed == 0
                Screen('DrawTexture', DG.wid, DG.coinTexture, [], COIN(i).coins);
                if COIN(i).selected == 1
                    Screen('FrameRect', DG.wid, DG.selRecColour, COIN(i).coins, DG.selRecSize);
    %                 COIN(i).removed = 1;
                end
            end
        end
        
%         for i = 1:length(COIN)
%             if COIN(i).selected == 0 && COIN(i).removed == 0
%                 Screen('DrawTexture', DG.wid, DG.coinTexture, [], COIN(i).coins);
%             elseif COIN(i).selected == 1 && COIN(i).removed == 0
%                 Screen('DrawTexture', DG.wid, DG.coinTexture, [], COIN(i).coins);
%                 Screen('FrameRect', DG.wid, DG.selRecColour, COIN(i).coins, DG.selRecSize);
% %                 COIN(i).removed = 1;
%             end
%         end
       
%         for i = 1:length(COIN)+1-trial
%             Screen('DrawTexture', DG.wid, DG.coinTexture, [], COIN(i).coins);
% 
%             if COIN(i).selected == 1
%                 Screen('FrameRect', DG.wid, DG.selRecColour, COIN(i).coins, DG.selRecSize);
%             end
%         end
                   
        for i = 1:length(BOX)
            BOX(i).selected = 0;
        end
        
          % show anonymous profile and 'you' above boxes
         Screen('TextSize', DG.wid, 40);
         if DG.box1 == 1
            DrawFormattedText(DG.wid, 'you', DG.youXLeft, DG.youHeight, [255 255 255]);
            Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(2).anon); 
             
         else
            DrawFormattedText(DG.wid, 'you', DG.youXRight, DG.youHeight, [255 255 255]);
            Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(1).anon);
             
         end
        
         % Counting coins
         Screen('TextSize', DG.wid, 100);
         DrawFormattedText(DG.wid, boxcount1, DG.coinCountleft, DG.coinCountheight, [255 255 255]);
         DrawFormattedText(DG.wid, boxcount2, DG.coinCountright, DG.coinCountheight, [255 255 255]);
         
         for i = length(BOX)
            if sum(buttons2) > 0 && IsInRect(zx, zy, BOX(i).box) == 1
                if BOX(i).selected == 0
                    BOX(i).selected = 1;  
                    MousePress2 = 1;
                    tbox = GetSecs;
                    RT = round((tbox - tcoin)*1000);
                elseif BOX(i).selected == 1
                    BOX(i).selected = 0;
                end
            end
         end
        % if a second mouse press is detected
%          if sum(buttons2) > 0
% %              MousePress2 = 1;
%              tbox = GetSecs;
%              RT = round((tbox - tcoin)*1000);
%             
%              % find which box it was in
%              if IsInRect(zx, zy, BOX(1).box) == 1
%                  BOX(1).selected = 1;
%              elseif IsInRect(zx, zy, BOX(2).box) == 1
%                  BOX(2).selected = 1;
%              else
%                  MousePress2 = 0;
%              end
             
        for i = 1:length(COIN)
            if COIN(i).removed == 0
                Screen('DrawTexture', DG.wid, DG.coinTexture, [], COIN(i).coins);
                if COIN(i).selected == 1
                    Screen('FrameRect', DG.wid, DG.selRecColour, COIN(i).coins, DG.selRecSize);
    %                 COIN(i).removed = 1;
                end
            end
        end
             
%         for i = 1:length(COIN)
%             if COIN(i).selected == 0 && COIN(i).removed == 0
%                 Screen('DrawTexture', DG.wid, DG.coinTexture, [], COIN(i).coins);
%             elseif COIN(i).selected == 1 && COIN(i).removed == 0
%                 Screen('DrawTexture', DG.wid, DG.coinTexture, [], COIN(i).coins);
%                 Screen('FrameRect', DG.wid, DG.selRecColour, COIN(i).coins, DG.selRecSize);
% %                 COIN(i).removed = 1;
%             end
%         end
        
%          % Make the coin texture again
%          for i = 1:length(COIN)+1-trial
%              Screen('DrawTexture', DG.wid, DG.coinTexture, [], COIN(i).coins);
%             if COIN(i).selected == 1
%                 Screen('FrameRect', DG.wid, DG.selRecColour, COIN(i).coins, DG.selRecSize);
%             end
%          end
            
         % draw a selected rectangle around the chosen box
         for i = 1:length(BOX)
             Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).box);
            if BOX(i).selected == 1
                Screen('FrameRect', DG.wid, DG.selRecColour, BOX(i).box, DG.selRecSize);
            end
         end
            
         % show both the coin and the selected box
         WaitSecs(0.1);
         Screen('Flip', DG.wid);
         WaitSecs(1);
%          WaitSecs(2); 
         
         end
         
%     end
        
    if MousePress1 == 1 && MousePress2 == 1
        Screen('DrawTexture', DG.wid, DG.skyTexture);
        
        
        for i = 1:length(COIN)
            if COIN(i).removed == 0
                Screen('DrawTexture', DG.wid, DG.coinTexture, [], COIN(i).coins);
                if COIN(i).selected == 1
                    COIN(i).removed = 1;
                    Screen('FrameRect', DG.wid, DG.selRecColour, COIN(i).coins, DG.selRecSize);
    %                 COIN(i).removed = 1;
                end
            end
        end
        
%         for i = 1:length(COIN)
%             if COIN(i).selected == 0 && COIN(i).removed == 0
%                 Screen('DrawTexture', DG.wid, DG.coinTexture, [], COIN(i).coins);
%                 
%             elseif COIN(i).selected == 1 && COIN(i).removed == 0
%                 COIN(i).removed = 1;
% %             elseif COIN(i).selected == 1 && COIN(i).removed == 0
% %                 Screen('FrameRect', DG.wid, DG.selRecColour, COIN(i).coins, DG.selRecSize);
% %                 COIN(i).removed = 1;
%             end
%         end
        
%         for i = 1:length(COIN)-trial
%             Screen('DrawTexture', DG.wid, DG.coinTexture, [], COIN(i).coins);
% %             Screen('FillRect', DG.wid, DG.redColour, COIN(i).coins);
% %             if COIN(i).selected == 1
% % %                 Screen('FillRect', DG.wid, DG.redColour, COIN(i).coins);
% %                 Screen('FrameRect', DG.wid, DG.selRecColour, COIN(i).coins, DG.selRecSize);
% %             elseif COIN(i).selected == 0
% %                 Screen('FillRect', DG.wid, DG.redColour, COIN(i).coins);
% %                 Screen('FrameRect', DG.wid, DG.unselRecColour, COIN(i).coins, DG.unselRecSize);
% %             end
%         end
            
         % draw a selected rectangle around the chosen box
         for i = 1:length(BOX)
             Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).box);
            if BOX(i).selected == 1
                Screen('FrameRect', DG.wid, DG.selRecColour, BOX(i).box, DG.selRecSize);
            else
                %Screen('FrameRect', DG.wid, DG.unselRecColour, BOX(i).box, DG.unselRecSize);
            end
         end
         
         if BOX(1).selected == 1
             Screen('DrawTexture', DG.wid, DG.coinTexture, [], BOXCOIN(1).coin);
             box1_count = box1_count + 1;
             boxcount1 = int2str(box1_count);
         elseif BOX(2).selected == 1
             Screen('DrawTexture', DG.wid, DG.coinTexture, [], BOXCOIN(2).coin);
             box2_count = box2_count + 1;
             boxcount2 = int2str(box2_count);
         end
         
         % show anonymous profile and 'you' above boxes
         Screen('TextSize', DG.wid, 40);
         if DG.box1 == 1
            DrawFormattedText(DG.wid, 'you', DG.youXLeft, DG.youHeight, [255 255 255]);
            Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(2).anon); 
             
         else
            DrawFormattedText(DG.wid, 'you', DG.youXRight, DG.youHeight, [255 255 255]);
            Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(1).anon);
             
         end
         
         % counting coins
         Screen('TextSize', DG.wid, 100);
         DrawFormattedText(DG.wid, boxcount1, DG.coinCountleft, DG.coinCountheight, [255 255 255]);
         DrawFormattedText(DG.wid, boxcount2, DG.coinCountright, DG.coinCountheight, [255 255 255]);
         
         
         Screen('Flip', DG.wid);
         
         
         WaitSecs(1);
         Screen('DrawTexture', DG.wid, DG.skyTexture);
         
%         for i = 1:length(COIN)-trial
%             Screen('DrawTexture', DG.wid, DG.coinTexture, [], COIN(i).coins);
% %             Screen('FillRect', DG.wid, DG.redColour, COIN(i).coins);
% %             if COIN(i).selected == 1
% % %                 Screen('FillRect', DG.wid, DG.redColour, COIN(i).coins);
% %                 Screen('FrameRect', DG.wid, DG.selRecColour, COIN(i).coins, DG.selRecSize);
% %             elseif COIN(i).selected == 0
% %                 Screen('FillRect', DG.wid, DG.redColour, COIN(i).coins);
% %                 Screen('FrameRect', DG.wid, DG.unselRecColour, COIN(i).coins, DG.unselRecSize);
% %             end
%         end
         
%         for i = 1:length(COIN)-trial
%             Screen('DrawTexture', DG.wid, DG.coinTexture, [], COIN(i).coins);
% %             Screen('FillRect', DG.wid, DG.redColour, COIN(i).coins);
% %             if COIN(i).selected == 1
% % %                 Screen('FillRect', DG.wid, DG.redColour, COIN(i).coins);
% %                 Screen('FrameRect', DG.wid, DG.selRecColour, COIN(i).coins, DG.selRecSize);
% %             elseif COIN(i).selected == 0
% %                 Screen('FillRect', DG.wid, DG.redColour, COIN(i).coins);
% %                 Screen('FrameRect', DG.wid, DG.unselRecColour, COIN(i).coins, DG.unselRecSize);
% %             end
%         end
         
%          for i = 1:length(BOX)
%             if BOX(i).selected == 1
%                 Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).box);
% 
%                 Screen('FrameRect', DG.wid, DG.selRecColour, BOX(i).box, DG.selRecSize);
%             else
%                 Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).box);
%                 Screen('FrameRect', DG.wid, DG.unselRecColour, BOX(i).box, DG.unselRecSize);
%             end
%          end
%          
%          Screen('TextSize', DG.wid, 100);
%          
%          DrawFormattedText(DG.wid, boxcount1, DG.origin(1)-0.3*DG.wRect(3), DG.coinCountheight, [255 255 255]);
%          DrawFormattedText(DG.wid, boxcount2, DG.coinCountright, DG.coinCountheight, [255 255 255]);
%          
%          Screen('TextSize', DG.wid, 40);
%          
% %          if BOX(1).selected == 1
% %             DrawFormattedText(DG.wid, boxcount, DG.origin(1)-0.10*DG.wRect(3), DG.coinCountheight, [255 255 255]);
% %          else
% %             DrawFormattedText(DG.wid, boxcount, DG.origin(1)+0.10*DG.wRect(3), DG.coinCountheight, [255 255 255]);
% %          end
%              
%          Screen('Flip', DG.wid);
%          WaitSecs(2);
         
         Screen('TextSize', DG.wid, DG.textSize);
    end
    
        
        dataFile = fopen(DG.dataFileName, 'a');
        %fprintf(dataFile, '%s \n', 'SJNB, Test_session, Date, Age, trial, boxcount1, boxcount2, RT');
        fprintf(dataFile, DG.formatString, DG.SJNB, DG.Test_session, DG.Date, DG.Age, trial, boxcount1, boxcount2, RT);
        fclose(dataFile);
    
         for i = 1:length(COIN)
            COIN(i).selected = 0;
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


    Screen('DrawTexture', DG.wid, DG.skyTexture);
    message = sprintf('You have put %s coins into the other child''s box,\nand %s into your own.', boxcount1, boxcount2);
    DrawFormattedText(DG.wid, message, 'center', 'center', [255 255 255]);
    
    Screen('Flip', DG.wid);
    WaitSecs(2);
    
end