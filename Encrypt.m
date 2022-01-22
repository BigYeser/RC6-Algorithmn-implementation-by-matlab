function [f_ori,f_cip] = Encrypt(sentence,s)
    encoded1 = encodetoblocks(sentence);
    w = 32;
    A = bin2dec(encoded1(1));
    B = bin2dec(encoded1(2));
    C = bin2dec(encoded1(3));
    D = bin2dec(encoded1(4));
    
    orgi = zeros(1,4);
    orgi(1) = A;
    orgi(2) = B;
    orgi(3) = C;
    orgi(4) = D;
    
    r = 12;
    mod = 2.^w;
    lgw = 5;
    B = vpa(rem((B + s(1)),mod),70);
    D = vpa(rem((D + s(2)),mod),70);
    
    
    
    for i = 1:r  % 1:r
        B = vpa(B,70);
        D = vpa(D,70);
        t_temp = double(rem(B*(2*B + 1),mod)); 
        u_temp = double(rem(D*(2*D + 1),mod)); 

%         a = t_temp  - 4284339902;
%         b = u_temp - 2822704491;
        t = rotate_left(t_temp,lgw);
        u = rotate_left(u_temp,lgw);
        tmod = rem(t,32);   %32
        umod = rem(u,32); %32
       
%         ss1 = s(2*i + 1);
%         ss2 = s(2*i + 2);
        A = rem((rotate_left(bitxor(A,t),umod) + s(2*i + 1)),mod); % s(2*i )
        C = rem((rotate_left(bitxor(C,u),tmod) + s(2*i + 2)),mod); % s(2*i +1) 
      
        L = double([B,C,D,A]);
        A = L(1);
        B = L(2);
        C = L(3);
        D = L(4);
    end
     
    A = rem((A + s(2*r + 3)),mod);    % s(2*r + 2)
    C = rem((C + s(2*r + 4)),mod);    % s(2*r + 3)
    
    cipher = zeros(1,4);
    cipher(1) = A;
    cipher(2) = B;
    cipher(3) = C;
    cipher(4) = D;

    f_ori = orgi;
    f_cip = cipher;
    
   
    
end




