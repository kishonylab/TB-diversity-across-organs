function gb = locustag_from_text(old_gb)

gb = old_gb ;

for i=1:length(gb)
    celloftext=cellstr(gb(i).text);
    locustag_line=find(strncmp('/locus_tag',celloftext,10),1);
    locustag=gb(i).text(locustag_line,:);
    indices=strfind(locustag,'"');
    if length(indices)>=2
        gb(i).locustag=locustag(indices(1)+1:indices(2)-1);
    else
        disp('Did not properply process the following entry:')
        disp(gb(i).text);
        gb(i).locustag='0';
    end
end

return