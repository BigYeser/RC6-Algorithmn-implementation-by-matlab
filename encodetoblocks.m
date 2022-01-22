function encoded_vect = encodetoblocks(stri)
  
    if(length(stri)<16)
        stri = zerofill(stri);
    end
    encoded_val = '';
    
    for i = 1:16
         encoded_val = strcat(encoded_val,dec2bin(stri(i),8));
    end
    
    encoded_vect = cell(1,4);
    encoded_vect(1) = {encoded_val(1:32)};
    encoded_vect(2) = {encoded_val(33:64)};
    encoded_vect(3) = {encoded_val(65:96)};
    encoded_vect(4) = {encoded_val(97:128)};

end