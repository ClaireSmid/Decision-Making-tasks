function TD_showInstructions(part)

global TD ESC
% global data

nrscreens = [12 5 1]; % for drawInstructions

screen = 1;
while screen <= nrscreens(part)
    TD_drawInstructions(part,screen);
    Screen('Flip',TD.wid);
    WaitSecs(0.5);
    pressed = 0;
    if ESC == 0
    while ~pressed
        [keyIsDown, ~, keyCode] = KbCheck;
        if keyIsDown
            keyStrokes = KbName(keyCode);
            if any(strcmpi(keyStrokes,TD.screenKey)) || any(strcmpi(keyStrokes,TD.leftKey)) || any(strcmpi(keyStrokes,TD.rightKey))
                pressed = 1;
                screen = screen + 1;
            elseif any(strcmpi(keyStrokes,TD.exitKey)) % added in for kill code
                ESC = 1;
                break;
            end
        end
    end
    else
        break;
    end
end

end

