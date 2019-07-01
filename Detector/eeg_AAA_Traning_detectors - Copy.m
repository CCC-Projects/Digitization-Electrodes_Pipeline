% Script for training the any detector ...!!!!
% You only need to change the path of the postives and negatives samples, and
% use the corresponding GROUNDTRUTH variable from the ImageLabeler app in
% the Computer Vision Toolbox
clc
positiveInstances = gTruth(:,1:1).DataSource.Source;% gTruth is the GROUNDTRUTH variable
positiveInstances = cell2table(positiveInstances);
positiveInstances = [positiveInstances,gTruth.LabelData(:,1)];

positive_directory1 = fullfile('E:\10\Carpeta_Entrenamiento_Dtectores\B_Orejas_I');% Path for positives samples used to generate the GROUNDTRUTH variable with ImageLabeler
positive_directory2 = fullfile('E:\10\Carpeta_Entrenamiento_Dtectores\A_Orejas_D\D_Invertidas');

addpath(positive_directory1);
addpath(positive_directory2);

neg_dir = fullfile('E:\10\Carpeta_Entrenamiento_Dtectores\C_no_orejas');% Path for negatives samples 
tic 
trainCascadeObjectDetector('training_model_detector_I_HOG_2300pos_1323neg_Xx0.4.xml',positiveInstances,neg_dir,'FalseAlarmRate',0.4,...
    'NumCascadeStages', 1000,'FeatureType','HOG');
toc