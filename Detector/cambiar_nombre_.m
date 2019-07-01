% renombrar ficheros con matlab y copiarlos en otro lugar 
direccion = 'D:\10\Carpeta_Entrenamiento_Dtectores\C_no_orejas';% donde estan los ficheros con nombre viejo
home =cd;
cd(direccion);
A=dir('*.jpg');
cant = size(A);
cant = cant(1);
outputFolder = 'D:\10\Carpeta_Entrenamiento_Dtectores\C_no_orejas';% donde quiero que esten con nombre nuevo
inputFiles = dir( fullfile('*.jpg') );
fileNames = { inputFiles.name };
for k = 1 : length(inputFiles )
    %kk = k+903;
    thisFileName = fileNames{k};
    inputFullFileName = fullfile(pwd, thisFileName)
    outputBaseFileName = sprintf('%s_.jpg', num2str(k));
    outputFullFileName = fullfile(outputFolder, outputBaseFileName)
    copyfile(inputFullFileName, outputFullFileName);
end
cd(home); 