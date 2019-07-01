function [PA_D,PA_I] = eeg_G_PA_points(head_surface,anguloP)
clc;close all;
set(0,'units','pixels');
vistas_derecha   = []; vistas_izquierda = []; biggerbox = [];
detector_I    = vision.CascadeObjectDetector('trained_model_for_L_ear_detector_30.xml');% This is the detector, Obviously, need to be trained previosly ...!!!
detector_D    = vision.CascadeObjectDetector('trained_model_for_R_ear_detector_35.xml');

% detector_I    = vision.CascadeObjectDetector('training_model_detector_I_HOG_2300pos_1323neg_35x0.85.xml');
% detector_D    = vision.CascadeObjectDetector('training_model_detector_D_HOG_2308pos_1323neg_21x0.8.xml');

shapeInserter = vision.ShapeInserter('BorderColor','Custom','CustomBorderColor',[0 255 0]); 
%%
%% Seeking the right ear...!!!
%figure('WindowState', 'fullscreen', 'MenuBar', 'none', 'ToolBar', 'none'); 

x = ft_plot_mesh(head_surface);
view(180,90);
rotate(x,[0 1 0],anguloP-87);%Rotation for right ear (-87) 
%set(gcf,'units','normalized','outerposition',[0 0 1 1]);
saveas(gcf,'D.jpg');% It works...!!!
D = imread('D.jpg');
% D = getframe; % It doesn't (The Detector works better when reading a file than when getting the actual frame)
% D = D.cdata;
bbox = step(detector_D,D);
[a b] = size(bbox);
if isempty(bbox)% Error msg ...!!!
    error('The model information does not allow to detect the right ear');
elseif (a>1)    % Error msg ...!!!
    error('The false positive rate of the right ear detector is hight, please improve it');
    box_insert = int32(bbox)';% Insert the box in the view (just to visually check) ...!!!***************************OR NOT, THIS IS JUST FOR CHECKING...!!!
    for i=1:a
        fotoconoreja = step(shapeInserter, D, box_insert(:,i));
    end
    close all;
    figure('units','normalized','outerposition',[0 0 1 1]);%Maximize...!!!
    imshow(fotoconoreja); 
elseif (a==1)% Just found one ear...OK!
    PA_D = [(bbox(1,1)+bbox(1,3)),(bbox(1,2)+bbox(1,4)/2) , anguloP-87];
end
%%
%% Seeking the left ear...!!!
close all;
%figure('WindowState', 'fullscreen', 'MenuBar', 'none', 'ToolBar', 'none'); 

x = ft_plot_mesh(head_surface);
view(180,90);
rotate(x,[0 1 0],anguloP+87);%Rotation for left ear (+87) 
%set(gcf,'units','normalized','outerposition',[0 0 1 1])   
saveas(gcf,'I.jpg');% It works...!!!
I = imread('I.jpg');
% I = getframe;
% I = I.cdata;
bbox = step(detector_I,I);
[a b] = size(bbox);
if isempty(bbox)% Error msg ...!!!
    error('The model information does not allow to detect the left ear');
elseif (a>1)% Error msg...!!!
     error('The false positive rate of the right ear detector is hight, please improve it');
     box_insert = int32(bbox)';
     for i=1:a
         fotoconoreja = step(shapeInserter, I, box_insert(:,i));
     end
     close all;
     set(gcf,'units','normalized','outerposition',[0 0 1 1])   
     imshow(fotoconoreja); 
elseif (a==1)
    PA_I = [floor(bbox(1,1)),floor(bbox(1,2)+bbox(1,4)/2) , anguloP+87];
end 

