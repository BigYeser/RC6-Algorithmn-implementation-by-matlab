% encrypt

key1 = input('Enter the key(16digits) to encrypt : ','s');
sentence = input('Enter the sentence(16digits) : ','s');
encrypted_sentence = runencrypt(sentence , key1);
disp(['encrypted sentence is : ' encrypted_sentence]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%

% deccrypt
key2 = input('Enter the key(16digits) to decrypt : ','s');
decrypted_sentence = rundecrypt(encrypted_sentence, key2);
disp(['decrypted sentence is : ' decrypted_sentence]);
