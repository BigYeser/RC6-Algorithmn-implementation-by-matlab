function [encrypted_sentence] = runencrypt(sentence , key)
    if(length(key)<16)
        key = zerofill(key);
    end
    keyforinput = key(1:16);
    keygen = Keygeneration(keyforinput);
    
     if(length(sentence)<16)
         sentence = zerofill(sentence);
     end
    
    senforinput = sentence(1:16);
    
    [orgi,cipher] = Encrypt(senforinput,keygen);
    data=dec2bin(cipher,32);
    cell_cipher =cell(1,4);
    cell_cipher{1}=data(1,:);
    cell_cipher{2}=data(2,:);
    cell_cipher{3}=data(3,:);
    cell_cipher{4}=data(4,:);
   
   % cell_cipher = num2cell(cipher);
    encrypted_sentence = Deblocker(cell_cipher);
    
        
end