function [decrypted_sentence cipher_sentence] = rundecrypt(encrypted_sentence,key)
    if(length(key)<16)
        key = zerofill(key);
    end
    keyforinput = key(1:16);
    keygen = Keygeneration(keyforinput);
    
    [orgi,cipher] = Decrypt(encrypted_sentence,keygen);
    data=dec2bin(orgi,32);
    cell_orgi =cell(1,4);
    cell_orgi{1}=data(1,:);
    cell_orgi{2}=data(2,:);
    cell_orgi{3}=data(3,:);
    cell_orgi{4}=data(4,:);
    decrypted_sentence =  Deblocker(cell_orgi);
    
end