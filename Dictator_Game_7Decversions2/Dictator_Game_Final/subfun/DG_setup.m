function DG_setup

global DG

%% colours
DG.mon = 0;
DG.backgroundColor = [0 0 0];
DG.textSize = 40; % text size for message
DG.textColor = [255 255 240]; % text size for message
DG.unselRecColour = [255 255 255];
DG.selRecColour = [247 153 12];
DG.unselRecSize = 3;
DG.selRecSize = 8;
DG.redColour = [255,0,0]; 

%% anon box 
if randsample([1 0],1)
    DG.box1 = 1;
    DG.box2 = 0;
else
    DG.box1 = 0;
    DG.box2 = 1;
end

%% Instructions
DG.instrucSelColour = [0 0 0]; %[1 1 1];
% DG.instrucTextHeight = DG.origin(2)-0.36*DG.wRect(4);
% DG.instrucTextHeightCen = DG.origin(2)-0.05*DG.wRect(4);
DG.instructRecSize = 10;
DG.scalingfactor = 40;

%% keys

DG.screenKey = 'space';
DG.exitKey = 'ESCAPE';
DG.leftKey = 'LeftArrow';
DG.rightKey = 'DownArrow';

DG.ESC = 0;

