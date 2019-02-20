function DG_drawInstructions(part,screen)

% To do: put 'you' and the anon profile on top of the present, change coordinates
% make them special for the instructions only like did in the old maid
% game.

global DG BOX INST

% Screen('FillRect',TD.wid,TD.backgroundColor);
% Screen('TextSize',TD.wid, TD.textSize);
%Screen('TextColor',TD.wid, TD.textColor);

if part == 1 % 10
    switch screen
        
        case 1
            Screen('DrawTexture', DG.wid, DG.skyTexture);
            
            message = '\n\n\n\nPress the SPACE bar to start.\nYou can use the left arrow key to go back\nthrough the instructions.';
            Screen('TextSize', DG.wid, 40);
            DrawFormattedText(DG.wid, message,'center',DG.origin(2)-0.2*DG.wRect(4), [DG.textColor], [], [], [], 1.5);
            
%             title_size = [300 200];
%             
%              rect4 = [DG.origin(1)-1.5*title_size(1) DG.origin(2)-0.6*title_size(2) ...
%                 DG.origin(1)+1.5*title_size(1) DG.origin(2)+0.1*title_size(2)];
%             Screen('DrawTexture', DG.wid, DG.titleTexture, [], rect4+[0 0.05*DG.wRect(4) 0 0.05*DG.wRect(4)]);

            rect4 = [DG.origin(1)-400 DG.origin(2)-300 DG.origin(1)+400 DG.origin(2)-75];
            
            Screen('DrawTexture', DG.wid, DG.titleTexture, [], rect4);
%             Screen('DrawTexture', DG.wid, DG.titleTexture);
            
%             Screen('DrawTexture',TD.wid,TD.TitleTexture);

        case 2
            Screen('DrawTexture', DG.wid, DG.skyTexture);
            
            message = 'In this game, you can win more coins that will go towards your present.\nThe more coins you get the bigger your present will be!';
            DrawFormattedText(DG.wid, message,'center',DG.instrucTextHeight, [DG.textColor], [], [], [], 1.5);
            
            Screen('DrawTexture', DG.wid, DG.boxTexture);
            
        case 3
            Screen('DrawTexture', DG.wid, DG.skyTexture);
            message = 'You will play this game with another child at another school that is also in our study.\nYou don''t know who the other child is, and they also don''t know who you are.';
            DrawFormattedText(DG.wid, message,'center',DG.instrucTextHeight, [DG.textColor], [], [], [], 1.5);

            rect = [DG.origin(1)-125 DG.origin(2)-150 DG.origin(1)+125 DG.origin(2)+150];
            Screen('DrawTexture', DG.wid, DG.anonTexture, [], rect);
            
        case 4
            Screen('DrawTexture', DG.wid, DG.skyTexture);
            message = 'In this game you will see two boxes. The one that says ''you'' above it is for you.\nThe one that has the question mark over it is for the other child.';
            DrawFormattedText(DG.wid, message,'center',DG.instrucTextHeight, [DG.textColor], [], [], [], 1.5);
            
            Screen('TextSize', DG.wid, 40);
            
             for i = 1:length(BOX)
                  Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).boxINST);
%                 Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).box);
             end
                     
             if DG.box1 == 1
                DrawFormattedText(DG.wid, 'you', DG.youXLeft, DG.youHeightINST, [255 255 255]);
                Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(2).anonINST); 
%                 Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(2).anon); 

             else
                DrawFormattedText(DG.wid, 'you', DG.youXRight, DG.youHeightINST, [255 255 255]);
                Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(1).anonINST);
%                 Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(1).anon);

             end
             
        case 5
            Screen('DrawTexture', DG.wid, DG.skyTexture);
            message = 'You will get 6 coins in this game. The other child will not get any coins.';
            DrawFormattedText(DG.wid, message,'center',DG.instrucTextHeight, [DG.textColor], [], [], [], 1.5);
            
            for i = 1:length(INST)
                Screen('DrawTexture', DG.wid, DG.coinTexture, [], INST(i).coins);
            end
            
        case 6
            Screen('DrawTexture', DG.wid, DG.skyTexture);
            message = 'In the game, you will divide the coins between your box and the box for the other child.';
            DrawFormattedText(DG.wid, message,'center',DG.instrucTextHeight, [DG.textColor], [], [], [], 1.5);
            
            for i = 1:length(INST)
                Screen('DrawTexture', DG.wid, DG.coinTexture, [], INST(i).coins);
            end
            
            for i = 1:length(BOX)
                Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).boxINST);
%                 Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).box);
            end
            
             if DG.box1 == 1
                DrawFormattedText(DG.wid, 'you', DG.youXLeft, DG.youHeightINST, [255 255 255]);
                Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(2).anonINST); 
%                 Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(2).anon); 

             else
                DrawFormattedText(DG.wid, 'you', DG.youXRight, DG.youHeightINST, [255 255 255]);
                Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(1).anonINST);
%                 Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(1).anon);

             end
             
        case 7
            Screen('DrawTexture', DG.wid, DG.skyTexture);
            message = 'The coins you put in your own box will go towards your present, and the coins you\nput in the box of the other child will go towards their present.';
            DrawFormattedText(DG.wid, message,'center',DG.instrucTextHeight, [DG.textColor], [], [], [], 1.5);
            
            for i = 1:length(INST)
                Screen('DrawTexture', DG.wid, DG.coinTexture, [], INST(i).coins);
            end
            
            for i = 1:length(BOX)
                Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).boxINST);
%                 Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).box);
            end
            
             if DG.box1 == 1
                DrawFormattedText(DG.wid, 'you', DG.youXLeft, DG.youHeightINST, [255 255 255]);
                Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(2).anonINST); 
%                 Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(2).anon); 

             else
                DrawFormattedText(DG.wid, 'you', DG.youXRight, DG.youHeightINST, [255 255 255]);
                Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(1).anonINST);
%                 Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(1).anon);

             end
             
        case 8
            Screen('DrawTexture', DG.wid, DG.skyTexture);
            message = 'You put the coins into a box by first clicking on a coin, and then\nclicking on the box you want to put it in.';
            DrawFormattedText(DG.wid, message,'center',DG.instrucTextHeight, [DG.textColor], [], [], [], 1.5);
            
             for i = 1:length(INST)
                Screen('DrawTexture', DG.wid, DG.coinTexture, [], INST(i).coins);
            end
            
            for i = 1:length(BOX)
                Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).boxINST);
%                 Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).box);
            end
            
             if DG.box1 == 1
                DrawFormattedText(DG.wid, 'you', DG.youXLeft, DG.youHeightINST, [255 255 255]);
                Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(2).anonINST); 
%                 Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(2).anon); 

             else
                DrawFormattedText(DG.wid, 'you', DG.youXRight, DG.youHeightINST, [255 255 255]);
                Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(1).anonINST);
%                 Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(1).anon);

             end

        case 9
            Screen('DrawTexture', DG.wid, DG.skyTexture);
            message = 'You will see an orange square around a coin when you have clicked on it.\nLike here you would have clicked on the top left coin:';
            DrawFormattedText(DG.wid, message,'center',DG.instrucTextHeight, [DG.textColor], [], [], [], 1.5);
            
             for i = 1:length(INST)
                Screen('DrawTexture', DG.wid, DG.coinTexture, [], INST(i).coins);
             end
            
             Screen('FrameRect', DG.wid, DG.selRecColour, INST(6).coins, DG.selRecSize);
            
            for i = 1:length(BOX)
                Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).boxINST);
%                 Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).box);
            end
            
             if DG.box1 == 1
                DrawFormattedText(DG.wid, 'you', DG.youXLeft, DG.youHeightINST, [255 255 255]);
                Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(2).anonINST); 
%                 Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(2).anon); 

             else
                DrawFormattedText(DG.wid, 'you', DG.youXRight, DG.youHeightINST, [255 255 255]);
                Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(1).anonINST);
%                 Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(1).anon);

             end

        case 10
            Screen('DrawTexture', DG.wid, DG.skyTexture);
            message = 'And then when you click the box you want to put the coin in,\nyou will see an orange square about the box you clicked too, like here I clicked on your box:';
            DrawFormattedText(DG.wid, message,'center',DG.instrucTextHeight, [DG.textColor], [], [], [], 1.5);
            
            for i = 1:length(INST)
                Screen('DrawTexture', DG.wid, DG.coinTexture, [], INST(i).coins);
             end
            
             Screen('FrameRect', DG.wid, DG.selRecColour, INST(6).coins, DG.selRecSize);
            
            for i = 1:length(BOX)
                Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).boxINST);
%                 Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).box);
            end
            
             if DG.box1 == 1
                DrawFormattedText(DG.wid, 'you', DG.youXLeft, DG.youHeightINST, [255 255 255]);
                Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(2).anonINST); 
                Screen('FrameRect', DG.wid, DG.selRecColour, BOX(1).boxINST, DG.selRecSize);
%                 Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(2).anon); 

             else
                DrawFormattedText(DG.wid, 'you', DG.youXRight, DG.youHeightINST, [255 255 255]);
                Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(1).anonINST);
                Screen('FrameRect', DG.wid, DG.selRecColour, BOX(2).boxINST, DG.selRecSize);
%                 Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(1).anon);

             end
             
        case 11
            Screen('DrawTexture', DG.wid, DG.skyTexture);
            message = 'You can decide for yourself how many coins you want to put into each of the boxes.\n\nAt the end of the game, you will get all the coins that are in your box,\nand the other child will get all the coins in their box.';
            DrawFormattedText(DG.wid, message,'center', 'center', [DG.textColor], [], [], [], 1.5);

        case 12
            Screen('DrawTexture', DG.wid, DG.skyTexture);
            message = 'Let''s see an example with two coins.';
            DrawFormattedText(DG.wid, message,'center',DG.instrucTextHeight, [DG.textColor], [], [], [], 1.5);
            
            Screen('DrawTexture', DG.wid, DG.coinTexture, [], INST(2).coins);
            Screen('DrawTexture', DG.wid, DG.coinTexture, [], INST(5).coins);
                
            for i = 1:length(BOX)
                Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).boxINST);
%                 Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).box);
            end
            
             if DG.box1 == 1
                DrawFormattedText(DG.wid, 'you', DG.youXLeft, DG.youHeightINST, [255 255 255]);
                Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(2).anonINST); 
%                 Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(2).anon); 

             else
                DrawFormattedText(DG.wid, 'you', DG.youXRight, DG.youHeightINST, [255 255 255]);
                Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(1).anonINST);
%                 Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(1).anon);

             end
            
        case 13
            Screen('DrawTexture', DG.wid, DG.skyTexture);
            message = 'With two coins, you can do several things.';
            DrawFormattedText(DG.wid, message,'center', DG.instrucTextHeight, [DG.textColor], [], [], [], 1.5);
            
            Screen('DrawTexture', DG.wid, DG.coinTexture, [], INST(2).coins);
            Screen('DrawTexture', DG.wid, DG.coinTexture, [], INST(5).coins);
            
            for i = 1:length(BOX)
                Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).boxINST);
%                 Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).box);
            end
            
             if DG.box1 == 1
                DrawFormattedText(DG.wid, 'you', DG.youXLeft, DG.youHeightINST, [255 255 255]);
                Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(2).anonINST); 
%                 Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(2).anon); 

             else
                DrawFormattedText(DG.wid, 'you', DG.youXRight, DG.youHeightINST, [255 255 255]);
                Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(1).anonINST);
%                 Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(1).anon);

             end
             
        case 14
            Screen('DrawTexture', DG.wid, DG.skyTexture);
            message = 'You could both the coins in the box that says ''you'',\nso you can keep all the coins.';
            DrawFormattedText(DG.wid, message,'center', DG.instrucTextHeight, [DG.textColor], [], [], [], 1.5);
            
            for i = 1:length(BOX)
                Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).boxINST);
%                 Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).box);
            end
            

            
             if DG.box1 == 1
                DrawFormattedText(DG.wid, 'you', DG.youXLeft, DG.youHeightINST, [255 255 255]);
                Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(2).anonINST); 
                Screen('FrameRect', DG.wid, DG.selRecColour, BOX(1).boxINST, DG.selRecSize);
                Screen('DrawTexture', DG.wid, DG.coinTexture, [], INST(3).coins);
                Screen('DrawTexture', DG.wid, DG.coinTexture, [], INST(6).coins);
                boxcount1 = '2';
                boxcount2 = '0';
%                 Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(2).anon); 

             else
                DrawFormattedText(DG.wid, 'you', DG.youXRight, DG.youHeightINST, [255 255 255]);
                Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(1).anonINST);
                Screen('FrameRect', DG.wid, DG.selRecColour, BOX(2).boxINST, DG.selRecSize);
                Screen('DrawTexture', DG.wid, DG.coinTexture, [], INST(1).coins);
                Screen('DrawTexture', DG.wid, DG.coinTexture, [], INST(4).coins);
                boxcount1 = '0';
                boxcount2 = '2';
%                 Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(1).anon);

             end
             
             Screen('TextSize', DG.wid, 100);
             DrawFormattedText(DG.wid, boxcount1, DG.coinCountleft, DG.coinCountheight, [255 255 255]);
             DrawFormattedText(DG.wid, boxcount2, DG.coinCountright, DG.coinCountheight, [255 255 255]);
           
        case 15
            Screen('TextSize', DG.wid, DG.textSize);
            Screen('DrawTexture', DG.wid, DG.skyTexture);
            message = 'Or you could both the coins in the box of the other child,\nso that they can keep all the coins.';
            DrawFormattedText(DG.wid, message,'center', DG.instrucTextHeight, [DG.textColor], [], [], [], 1.5);
            
            for i = 1:length(BOX)
                Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).boxINST);
%                 Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).box);
            end
            
            if DG.box1 == 1
                DrawFormattedText(DG.wid, 'you', DG.youXLeft, DG.youHeightINST, [255 255 255]);
                Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(2).anonINST); 
                Screen('FrameRect', DG.wid, DG.selRecColour, BOX(2).boxINST, DG.selRecSize);
                Screen('DrawTexture', DG.wid, DG.coinTexture, [], INST(1).coins);
                Screen('DrawTexture', DG.wid, DG.coinTexture, [], INST(4).coins);
                boxcount1 = '0';
                boxcount2 = '2';
%                 Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(2).anon); 

             else
                DrawFormattedText(DG.wid, 'you', DG.youXRight, DG.youHeightINST, [255 255 255]);
                Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(1).anonINST);
                Screen('FrameRect', DG.wid, DG.selRecColour, BOX(1).boxINST, DG.selRecSize);
                Screen('DrawTexture', DG.wid, DG.coinTexture, [], INST(3).coins);
                Screen('DrawTexture', DG.wid, DG.coinTexture, [], INST(6).coins);
                boxcount1 = '2';
                boxcount2 = '0';
%                 Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(1).anon);

            end
            
            Screen('TextSize', DG.wid, 100);
             DrawFormattedText(DG.wid, boxcount1, DG.coinCountleft, DG.coinCountheight, [255 255 255]);
             DrawFormattedText(DG.wid, boxcount2, DG.coinCountright, DG.coinCountheight, [255 255 255]);
             
             
         case 16
            Screen('TextSize', DG.wid, DG.textSize);
            Screen('DrawTexture', DG.wid, DG.skyTexture);
            message = 'Or you could put one coin in each box,\nso that both you and the other child get one coin.';
            DrawFormattedText(DG.wid, message,'center', DG.instrucTextHeight, [DG.textColor], [], [], [], 1.5);
            
            for i = 1:length(BOX)
                Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).boxINST);
%                 Screen('DrawTexture', DG.wid, DG.boxTexture, [], BOX(i).box);
            end
            
            Screen('DrawTexture', DG.wid, DG.coinTexture, [], INST(1).coins);
            Screen('DrawTexture', DG.wid, DG.coinTexture, [], INST(3).coins);
            
            if DG.box1 == 1
                DrawFormattedText(DG.wid, 'you', DG.youXLeft, DG.youHeightINST, [255 255 255]);
                Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(2).anonINST); 
                Screen('FrameRect', DG.wid, DG.selRecColour, BOX(1).boxINST, DG.selRecSize);
                Screen('FrameRect', DG.wid, DG.selRecColour, BOX(2).boxINST, DG.selRecSize);
%                 Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(2).anon); 

             else
                DrawFormattedText(DG.wid, 'you', DG.youXRight, DG.youHeightINST, [255 255 255]);
                Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(1).anonINST);
                Screen('FrameRect', DG.wid, DG.selRecColour, BOX(1).boxINST, DG.selRecSize);
                Screen('FrameRect', DG.wid, DG.selRecColour, BOX(2).boxINST, DG.selRecSize);
%                 Screen('DrawTexture', DG.wid, DG.anonTexture, [], BOX(1).anon);

            end
            
            Screen('TextSize', DG.wid, 100);
             DrawFormattedText(DG.wid, '1', DG.coinCountleft, DG.coinCountheight, [255 255 255]);
             DrawFormattedText(DG.wid, '1', DG.coinCountright, DG.coinCountheight, [255 255 255]);
             
             Screen('TextSize', DG.wid, DG.textSize);
            
            
        case 17
            Screen('TextSize', DG.wid, DG.textSize);
            Screen('DrawTexture', DG.wid, DG.skyTexture);
            message = 'When you play the game, you will get 6 coins to divide between the two boxes\nhowever you like. We won''t look at what you''re doing, and you can\njust let a researcher know when you''ve finished.';
            DrawFormattedText(DG.wid, message,'center', 'center', [DG.textColor], [], [], [], 1.5);
            
        case 18
            Screen('TextSize', DG.wid, DG.textSize);
            Screen('DrawTexture', DG.wid, DG.skyTexture);
            message = 'At the end of the game, all the coins that are in your box will go\ntowards your present, and all the coins that are in the box\nfor the other child will go towards their present.';
            DrawFormattedText(DG.wid, message,'center', 'center', [DG.textColor], [], [], [], 1.5);
            
        case 19
            Screen('TextSize', DG.wid, DG.textSize);
            Screen('DrawTexture', DG.wid, DG.skyTexture);
            message = 'You''re all ready to begin now, but before you start,\nplease tell a researcher that you''re ready to begin!.';
            DrawFormattedText(DG.wid, message,'center', 'center', [DG.textColor], [], [], [], 1.5);
            
        case 20
            Screen('TextSize', DG.wid, DG.textSize);
            Screen('DrawTexture', DG.wid, DG.skyTexture);
            message = 'Let''s start!';
            DrawFormattedText(DG.wid, message,'center', 'center', [DG.textColor], [], [], [], 1.5);

    end
    
end

if part == 2 % 1
    switch screen
        
        case 1
            Screen('DrawTexture', DG.wid, DG.skyTexture);
            
            message = 'Well done! You''re all finished!\n\nPlease let a researcher know you''re ready for the next game.';
            Screen('TextSize', DG.wid, 40);
            DrawFormattedText(DG.wid, message,'center',DG.origin(2)-0.2*DG.wRect(4), [DG.textColor], [], [], [], 1.5);
            
    end
end

            
%         case 2
%             Screen('DrawTexture', DG.wid, DG.greywoodTexture);
%             message = 'In this game you can win coins again for your present.\nYou will be playing this game with 10 cards.';
%             DrawFormattedText(DG.wid, message,'center',DG.instrucTextHeightCen, [DG.textColor], [], [], [], 1.5);
%             
%         case 3
%             Screen('DrawTexture', DG.wid, DG.greywoodTexture);
%             message = 'The cards look like this. On 9 cards there are different animals, but on one\ncard, there is Randy the naughty raccoon.\nRandy wants to steal all your cards!';
%             DrawFormattedText(DG.wid,message,'center',DG.instrucTextHeight, [DG.textColor], [], [], [], 1.5);
%             
%             sequence = [1 0 0 0 0 0 0 0 0 0];
%             sequence = sequence(randperm(length(sequence)));
%             animals = datasample(1:26, 10, 'Replace', false);
% 
%             display animations
%             for i = 1:length(RECS)
%                     if sequence(i) == 0 % normal animal
%                         t = animals(i);
%                         Screen('FillRect', DG.wid, DG.turnedCardColour, INSTRUCT(i).rectangles);
%                         Screen('DrawTexture', DG.wid, ANIMAL(t).AniTexture, [], INSTRUCT(i).animals);
%                     elseif sequence(i) == 1 % troll face
%                         Screen('FillRect', DG.wid, DG.redColour, INSTRUCT(i).rectangles);
%                         Screen('DrawTexture', DG.wid, DG.trollTexture, [], INSTRUCT(i).animals);
%                     end
%             end
%                 
%         case 4
%             Screen('DrawTexture', DG.wid, DG.greywoodTexture);
%             message = 'When you''re playing this game, the cards will be upside down,\nso you won''t know which card is what.';
%             DrawFormattedText(DG.wid,message,'center',DG.instrucTextHeight, [DG.textColor], [], [], [], 1.5);
%             
%             for i = 1:length(INSTRUCT)
%                 Screen('DrawTexture', DG.wid, DG.cardsTexture, [], INSTRUCT(i).rectangles);
%             end
%             
%         case 5
%             Screen('DrawTexture', DG.wid, DG.greywoodTexture);
%             message = 'When you play, you can choose as many cards as you want.\nOnce you have finished choosing all the cards you want, we will turn them around.';
%             DrawFormattedText(DG.wid,message,'center',DG.instrucTextHeight, [DG.textColor], [], [], [], 1.5);
%             
%             for i = 1:length(RECS)
%                 Screen('DrawTexture', DG.wid, DG.cardsTexture, [], INSTRUCT(i).rectangles);
%             end
%             
%         case 6
%             Screen('DrawTexture', DG.wid, DG.greywoodTexture);
%             message = 'The cards that you have chosen you can keep. But, be careful,\nbecause if you have chosen the card with Randy on it, you cannot\nkeep any of your cards, because he stole them all!';
%             DrawFormattedText(DG.wid,message,'center',DG.instrucTextHeightCen, [DG.textColor], [], [], [], 1.5);
%             
%             for i = 1:length(RECS)
%                 Screen('DrawTexture', DG.wid, DG.cardsTexture, [], RECS(i).rectangles);
%             end
% 
%         case 7
%             Screen('DrawTexture', DG.wid, DG.greywoodTexture);
%             message = 'The more cards you choose, the more you can keep and\nthe more coins you can win.\n\nBut the more cards you choose,\nthe more dangerous it is, because you might choose Randy!';
%             DrawFormattedText(DG.wid,message,'center',DG.instrucTextHeightCen, [DG.textColor], [], [], [], 1.5);
%             
%         case 8
%             Screen('DrawTexture', DG.wid, DG.greywoodTexture);
%             message = 'Let''s look at sDGe examples next,\nwith the cards facing up again';
%             DrawFormattedText(DG.wid,message,'center',DG.instrucTextHeightCen, [DG.textColor], [], [], [], 1.5);
%             
%         case 9
%             Screen('DrawTexture', DG.wid, DG.greywoodTexture);
%             message = 'If you would choose these cards with the black border, how many cards could you keep?';
%             DrawFormattedText(DG.wid,message,'center',DG.instrucTextHeight, [DG.textColor], [], [], [], 1.5);
%             
%             sequence = [1 1 1 0 1 1 2 0 1 1];
%             sequence = sequence(randperm(length(sequence)));
%             animals = (1:10);
%             animals = datasample(1:26, 10, 'Replace', false);
%             
%             for i = 1:length(RECS)
%                 t = animals(i);
%                     if sequence(i) == 1 % normal animal selected
%                         Screen('FillRect', DG.wid, DG.turnedCardColour, INSTRUCT(i).rectangles);
%                         Screen('DrawTexture', DG.wid, ANIMAL(t).AniTexture, [], INSTRUCT(i).animals);
%                         Screen('FrameRect', DG.wid, DG.instrucSelColour, INSTRUCT(i).rectangles, DG.instructRecSize);
%                     elseif sequence(i) == 0
%                         Screen('FillRect', DG.wid, DG.turnedCardColour, INSTRUCT(i).rectangles);
%                         Screen('DrawTexture', DG.wid, ANIMAL(t).AniTexture, [], INSTRUCT(i).animals);
%                         Screen('DrawTexture', DG.wid, DG.greyTexture, [], INSTRUCT(i).rectangles);
%                     elseif sequence(i) == 2 % troll face
%                         Screen('FillRect', DG.wid, DG.redColour, INSTRUCT(i).rectangles);
%                         Screen('DrawTexture', DG.wid, DG.trollTexture, [], INSTRUCT(i).animals);
%                         Screen('DrawTexture', DG.wid, DG.greyTexture, [], INSTRUCT(i).rectangles);
%                     end
%             end
%             
%         case 10
%             Screen('DrawTexture', DG.wid, DG.greywoodTexture);
%             message = 'If you said 7, that is the correct answer!\nYou didn''t get Randy, so you can keep all your cards.';
%             DrawFormattedText(DG.wid,message,'center',DG.instrucTextHeight, [DG.textColor], [], [], [], 1.5);
%             
%             sequence = [1 1 1 0 1 1 2 0 1 1];
%             sequence = sequence(randperm(length(sequence)));
%             animals = (1:10);
%             
%             for i = 1:length(INSTRUCT)
%                 t = animals(i);
%                     if sequence(i) == 1 % normal animal
%                         Screen('FillRect', DG.wid, DG.turnedCardColour, INSTRUCT(i).rectangles);
%                         Screen('DrawTexture', DG.wid, ANIMAL(t).AniTexture, [], INSTRUCT(i).animals);
%                         Screen('FrameRect', DG.wid, DG.instrucSelColour, INSTRUCT(i).rectangles, DG.instructRecSize);
%                     elseif sequence(i) == 0
%                         Screen('FillRect', DG.wid, DG.turnedCardColour, INSTRUCT(i).rectangles);
%                         Screen('DrawTexture', DG.wid, ANIMAL(t).AniTexture, [], INSTRUCT(i).animals);
%                         Screen('DrawTexture', DG.wid, DG.greyTexture, [], INSTRUCT(i).rectangles);
%                     elseif sequence(i) == 2 % troll face
%                         Screen('FillRect', DG.wid, DG.redColour, INSTRUCT(i).rectangles);
%                         Screen('DrawTexture', DG.wid, DG.trollTexture, [], INSTRUCT(i).animals);
%                         Screen('DrawTexture', DG.wid, DG.greyTexture, [], INSTRUCT(i).rectangles);
%                     end
%             end
% 
%         case 11
%             Screen('DrawTexture', DG.wid, DG.greywoodTexture);
%             message = 'Let''s do another one.\nIf you would choose these 3 cards, how many could you keep?';
%             DrawFormattedText(DG.wid,message,'center',DG.instrucTextHeight, [DG.textColor], [], [], [], 1.5);
%             
%             sequence = [0 0 1 0 1 0 2 0 1 0];
%             sequence = sequence(randperm(length(sequence)));
%             animals = (11:21);
%             
%             for i = 1:length(INSTRUCT)
%                 t = animals(i);
%                     if sequence(i) == 1 % normal animal
%                         Screen('FillRect', DG.wid, DG.turnedCardColour, INSTRUCT(i).rectangles);
%                         Screen('DrawTexture', DG.wid, ANIMAL(t).AniTexture, [], INSTRUCT(i).animals);
%                         Screen('FrameRect', DG.wid, DG.instrucSelColour, INSTRUCT(i).rectangles, DG.instructRecSize);
%                     elseif sequence(i) == 0
%                         Screen('FillRect', DG.wid, DG.turnedCardColour, INSTRUCT(i).rectangles);
%                         Screen('DrawTexture', DG.wid, ANIMAL(t).AniTexture, [], INSTRUCT(i).animals);
%                         Screen('DrawTexture', DG.wid, DG.greyTexture, [], INSTRUCT(i).rectangles);
%                     elseif sequence(i) == 2 % troll face
%                         Screen('FillRect', DG.wid, DG.redColour, INSTRUCT(i).rectangles);
%                         Screen('DrawTexture', DG.wid, DG.trollTexture, [], INSTRUCT(i).animals);
%                         Screen('DrawTexture', DG.wid, DG.greyTexture, [], INSTRUCT(i).rectangles);
%                     end
%             end
%             
%          case 12
%             Screen('DrawTexture', DG.wid, DG.greywoodTexture);
%             message = 'If you said 3 that was correct!';
%             DrawFormattedText(DG.wid,message,'center',DG.instrucTextHeight, [DG.textColor], [], [], [], 1.5);
%             
%             sequence = [0 0 1 0 1 0 2 0 1 0];
%             sequence = sequence(randperm(length(sequence)));
%             animals = (11:21);
%             
%             for i = 1:length(RECS)
%                 t = animals(i);
%                     if sequence(i) == 1 % normal animal
%                         Screen('FillRect', DG.wid, DG.turnedCardColour, INSTRUCT(i).rectangles);
%                         Screen('DrawTexture', DG.wid, ANIMAL(t).AniTexture, [], INSTRUCT(i).animals);
%                         Screen('FrameRect', DG.wid, DG.instrucSelColour, INSTRUCT(i).rectangles, DG.instructRecSize);
%                     elseif sequence(i) == 0
%                         Screen('FillRect', DG.wid, DG.turnedCardColour, INSTRUCT(i).rectangles);
%                         Screen('DrawTexture', DG.wid, ANIMAL(t).AniTexture, [], INSTRUCT(i).animals);
%                         Screen('DrawTexture', DG.wid, DG.greyTexture, [], INSTRUCT(i).rectangles);
%                     elseif sequence(i) == 2 % troll face
%                         Screen('FillRect', DG.wid, DG.redColour, INSTRUCT(i).rectangles);
%                         Screen('DrawTexture', DG.wid, DG.trollTexture, [], INSTRUCT(i).animals);
%                         Screen('DrawTexture', DG.wid, DG.greyTexture, [], INSTRUCT(i).rectangles);
%                     end
%             end
%             
%          case 13
%             Screen('DrawTexture', DG.wid, DG.greywoodTexture);
%             message = 'One more.\nIf you would pick these cards, how many could you keep?';
%             DrawFormattedText(DG.wid,message,'center',DG.instrucTextHeight, [DG.textColor], [], [], [], 1.5);
%             
%             sequence = [0 1 2 0 1 0 0 0 0 0];
%             sequence = sequence(randperm(length(sequence)));
%             animals = (16:26);
%             
%             for i = 1:length(INSTRUCT)
%                 t = animals(i);
%                     if sequence(i) == 1 % normal animal
%                         Screen('FillRect', DG.wid, DG.turnedCardColour, INSTRUCT(i).rectangles);
%                         Screen('DrawTexture', DG.wid, ANIMAL(t).AniTexture, [], INSTRUCT(i).animals);
%                         Screen('FrameRect', DG.wid, DG.instrucSelColour, INSTRUCT(i).rectangles, DG.instructRecSize);
%                     elseif sequence(i) == 0
%                         Screen('FillRect', DG.wid, DG.turnedCardColour, INSTRUCT(i).rectangles);
%                         Screen('DrawTexture', DG.wid, ANIMAL(t).AniTexture, [], INSTRUCT(i).animals);
%                         Screen('DrawTexture', DG.wid, DG.greyTexture, [], INSTRUCT(i).rectangles);
%                     elseif sequence(i) == 2 % troll face
%                         Screen('FillRect', DG.wid, DG.redColour, INSTRUCT(i).rectangles);
%                         Screen('DrawTexture', DG.wid, DG.trollTexture, [], INSTRUCT(i).animals);
%                         Screen('FrameRect', DG.wid, DG.instrucSelColour, INSTRUCT(i).rectangles, DG.instructRecSize);
%                     end
%             end
%             
%          case 14
%              Screen('DrawTexture', DG.wid, DG.greywoodTexture);
%             message = 'If you said 0 cards, that is correct!\nSince you chose Randy this time and he stole your cards!';
%             DrawFormattedText(DG.wid,message,'center',DG.instrucTextHeight, [DG.textColor], [], [], [], 1.5);
%             
%             sequence = [0 1 2 0 1 0 0 0 0 0];
%             sequence = sequence(randperm(length(sequence)));
%             animals = (16:26);
%             
%             for i = 1:length(INSTRUCT)
%                 t = animals(i);
%                     if sequence(i) == 1 % normal animal
%                         Screen('FillRect', DG.wid, DG.turnedCardColour, INSTRUCT(i).rectangles);
%                         Screen('DrawTexture', DG.wid, ANIMAL(t).AniTexture, [], INSTRUCT(i).animals);
%                         Screen('FrameRect', DG.wid, DG.instrucSelColour, INSTRUCT(i).rectangles, DG.instructRecSize);
%                     elseif sequence(i) == 0
%                         Screen('FillRect', DG.wid, DG.turnedCardColour, INSTRUCT(i).rectangles);
%                         Screen('DrawTexture', DG.wid, ANIMAL(t).AniTexture, [], INSTRUCT(i).animals);
%                         Screen('DrawTexture', DG.wid, DG.greyTexture, [], INSTRUCT(i).rectangles);
%                     elseif sequence(i) == 2 % troll face
%                         Screen('FillRect', DG.wid, DG.redColour, INSTRUCT(i).rectangles);
%                         Screen('DrawTexture', DG.wid, DG.trollTexture, [], INSTRUCT(i).animals);
%                         Screen('FrameRect', DG.wid, DG.instrucSelColour, INSTRUCT(i).rectangles, DG.instructRecSize);
%                     end
%             end
%             
%         case 15
%             Screen('DrawTexture', DG.wid, DG.greywoodTexture);
%             message = 'In the real game, the cards will be upside down and you can''t see where Randy is.\nWhich of these two choices would be more dangerous;\nchoosing all the cards with the red or the green border?';
%             DrawFormattedText(DG.wid,message,'center',DG.instrucTextHeight, [DG.textColor], [], [], [], 1.5);
%             
%             for i = 1:length(INSTRUCT)
%                 Screen('DrawTexture', DG.wid, DG.cardsTexture, [], INSTRUCT(i).rectangles);
%             end
%             
%             sequence = [1 0 0 0 0 1 0 0 0 0];
%             
%             for i = 1:length(INSTRUCT)
%                 Screen('DrawTexture', DG.wid, DG.cardsTexture, [], INSTRUCT(i).rectangles);
%                     if sequence(i) == 1 % normal animal
%                         Screen('FrameRect', DG.wid, DG.redColour, INSTRUCT(i).rectangles, DG.instructRecSize);
%                     elseif sequence(i) == 0
%                         Screen('FrameRect', DG.wid, [66, 244, 72], INSTRUCT(i).rectangles, DG.instructRecSize);
%                     end
%             end
%             
%         case 16
%             Screen('DrawTexture', DG.wid, DG.greywoodTexture);
%             message = 'In this case, picking the 8 cards with the green border\nwould be more dangerous, because Randy is more likely to be one of them!';
%             DrawFormattedText(DG.wid,message,'center',DG.instrucTextHeight, [DG.textColor], [], [], [], 1.5);
%             
%             for i = 1:length(INSTRUCT)
%                 Screen('DrawTexture', DG.wid, DG.cardsTexture, [], INSTRUCT(i).rectangles);
%             end
%             
%             sequence = [1 0 0 0 0 1 0 0 0 0];
%             
%             for i = 1:length(INSTRUCT)
%                 Screen('DrawTexture', DG.wid, DG.cardsTexture, [], INSTRUCT(i).rectangles);
%                     if sequence(i) == 1 % normal animal
%                         Screen('FrameRect', DG.wid, DG.redColour, INSTRUCT(i).rectangles, DG.instructRecSize);
%                     elseif sequence(i) == 0
%                         Screen('FrameRect', DG.wid, [66, 244, 72], INSTRUCT(i).rectangles, DG.instructRecSize);
%                     end
%             end
%             
%         case 17
%             Screen('DrawTexture', DG.wid, DG.greywoodTexture);
%             message = 'We will play this game 5 times. Pick as many cards as you want every time.\n\nIf you pick Randy, you will still get to keep the cards you have won before.\nYou only lose all the cards for that time.\n\nRemember, the more cards you have at the end, the bigger your present will be!';
%             DrawFormattedText(DG.wid,message,'center',DG.instrucTextHeightCen, [DG.textColor], [], [], [], 1.5);
%             
%         case 18
%             Screen('DrawTexture', DG.wid, DG.greywoodTexture);
%             message = 'Do you understand everything?\n\nIf you have a question, make sure to ask a researcher!';
%             DrawFormattedText(DG.wid,message,'center',DG.instrucTextHeightCen, [DG.textColor], [], [], [], 1.5);
%             
%         case 19
%             Screen('DrawTexture', DG.wid, DG.greywoodTexture);
%             message = 'Let''s start!\n\nGood luck!';
%             DrawFormattedText(DG.wid,message,'center',DG.instrucTextHeightCen, [DG.textColor], [], [], [], 1.5);
%             
%             
%     end
% end
% 
% if part == 2
%     switch screen
%         
%         case 1
%             Screen('DrawTexture', DG.wid, DG.greywoodTexture);
%             message = 'You''re all finished!\n\nThank you for playing!';
%             DrawFormattedText(DG.wid,message,'center',DG.instrucTextHeightCen, [DG.textColor], [], [], [], 1.5);
%             
%     end
% end
% 
%         
%         