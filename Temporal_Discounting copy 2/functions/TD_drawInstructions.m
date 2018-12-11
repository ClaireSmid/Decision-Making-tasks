function TD_drawInstructions(part,screen)

global TD wrapat IMG

Screen('FillRect',TD.wid,TD.backgroundColor);
Screen('TextSize',TD.wid, TD.textSize);
%Screen('TextColor',TD.wid, TD.textColor);

if part == 1 % 10
    switch screen
        
        case 1
            message = '\n\n\n\n\n\nPress the SPACE bar to start.';
            DrawFormattedText(TD.wid, message,'center','center', [TD.textColor], wrapat, [], [], 1.5);
            
            title_size = 200;
            
             rect4 = [TD.origin(1)-1.5*title_size TD.origin(2)-0.6*title_size ...
                TD.origin(1)+1.5*title_size TD.origin(2)+0.1*title_size];
            Screen('DrawTexture',TD.wid,TD.TitleTexture,[],rect4+[0 0.05*TD.wRect(4) 0 0.05*TD.wRect(4)]);
            
%             Screen('DrawTexture',TD.wid,TD.TitleTexture);
            
        case 2
            message = 'In this game, you can win more coins that will contribute towards your present. The more coins you have the bigger your present will be!\n\nLet''s see how this game works first.\n\n\n\n';
            DrawFormattedText(TD.wid, message,'center', TD.origin(2)-0.35*TD.wRect(4), [TD.textColor], wrapat, [], [], 1.5);
            
%             animalsize = 200; % show animals for fun
            coinsize = 100;
            rect_1 = [TD.origin(1)-0.5*coinsize TD.origin(2)-0.5*coinsize ...
                TD.origin(1)+0.5*coinsize TD.origin(2)+0.5*coinsize];
            Screen('DrawTexture',TD.wid,TD.coinTexture,[],rect_1);

       
        case 3
            message = 'In this game, you will see coins on the screen. The more coins you see, the more you can win.\n\n\n\n\n';
            DrawFormattedText(TD.wid,message,'center',TD.origin(2)-0.35*TD.wRect(4), [TD.textColor], wrapat, [], [], 1.5);
%             animalsize = 200;
%             rect_1 = [CF.origin(1)-1.25*animalsize CF.origin(2)-0.5*animalsize ...
%                 CF.origin(1)-0.25*animalsize CF.origin(2)+0.5*animalsize];
%             rect_2 = [CF.origin(1)+0.25*animalsize CF.origin(2)-0.5*animalsize ...
%                 CF.origin(1)+1.25*animalsize CF.origin(2)+0.5*animalsize];
%             Screen('DrawTexture',CF.wid,CF.BigDogTexture(1,1),[],rect_1);
%             Screen('DrawTexture',CF.wid,CF.BigCatTexture(1,2),[],rect_2);
            
%             Screen('DrawTexture',CF.wid,CF.BigCatTexture);

            coinsize = 300;
            rect_1 = [TD.origin(1)-0.5*coinsize TD.origin(2)-0.5*coinsize ...
                TD.origin(1)+0.5*coinsize TD.origin(2)+0.5*coinsize];
            Screen('DrawTexture',TD.wid,TD.coinsTexture,[],rect_1);
            
%             Screen('DrawTexture',CF.wid,CF.coinsTexture);

            
        case 4
            message = ' Above these coins, you might see some moons with a sleeping hat. Each moon is a week, so one moon like here is 1 week.';
            DrawFormattedText(TD.wid,message,'center',TD.origin(2)-0.35*TD.wRect(4), [TD.textColor], wrapat, [], [], 1.5);
            
             moonsize = 150;
            rect_1 = [TD.origin(1)-0.5*moonsize TD.origin(2)-0.5*moonsize ...
                TD.origin(1)+0.5*moonsize TD.origin(2)+0.5*moonsize];
            Screen('DrawTexture',TD.wid,TD.moonTexture,[],rect_1);
            
%             moonsize = 100;
%             rect_1 = [CF.origin(1)-0.5*moonsize CF.origin(2)-0.5*moonsize ...
%                 CF.origin(1)+0.5*moonsize CF.origin(2)+0.5*moonsize];
%             Screen('DrawTexture',CF.wid,CF.moonTexture,[],rect_1);
            
        case 5
            message = 'The moons show you how many weeks you will have to wait before you get your present. The more moons you see, the more weeks you will have to wait before you get your gift.';
            DrawFormattedText(TD.wid,message,'center',TD.origin(2)-0.35*TD.wRect(4), [TD.textColor], wrapat, [], [], 1.5);
            
            moonsize = 300;
            rect_1 = [TD.origin(1)-0.5*moonsize TD.origin(2)-0.5*moonsize ...
                TD.origin(1)+0.5*moonsize TD.origin(2)+0.5*moonsize];
            Screen('DrawTexture',TD.wid,TD.moonsTexture,[],rect_1);

        case 6
            message = 'Can you take a look at this picture, and tell me how many coins you can win?\n\n';
            DrawFormattedText(TD.wid,message,'center',TD.origin(2)-0.35*TD.wRect(4), [TD.textColor], wrapat, [], [], 1.5);
            
%             animalsize = 300;
%             rect = [CF.origin(1)-1.5*animalsize(1) CF.origin(2)-2.5*animalsize(2) ...
%                 CF.origin(1)+1.5*animalsize(1) CF.origin(2)+0.5*animalsize(2)];
%             Screen('DrawTexture',CF.wid,CF.BigCatTexture,[],rect+[0 -0.1*CF.wRect(4) 0 -0.1*CF.wRect(4)]);

            Screen('DrawTexture',TD.wid,TD.Instruction1Texture);
           
            
            
        case 7
            message = 'And how many moons can you see? Can you tell me how many weeks that are?';
            DrawFormattedText(TD.wid,message,'center',TD.origin(2)-0.37*TD.wRect(4), [TD.textColor], wrapat, [], [], 1.5);
%             animalsize = 300;
%             rect1 = [CF.origin(1)-0.5*animalsize(1) CF.origin(2)-1.5*animalsize(2) ...
%                 CF.origin(1)+0.5*animalsize(1) CF.origin(2)-0.5*animalsize(2)];
%             Screen('DrawTexture',CF.wid,CF.BigCatTexture,[],rect1+[0 -0.1*CF.wRect(4) 0 -0.1*CF.wRect(4)]);

            Screen('DrawTexture',TD.wid,TD.Instruction1Texture);
            
%             keysize = 150;
%             rect4 = [CF.origin(1)-0.7*keysize CF.origin(2)+2.2*keysize ...
%                 CF.origin(1)+0.7*keysize CF.origin(2)+3.2*keysize];
%             Screen('DrawTexture',CF.wid,CF.animalkeysTexture,[],rect4+[0 0.05*CF.wRect(4) 0 0.05*CF.wRect(4)]);

            
        case 8
            message = 'How about this picture. How many coins can you win here? And how many moons do you see? Do you know how many weeks you have to wait?';
            DrawFormattedText(TD.wid,message,'center',TD.origin(2)-0.35*TD.wRect(4), [TD.textColor], wrapat, [], [], 1.5);
            
            Screen('DrawTexture',TD.wid,TD.Instruction2Texture);

            
        case 9
            
            message = 'In a bit, you will see two pictures next to each other, with a block box underneath them. You can choose one of the pictures, that you like best.\n\n\n\n\n\n\n\n\n\nHere, if you pick the right picture you would win 8 coins and you would have to wait one week. If you pick the left picture, you only get 2 coins but you don''t have to wait for your present.';
            DrawFormattedText(TD.wid,message,'center',TD.origin(2)-0.35*TD.wRect(4), [TD.textColor], wrapat, [], [], 1.5);
%             animalsize = 100;
%             rect1 = [CF.origin(1)-0.5*animalsize(1) CF.origin(2)-1.5*animalsize(2) ...
%                 CF.origin(1)+0.5*animalsize(1) CF.origin(2)-0.5*animalsize(2)];
%             Screen('DrawTexture',CF.wid,CF.SmallDogTexture,[],rect1+[0 -0.1*CF.wRect(4) 0 -0.1*CF.wRect(4)]);
            Screen('DrawTexture',TD.wid,IMG(1).TDTexture);
            
            
         case 10
            message = 'You can use the LEFT and the DOWN key on the keyboard to pick one of the two pictures.\n\n\n\n\n\n\n\nYou can take a bit of time to think about the picture you want, so you dont have to rush.'; 
            DrawFormattedText(TD.wid,message,'center',TD.origin(2)-0.25*TD.wRect(4), [TD.textColor], wrapat, [], [], 1.5);
            
%             keysize = 150;
%             rect4 = [CF.origin(1)-0.5*keysize CF.origin(2)-0.5*keysize ...
%                 CF.origin(1)+0.5*keysize CF.origin(2)+0.5*keysize];
            Screen('DrawTexture', TD.wid, TD.KeysTexture);
%             Screen('DrawTexture',pms.wid,pms.keysTexture,[],rect4+[0 0.05*pms.wRect(4) 0 0.05*pms.wRect(4)]);
    
        case 11
            message = 'At the end of the game, we will pick one of the pictures that you chose. You will then get a many coins as were on that picture, and you will have to wait as many extra weeks for your present as there are moons.'; 
            DrawFormattedText(TD.wid,message,'center','center', [TD.textColor], wrapat, [], [], 1.5)

        case 12
            message = 'Great! Tell one of the researchers you''re ready to get started, and then we''ll begin!'; 
            DrawFormattedText(TD.wid,message,'center','center', [TD.textColor], wrapat, [], [], 1.5)
            

    end
end

if part == 2
    switch screen
        
        case 1
            message = 'Well done! Now let''s try something different. This time, you will see a scale, like below, along with two pictures like before. First, pick the picture that you like best';
            DrawFormattedText(TD.wid,message,'center',TD.origin(2)-0.35*TD.wRect(4), [TD.textColor], wrapat, [], [], 1.5);
            
            Screen('DrawTexture', TD.wid, IMG(1).TDTexture);
            
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
            slider = [TD.origin(1)-10 TD.origin(2)+310 TD.origin(1)+10 TD.origin(2)+340];
            Screen('FillRect', TD.wid, TD.sliderColor, slider, 2);


        case 2
            message = 'Next, you can move on the scale from the left to the right, to show how much you would want the picture you chose';
            DrawFormattedText(TD.wid,message,'center',TD.origin(2)-0.35*TD.wRect(4), [TD.textColor], wrapat, [], [], 1.5);
            
            Screen('DrawTexture', TD.wid, IMG(1).TDTexture);
            
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
            slider = [TD.origin(1)-10 TD.origin(2)+310 TD.origin(1)+10 TD.origin(2)+340];
            Screen('FillRect', TD.wid, TD.sliderColor, slider, 2);

            
        case 3
            message = 'If you move it all the way to the left, it means you really don''t want that picture.';
            DrawFormattedText(TD.wid,message,'center',TD.origin(2)-0.35*TD.wRect(4), [TD.textColor], wrapat, [], [], 1.5);
            
            Screen('DrawTexture', TD.wid, IMG(1).TDTexture);
            
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

            slider = [TD.origin(1)-510 TD.origin(2)+310 TD.origin(1)-490 TD.origin(2)+340];
            Screen('FillRect', TD.wid, TD.sliderColor, slider, 2);

            
        case 4
            message = 'and if you move it all the way to the right, it means you really want that picture.';
            DrawFormattedText(TD.wid,message,'center',TD.origin(2)-0.35*TD.wRect(4), [TD.textColor], wrapat, [], [], 1.5);
            
            Screen('DrawTexture', TD.wid, IMG(1).TDTexture);
            
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

            slider = [TD.origin(1)+490 TD.origin(2)+310 TD.origin(1)+510 TD.origin(2)+340];
            Screen('FillRect', TD.wid, TD.sliderColor, slider, 2);

            
        case 5
            message = 'let''s do that next!';
            DrawFormattedText(TD.wid,message,'center','center', [TD.textColor], wrapat, [], [], 1.5);

            
    end
end
        

if part == 3
    switch screen
        
        case 1
            message = 'All Finished!!\n\nPlease ask a researcher for the next game'; 
            DrawFormattedText(TD.wid,message,'center','center', [TD.textColor], wrapat, [], [], 3);
            
            starsize = 300;
            
            rect_1 = [TD.origin(1)-2.1*starsize TD.origin(2)-0.5*starsize ...
                TD.origin(1)-1.1*starsize TD.origin(2)+0.5*starsize];
            rect_2 = [TD.origin(1)+1.1*starsize TD.origin(2)-0.5*starsize ...
                TD.origin(1)+2.1*starsize TD.origin(2)+0.5*starsize];
            
            Screen('DrawTexture',TD.wid,TD.StarTexture,[],rect_1);
            Screen('DrawTexture',TD.wid,TD.StarTexture,[],rect_2);
            
    end
end

            
            