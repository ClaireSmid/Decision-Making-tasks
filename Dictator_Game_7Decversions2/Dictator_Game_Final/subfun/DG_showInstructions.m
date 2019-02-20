function DG_showInstructions(part)

global DG
% global data

nrscreens = [20 1]; % for drawInstructions

screen = 1;
while screen <= nrscreens(part)
    DG_drawInstructions(part,screen);
    Screen('Flip',DG.wid);
    WaitSecs(0.5);
    pressed = 0;
    if DG.ESC == 0
    while ~pressed
        [keyIsDown, ~, keyCode] = KbCheck;
        if keyIsDown
            keyStrokes = KbName(keyCode);
            if any(strcmpi(keyStrokes,DG.screenKey)) || any(strcmpi(keyStrokes,DG.rightKey))  %|| any(strcmpi(keyStrokes,OM.leftKey)) || any(strcmpi(keyStrokes,OM.rightKey))
                pressed = 1;
                screen = screen + 1;
            elseif any(strcmpi(keyStrokes,DG.leftKey))
                pressed = 1;
                screen = screen - 1;
                if screen < 1
                    screen = 1;
                end
            elseif any(strcmpi(keyStrokes,DG.exitKey)) % added in for kill code
                DG.ESC = 1;
                break;
            end
        end
    end
    else
        break;
    end
end

end

