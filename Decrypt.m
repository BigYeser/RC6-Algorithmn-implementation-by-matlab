function [f_ori,f_cip] = Decrypt(encrypted_sentence,s)
    encoded = encodetoblocks(encrypted_sentence);
    w = 32;
    A = bin2dec(encoded(1));
    B = bin2dec(encoded(2));
    C = bin2dec(encoded(3));
    D = bin2dec(encoded(4));
    
    cipher = zeros(1,4);
    cipher(1) = A;
    cipher(2) = B;
    cipher(3) = C;
    cipher(4) = D;
    
    r = 12;
    mod = 2.^w;
    lgw = log2(w);
   
    C = rem((C - s(2*r+4)) +mod ,mod);  % s(2*r+3)
    A = rem((A - s(2*r+3))  + mod,mod);   % s(2*r+2)
    
    for j= 1:r
        i = (r+1)-j;
        L = double([D,A,B,C]);
        A = L(1);
        B = vpa(L(2),70);
        C = L(3);
        D = vpa(L(4),70);
        
        u_temp = double(rem((D*(2*D+1)),mod));
        u = rotate_left(u_temp,lgw);
        t_temp = double(rem((B*(2*B+1)),mod));
        t = rotate_left(t_temp,lgw);
        
        tmod = rem(t,32);    
        umod = rem(u,32);   
       
        C = bitxor((rotate_right(rem((C-s(2*i+2)+mod),mod),tmod)),u);  %s(2*i+1)
        A = bitxor(rotate_right(rem((A-s(2*i+1)+mod) ,mod),umod),t);     %s(2*i)
        
    end
    
    D = double(rem((D - s(2))+mod,mod));
    B = double(rem((B - s(1))+mod,mod));
    
    orgi = zeros(1,4);
    orgi(1) = A;
    orgi(2) = B;
    orgi(3) = C;
    orgi(4) = D;

    f_ori = orgi;
    f_cip = cipher;
    
end