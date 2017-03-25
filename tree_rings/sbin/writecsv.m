function [  ] = writecsv( filename, table )

fd = fopen(filename, 'w');
for i = 1:size(table,1)
    for j = 1:size(table,2)-1
        if isempty(table{i,j})
            fprintf(fd, ',');
        else
            fprintf(fd, '%s,', table{i,j});
        end
    end
    fprintf(fd, '%s\n', table{i,end});
end
fclose(fd);

end

