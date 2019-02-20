function DG_load_textures

global DG COIN BOX BOXCOIN INST

%% additional instructions
DG.instrucTextHeight = DG.origin(2)-0.36*DG.wRect(4);
DG.instrucTextHeightCen = DG.origin(2)-0.05*DG.wRect(4);
DG.youHeightINST = DG.origin(2)+0.17*DG.wRect(4);

DG.youXLeft = DG.origin(1)-0.13*DG.wRect(3);
DG.youXRight = DG.origin(1)+0.11*DG.wRect(3);
DG.youHeight = DG.origin(2)+0.1*DG.wRect(4);

DG.coinCountleft = DG.origin(1)-0.3*DG.wRect(3);
DG.coinCountright = DG.origin(1)+0.3*DG.wRect(3);
DG.coinCountheight = DG.origin(2)+0.3*DG.wRect(4);

%% images

DG.title = 'title.png';
[image,~,alpha] = imread(['images/',DG.title]);
image(:,:,4) = alpha(:,:);
DG.titleTexture = Screen('MakeTexture', DG.wid, image);

DG.coin = 'coin.png';
[image,~,alpha] = imread(['images/',DG.coin]);
image(:,:,4) = alpha(:,:);
DG.coinTexture = Screen('MakeTexture', DG.wid, image);

DG.box = 'box.png';
[image,~,alpha] = imread(['images/',DG.box]);
image(:,:,4) = alpha(:,:);
DG.boxTexture = Screen('MakeTexture', DG.wid, image);

DG.anon = 'anon.png';
[image,~,alpha] = imread(['images/',DG.anon]);
image(:,:,4) = alpha(:,:);
DG.anonTexture = Screen('MakeTexture', DG.wid, image);

DG.sky = 'background.jpg';
[image] = imread(['images/',DG.sky]);
DG.skyTexture = Screen('MakeTexture', DG.wid, image);

% profile of player



%% Setting the locations and rectangles for the coins and boxes
% Row 1 
COIN(1).coins = [DG.origin(1)+200 DG.origin(2)-225 DG.origin(1)+400 DG.origin(2)-25];
COIN(2).coins = [DG.origin(1)-100 DG.origin(2)-225 DG.origin(1)+100 DG.origin(2)-25];
COIN(3).coins = [DG.origin(1)-400 DG.origin(2)-225 DG.origin(1)-200 DG.origin(2)-25];

% Row 2
COIN(4).coins = [DG.origin(1)+200 DG.origin(2)-450 DG.origin(1)+400 DG.origin(2)-250];
COIN(5).coins = [DG.origin(1)-100 DG.origin(2)-450 DG.origin(1)+100 DG.origin(2)-250];
COIN(6).coins = [DG.origin(1)-400 DG.origin(2)-450 DG.origin(1)-200 DG.origin(2)-250];

BOX(1).box = [DG.origin(1)-350 DG.origin(2)+150 DG.origin(1)-100 DG.origin(2)+400];
BOX(2).box = [DG.origin(1)+100 DG.origin(2)+150 DG.origin(1)+350 DG.origin(2)+400];

BOX(1).anon = [DG.origin(1)-275 DG.origin(2)+50 DG.origin(1)-175 DG.origin(2)+150];
BOX(2).anon = [DG.origin(1)+175 DG.origin(2)+50 DG.origin(1)+275 DG.origin(2)+150];

BOXCOIN(1).coin = [DG.origin(1)-250 DG.origin(2)+250 DG.origin(1)-150 DG.origin(2)+350];
BOXCOIN(2).coin = [DG.origin(1)+150 DG.origin(2)+250 DG.origin(1)+250 DG.origin(2)+350];

%% create coin textures and box textures for instructions

% for x = 1:length(COIN)
%     for z = 1:4
%         if COIN(x).coins(z) < 1 && z == 1
%             INST(x).coins(z) = COIN(x).coins(z) + 50;
%         elseif COIN(x).coins(1) > 1 && z == 1
%             INST(x).coins(z) = COIN(x).coins(z) - 50;
%         elseif z == 2
%             INST(x).coins(z) = COIN(x).coins(z) + 50;
%         elseif COIN(x).coins(z) > 1 && z == 3
%             INST(x).coins(z) = COIN(x).coins(z) - 50;
%         elseif COIN(x).coins(z) < 1 && z == 3
%             INST(x).coins(z) = COIN(x).coins(z) + 50;
%         elseif z == 4
%             INST(x).coins(z) = COIN(x).coins(z) + 50;
%         end
%     end
% end
            
%         elseif COIN(x).coins(z) < 1 && z == 2 || z == 4
%             INST(x).coins(z) = COIN(x).coins(z) - 160;
%         elseif COIN(x).coins(z) < 1 && z == 3 || z == 1
%             INST(x).coins(z) = COIN(x).coins(z) + 20; %+ 50;
%         elseif COIN(x).coins(z) > 1 && z == 3 || z == 1
%             INST(x).coins(z) = COIN(x).coins(z) - 20; %- 50;
% %         elseif z ~= 2 && z~= 4 % COIN(x).coins(z) < 1 &&
% %             INST(x).coins(z) = COIN(x).coins(z);
%         end
%     end
% end

for x = 1:length(BOX)
    for z = 1:4
        if BOX(x).box(z) > 1 && z == 2
            BOX(x).boxINST(z) = BOX(x).box(z) + 80;
            BOX(x).anonINST(z) = BOX(x).anon(z) + 60;
        elseif BOX(x).box(z) > 1 && z == 4
            BOX(x).boxINST(z) = BOX(x).box(z) + 60;
            BOX(x).anonINST(z) = BOX(x).anon(z) + 70;
%         elseif BOX(x).box(z) < 1 && z == 2 || z == 4
%             BOX(x).boxINST(z) = BOX(x).box(z) - 40;
%             BOX(x).anonINST(z) = BOX(x).anon(z) - 60;
        elseif BOX(x).box(z) < 1 && z == 3 || z == 1
            BOX(x).boxINST(z) = BOX(x).box(z) + 40; %+ 50;
            BOX(x).anonINST(z) = BOX(x).anon(z);
        elseif COIN(x).coins(z) > 1 && z == 3 || z == 1
            BOX(x).boxINST(z) = BOX(x).box(z) - 40; %- 50;
            BOX(x).anonINST(z) = BOX(x).anon(z);
        end
    end
end

for x = 1:length(COIN)
    for z = 1:4
        if COIN(x).coins(z) > 1 && z == 2 || z == 4
            INST(x).coins(z) = COIN(x).coins(z) + 160;
        elseif COIN(x).coins(z) < 1 && z == 2 || z == 4
            INST(x).coins(z) = COIN(x).coins(z) - 160;
        elseif COIN(x).coins(z) < 1 && z == 3 || z == 1
            INST(x).coins(z) = COIN(x).coins(z) + 20; %+ 50;
        elseif COIN(x).coins(z) > 1 && z == 3 || z == 1
            INST(x).coins(z) = COIN(x).coins(z) - 20; %- 50;
%         elseif z ~= 2 && z~= 4 % COIN(x).coins(z) < 1 &&
%             INST(x).coins(z) = COIN(x).coins(z);
        end
    end
end

%         elseif RECS(x).rectangles(z) < 1 && z ~= 2 && z~= 4
%             INSTRUCT(x).rectangles(z) = RECS(x).rectangles(z);
%             INSTRUCT(x).animals(z) = RECS(x).animals(z);
%         elseif RECS(x).rectangles(z) > 1 && z ~= 2 && z~= 4
%             INSTRUCT(x).rectangles(z) = RECS(x).rectangles(z);
%             INSTRUCT(x).animals(z) = RECS(x).animals(z);
%         end
%     
%     
   