function s = Keygeneration(userkey)
    p32  = hex2dec('B7E15163');
    q32 = hex2dec('9E3779B9');
    r = 12;
    w = 32;
    b = length(userkey);
    mod = 2.^32;
    
    s = zeros(1,(2*r+4));
    
    initial_value = p32;
    s(1) = initial_value;
    
    for i = 2:(2*r+4)
        s(i)= rem((s(i-1)+q32),(mod));
    end
    
    encoded = encodetoblocks(userkey);
    enlength = length(encoded);
    
    L = zeros(1,enlength);
    
    for i = 1:4
        L (5-i) = bin2dec(encoded(i));
    end
    
    v = 3*max(enlength,(2*r+4));
    
    A = 0;
    B = 0;
    i=0;
    j=0;
    
    for index = 1: v
        
        s(i + 1) = rotate_left(rem((s(i + 1) + A + B),mod),3);
        A = s(i + 1);
        L(j + 1) = rotate_left(rem((L(j + 1) + A + B),mod),rem(A + B,32));
        B = L(j + 1);
        i = rem(i+1, 2*r + 4);
        j = rem(j+1, enlength);
                
    end
end