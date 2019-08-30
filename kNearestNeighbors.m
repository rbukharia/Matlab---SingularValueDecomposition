function [label,D] = kNearestNeighbors(dataMatrix, queryMatrix, class, k, GuiHandle)

handles=guidata(GuiHandle);

numQueryVectors = size(queryMatrix,1);
dataMatrix=transpose(dataMatrix(:));
pilihan_jarak = get(handles.popupmenu2,'Value');
switch pilihan_jarak
    case 1
        for i=1:numQueryVectors
            Mdl = fitcknn(queryMatrix,class,'NumNeighbors',k,'NSMethod','exhaustive','Distance','euclidean','Standardize',1);
           [Idx,D] = knnsearch(queryMatrix,dataMatrix,'K',k,'NSMethod','exhaustive','Distance','euclidean');
        end
    case 2
        for i=1:numQueryVectors
            Mdl = fitcknn(queryMatrix,class,'NumNeighbors',k,'NSMethod','exhaustive','Distance','cityblock','Standardize',1);
           [Idx,D] = knnsearch(queryMatrix,dataMatrix,'K',k,'NSMethod','exhaustive','Distance','cityblock');
        end
    case 3
        for i=1:numQueryVectors
            Mdl = fitcknn(queryMatrix,class,'NumNeighbors',k,'NSMethod','exhaustive','Distance','cosine','Standardize',1);
           [Idx,D] = knnsearch(queryMatrix,dataMatrix,'K',k,'NSMethod','exhaustive','Distance','cosine');
        end
    case 4
        for i=1:numQueryVectors
            Mdl = fitcknn(queryMatrix,class,'NumNeighbors',k,'NSMethod','exhaustive','Distance','correlation','Standardize',1);
           [Idx,D] = knnsearch(queryMatrix,dataMatrix,'K',k,'NSMethod','exhaustive','Distance','correlation');
        end
end
label = predict(Mdl,dataMatrix);
out = queryMatrix(min(Idx),:);
out = reshape(out,1024,1024);
imshow(out,'Parent',handles.axes33);
%save('out.mat','out');
  end