function TD_textures

global TD ROOT_DIR IMG

cd(ROOT_DIR);
path(path,'img'); % allow access to all subfunctions

%% Stimuli

Tex_stimuli = {'E1.png'; 'E2.png'; 'E3.png'; 'E4.png';
    'E5.png'; 'E6.png'; 'E7.png'; 'E8.png'; 'E9.png';
    'E10.png'; 'E11.png'; 'E12.png'; 'E13.png'; 'E14.png';
    'E15.png'; 'E16.png'; 'E17.png'; 'E18.png'};

for i = 1:length(Tex_stimuli)
    IMG(i).Tex = Tex_stimuli{i};
    [image,~,alpha] = imread(['img/',IMG(i).Tex]);
    image(:,:,4) = alpha(:,:);
    IMG(i).TDTexture = Screen('MakeTexture', TD.wid, image);
end

% Att_stimuli = {'A1.png'; 'A2.png'; 'A3.png'; 'A4.png'; 'A5.png';
%     'A6.png'};

Att_stimuli = {'E18.png'; 'E10.png'; 'E6.png'; 'E2.png';
    'E12.png'; 'E7.png'};

for i = 1:length(Att_stimuli)
    IMG(i).Att = Att_stimuli{i};
    [image,~,alpha] = imread(['img/',IMG(i).Att]);
    image(:,:,4) = alpha(:,:);
    IMG(i).AttTexture = Screen('MakeTexture', TD.wid, image);
end

TD.box = 'box.png';
[image,~,alpha] = imread(['img/',TD.box]);
image(:,:,4) = alpha(:,:); % transparency?
TD.boxTexture = Screen('MakeTexture', TD.wid, image);


%% Instructions

TD.Instruction1 = 'Instr1.png';
[image,~,alpha] = imread(['img/',TD.Instruction1]);
image(:,:,4) = alpha(:,:); % transparency?
TD.Instruction1Texture = Screen('MakeTexture', TD.wid, image);


TD.Instruction2 = 'Instr2.png';
[image,~,alpha] = imread(['img/',TD.Instruction2]);
image(:,:,4) = alpha(:,:); % transparency?
TD.Instruction2Texture = Screen('MakeTexture', TD.wid, image);

% TD.Instruction1 = 'Instr1.png';
% [image,~,alpha] = imread(['img/',TD.Instruction1]);
% image(:,:,4) = alpha(:,:); % transparency?
% TD.Instruction1Texture = Screen('MakeTexture', TD.wid, image);
% 
% 
% TD.Instruction2 = 'Instr2.png';
% [image,~,alpha] = imread(['img/',TD.Instruction2]);
% image(:,:,4) = alpha(:,:); % transparency?
% TD.Instruction2Texture = Screen('MakeTexture', TD.wid, image);


%% Examples

TD.moon = 'moon.png';
[image,~,alpha] = imread(['img/',TD.moon]);
image(:,:,4) = alpha(:,:); % transparency?
TD.moonTexture = Screen('MakeTexture', TD.wid, image);

TD.moons = 'moons.png';
[image,~,alpha] = imread(['img/',TD.moons]);
image(:,:,4) = alpha(:,:); % transparency?
TD.moonsTexture = Screen('MakeTexture', TD.wid, image);

TD.coin = 'coin.png';
[image,~,alpha] = imread(['img/',TD.coin]);
image(:,:,4) = alpha(:,:); % transparency?
TD.coinTexture = Screen('MakeTexture', TD.wid, image);

TD.coins = 'coins.png';
[image,~,alpha] = imread(['img/',TD.coins]);
image(:,:,4) = alpha(:,:); % transparency?
TD.coinsTexture = Screen('MakeTexture', TD.wid, image);

TD.KeysTexture = 'keys.png';
[image,~,alpha] = imread(['img/',TD.KeysTexture]);
image(:,:,4) = alpha(:,:); % transparency?
TD.KeysTexture = Screen('MakeTexture', TD.wid, image);

% Star texture

TD.StarTexture = 'star.png';
[image,~,alpha] = imread(['img/',TD.StarTexture]);
image(:,:,4) = alpha(:,:); % transparency?
TD.StarTexture = Screen('MakeTexture', TD.wid, image);

% Cool text for title slide

TD.Title = 'Title.png';
[image,~,alpha] = imread(['img/',TD.Title]);
image(:,:,4) = alpha(:,:); % transparency?
TD.TitleTexture = Screen('MakeTexture', TD.wid, image);


% Feedback textures

TD.check = 'check.png';
[image,~,alpha] = imread(['img/',TD.check]);
image(:,:,4) = alpha(:,:); % transparency?
TD.checkTexture = Screen('MakeTexture', TD.wid, image);

TD.cross = 'cross.png';
[image,~,alpha] = imread(['img/',TD.cross]);
image(:,:,4) = alpha(:,:); % transparency?
TD.crossTexture = Screen('MakeTexture', TD.wid, image);

% axis for slider

% TD.axis = 'x_axis.png';
% [image,~,alpha] = imread(['img/',TD.axis]);
% image(:,:,4) = alpha(:,:); % transparency?
% TD.x_axis = Screen('MakeTexture', TD.wid, image);

TD.axis1 = 'axis1.png';
[image,~,alpha] = imread(['img/',TD.axis1]);
image(:,:,4) = alpha(:,:); % transparency?
TD.x_axis1 = Screen('MakeTexture', TD.wid, image);

TD.axis2 = 'axis2.png';
[image,~,alpha] = imread(['img/',TD.axis2]);
image(:,:,4) = alpha(:,:); % transparency?
TD.x_axis2 = Screen('MakeTexture', TD.wid, image);

TD.axis0 = 'axis0.png';
[image,~,alpha] = imread(['img/',TD.axis0]);
image(:,:,4) = alpha(:,:); % transparency?
TD.x_axis0 = Screen('MakeTexture', TD.wid, image);

%% Thumbs up and down (for axis)

TD.thumbdown = 'thumbdown.png';
[image,~,alpha] = imread(['img/',TD.thumbdown]);
image(:,:,4) = alpha(:,:); % transparency?
TD.thumbdownT = Screen('MakeTexture', TD.wid, image);

TD.thumbup = 'thumbup.png';
[image,~,alpha] = imread(['img/',TD.thumbup]);
image(:,:,4) = alpha(:,:); % transparency?
TD.thumbupT = Screen('MakeTexture', TD.wid, image);


%% Define rect
% animalsize = 200; % show ANIMALS for fun
% rect_1 = [CF.origin(1)-1.25*animalsize CF.origin(2)-0.5*animalsize ...
%     CF.origin(1)-0.25*animalsize CF.origin(2)+0.5*animalsize];
% rect_2 = [CF.origin(1)+0.25*animalsize CF.origin(2)-0.5*animalsize ...
%     CF.origin(1)+1.25*animalsize CF.origin(2)+0.5*animalsize];

end

