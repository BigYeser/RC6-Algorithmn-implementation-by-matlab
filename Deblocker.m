function sr = Deblocker(blocks)
    s= '';
    len = length(blocks);
    value ='';
    
    for i=1:len
        value = strcat(value,blocks{i});
    end
    a = reshape(value,8,[])';
    sr = char(bin2dec(a)');
    
end
    
            
            
            
            
        
        
        