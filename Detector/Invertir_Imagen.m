%% Invertir imagnes
cd('E:\10\Carpeta_Entrenamiento_Dtectores\A_Orejas_D');
A=dir('*.jpg');
cant = size(A);
cant = cant(1);
inputFiles = dir( fullfile('*.jpg') );
fileNames = { inputFiles.name };

for i=1:cant
    este_nombre = fileNames{i};
    A = imread(este_nombre);
    [a b c] = size(A);
    B=[];
    for j = b:-1:1 
        B = [B, A(:,j,:)];
    end
    
    filename = [num2str(i),'_inv.jpg'];
    cd('E:\10\Carpeta_Entrenamiento_Dtectores\A_Orejas_D\D_Invertidas')
    imwrite(B, filename);
    cd('E:\10\Carpeta_Entrenamiento_Dtectores\A_Orejas_D'); 
    
end