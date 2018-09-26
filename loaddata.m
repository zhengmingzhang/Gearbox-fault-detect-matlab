function  [data,label] = loaddata( data_name )
data=[];
label=[];
for i =1:length(data_name)
    data_i=load(strcat('./Data/',data_name{i}));
    data=[data,cell2mat(data_i.(data_name{i}))];
    if isempty(findstr(data_name{i},'health'))==0
       j =size(data_i.(data_name{i}),2);
       label=[label,ones(1,j)];
    elseif  isempty(findstr(data_name{i},'pinionbroken'))==0
        j =size(data_i.(data_name{i}),2);
        label=[label,ones(1,j)*2];
    elseif isempty(findstr(data_name{i},'spbroken'))==0
        j =size(data_i.(data_name{i}),2);
        label=[label,ones(1,j)*3];
    else isempty(findstr(data_name{i},'sppbroken'))==0
        j =size(data_i.(data_name{i}),2);
        label=[label,ones(1,j)*4]; 
    end

end
label=label';
end

