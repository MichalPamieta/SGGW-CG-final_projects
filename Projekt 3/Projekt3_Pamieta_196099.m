%% CZĘŚĆ I

% obrazek A
ImA = imread('a.bmp');
figure(1); imshow(ImA);
title('Oryginalny obrazek A (bez szumu)');

ImAsz = imread('a_sz.bmp');
figure(2); imshow(ImAsz);
title('Oryginalny obrazek B (z szumem)');

% WERSJA A - filtr uśredniający

ImA = uint8(ImA);
ImA1Avg = PassLowAvg(ImAsz,3);
figure(3); imshow(ImA1Avg);
title('Obrazek A po filtrze uśredniającym o macierzy 3x3');
ImA2Avg = PassLowAvg(ImAsz,5);
figure(4); imshow(ImA2Avg);
title('Obrazek A po filtrze uśredniającym o macierzy 5x5');

% własna implementacja obliczania mse
ImA = double(ImA);
ImA1Avg = double(ImA1Avg);
ImA2Avg = double(ImA2Avg);
mseA1Avg = 0;
mseA2Avg = 0;
[m1, n1] = size(ImA);
for i = 1:m1
    for j = 1:n1
        mseA1Avg = mseA1Avg + (ImA(i,j)-ImA1Avg(i,j))^2;
        mseA2Avg = mseA2Avg + (ImA(i,j)-ImA2Avg(i,j))^2;
    end
end

mseA1Avg = mseA1Avg/(m1*n1);
mseA2Avg = mseA2Avg/(m1*n1);

% WERSJA B - filtr medianowy

ImA = uint8(ImA);
ImA1Mdn = PassLowMdn(ImAsz,3);
figure(5); imshow(ImA1Mdn);
title('Obrazek A po filtrze medianowym o macierzy 3x3');
ImA2Mdn = PassLowMdn(ImAsz,5);
figure(6); imshow(ImA2Mdn);
title('Obrazek A po filtrze medianowym o macierzy 5x5');

% własna implementacja obliczania mse
ImA = double(ImA);
ImA1Mdn = double(ImA1Mdn);
ImA2Mdn = double(ImA2Mdn);
mseA1Mdn = 0;
mseA2Mdn = 0;
[m1, n1] = size(ImA);
for i = 1:m1
    for j = 1:n1
        mseA1Mdn = mseA1Mdn + (ImA(i,j)-ImA1Mdn(i,j))^2;
        mseA2Mdn = mseA2Mdn + (ImA(i,j)-ImA2Mdn(i,j))^2;
    end
end

mseA1Mdn = mseA1Mdn/(m1*n1);
mseA2Mdn = mseA2Mdn/(m1*n1);

% WERSJA C - filtr Gaussa

ImA = uint8(ImA);
ImA1Gauss = PassLowGauss(ImAsz,3,0.9);
figure(7); imshow(ImA1Gauss);
title(["Obrazek A po filtrze Gaussa","o macierzy 3x3 i ro równym 0.9"]);
ImA2Gauss = PassLowGauss(ImAsz,3,1.8);
figure(8); imshow(ImA2Gauss);
title(["Obrazek A po filtrze Gaussa","o macierzy 3x3 i ro równym 1.8"]);
ImA3Gauss = PassLowGauss(ImAsz,5,0.9);
figure(9); imshow(ImA3Gauss);
title(["Obrazek A po filtrze Gaussa","o macierzy 5x5 i ro równym 0.9"]);
ImA4Gauss = PassLowGauss(ImAsz,5,1.8);
figure(10); imshow(ImA4Gauss);
title(["Obrazek A po filtrze Gaussa","o macierzy 5x5 i ro równym 1.8"]);

% własna implementacja obliczania mse
ImA = double(ImA);
ImA1Gauss = double(ImA1Gauss);
ImA2Gauss = double(ImA2Gauss);
ImA3Gauss = double(ImA3Gauss);
ImA4Gauss = double(ImA4Gauss);
mseA1Gauss = 0;
mseA2Gauss = 0;
mseA3Gauss = 0;
mseA4Gauss = 0;
[m1, n1] = size(ImA);
for i = 1:m1
    for j = 1:n1
        mseA1Gauss = mseA1Gauss + (ImA(i,j)-ImA1Gauss(i,j))^2;
        mseA2Gauss = mseA2Gauss + (ImA(i,j)-ImA2Gauss(i,j))^2;
        mseA3Gauss = mseA3Gauss + (ImA(i,j)-ImA3Gauss(i,j))^2;
        mseA4Gauss = mseA4Gauss + (ImA(i,j)-ImA4Gauss(i,j))^2;
    end
end

mseA1Gauss = mseA1Gauss/(m1*n1);
mseA2Gauss = mseA2Gauss/(m1*n1);
mseA3Gauss = mseA3Gauss/(m1*n1);
mseA4Gauss = mseA4Gauss/(m1*n1);

% *CZĘŚĆ DODATKOWA* - wersje filtru Gaussa z dodanym wyostrzaniem (filtrem górnoprzepustowym)

% WERSJA D - filtr Gaussa i filtr górnoprzepustowy z macierzą 3x3 lub 5x5
% oraz ro równe 0.9 lub 1.8

ImA = uint8(ImA);
ImA1G1 = PassLowGauss(ImAsz,3,0.9);
figure(21); imshow(ImA1G1);
title(["Obrazek A po filtrze Gaussa","o macierzy 3x3 i ro równym 0.9"]);
ImA1G2 = PassLowGauss(ImAsz,3,1.8);
figure(22); imshow(ImA1G2);
title(["Obrazek A po filtrze Gaussa","o macierzy 3x3 i ro równym 1.8"]);
ImA2G1 = PassLowGauss(ImAsz,5,0.9);
figure(23); imshow(ImA2G1);
title(["Obrazek A po filtrze Gaussa","o macierzy 5x5 i ro równym 0.9"]);
ImA2G2 = PassLowGauss(ImAsz,5,1.8);
figure(24); imshow(ImA2G2);
title(["Obrazek A po filtrze Gaussa","o macierzy 5x5 i ro równym 1.8"]);

ImA1G1 = PassHigh(ImA1G1,3);
figure(25); imshow(ImA1G1);
title(["Obrazek A po filrze Gaussa i górnoprzepustowym","o macierzy 3x3 i ro równym 0.9"]);
ImA1G2 = PassHigh(ImA1G2,3);
figure(26); imshow(ImA1G2);
title(["Obrazek A po filrze Gaussa i górnoprzepustowym","o macierzy 3x3 i ro równym 1.8"]);
ImA2G1 = PassHigh(ImA2G1,5);
figure(27); imshow(ImA2G1);
title(["Obrazek A po filrze Gaussa i górnoprzepustowym","o macierzy 5x5 i ro równym 0.9"]);
ImA2G2 = PassHigh(ImA2G2,5);
figure(28); imshow(ImA2G2);
title(["Obrazek A po filrze Gaussa i górnoprzepustowym","o macierzy 5x5 i ro równym 1.8"]);

% wykorzystanie funkcji MATLABA
mseA1G1 = immse(ImA,ImA1G1);
mseA1G2 = immse(ImA,ImA1G2);
mseA2G1 = immse(ImA,ImA2G1);
mseA2G2 = immse(ImA,ImA2G2);

% WERSJA E - filtr Gaussa i filtr górnoprzepustowy z macierzą [0,-1,0; -1,5,-1; 0,-1,0]
% oraz ro równe 0.9 lub 1.8

ImA = uint8(ImA);
ImA1G3 = PassLowGauss(ImAsz,3,0.9);
figure(29); imshow(ImA1G3);
title(["Obrazek A po filtrze Gaussa","o macierzy 3x3 i ro równym 0.9"]);
ImA1G4 = PassLowGauss(ImAsz,3,1.8);
figure(30); imshow(ImA1G4);
title(["Obrazek A po filtrze Gaussa","o macierzy 3x3 i ro równym 1.8"]);
ImA2G3 = PassLowGauss(ImAsz,5,0.9);
figure(31); imshow(ImA2G3);
title(["Obrazek A po filtrze Gaussa","o macierzy 5x5 i ro równym 0.9"]);
ImA2G4 = PassLowGauss(ImAsz,5,1.8);
figure(32); imshow(ImA2G4);
title(["Obrazek A po filtrze Gaussa","o macierzy 5x5 i ro równym 1.8"]);

ImA1G3 = PassVeryHigh(ImA1G3);
figure(33); imshow(ImA1G3);
title(["Obrazek A po filrze Gaussa i górnoprzepustowym","o macierzy 3x3 i zdefiniowana oraz ro równym 0.9"]);
ImA1G4 = PassVeryHigh(ImA1G4);
figure(34); imshow(ImA1G4);
title(["Obrazek A po filrze Gaussa i górnoprzepustowym","o macierzy 3x3 i zdefiniowana oraz ro równym 1.8"]);
ImA2G3 = PassVeryHigh(ImA2G3);
figure(35); imshow(ImA2G3);
title(["Obrazek A po filrze Gaussa i górnoprzepustowym","o macierzy 5x5 i zdefiniowana oraz ro równym 0.9"]);
ImA2G4 = PassVeryHigh(ImA2G4);
figure(36); imshow(ImA2G4);
title(["Obrazek A po filrze Gaussa i górnoprzepustowym","o macierzy 5x5 i zdefiniowana oraz ro równym 1.8"]);

% wykorzystanie funkcji MATLABA
mseA1G3 = immse(ImA,ImA1G3);
mseA1G4 = immse(ImA,ImA1G4);
mseA2G3 = immse(ImA,ImA2G3);
mseA2G4 = immse(ImA,ImA2G4);

%% CZĘŚĆ II

% obrazek B
ImB = imread('b.bmp');
figure(11); imshow(ImB);
title('Oryginalny obrazek B (bez szumu)');

ImBsz = imread('b_sz.bmp');
figure(12); imshow(ImBsz);
title('Oryginalny obrazek B (z szumem)');

% WERSJA A - filtr uśredniający

ImB = uint8(ImB);
ImB1Avg = PassLowAvg(ImBsz,3);
figure(13); imshow(ImB1Avg);
title('Obrazek B po filtrze uśredniającym o macierzy 3x3');
ImB2Avg = PassLowAvg(ImBsz,5);
figure(14); imshow(ImB2Avg);
title('Obrazek B po filtrze uśredniającym o macierzy 5x5');

% własna implementacja obliczania mse
ImB = double(ImB);
ImB1Avg = double(ImB1Avg);
ImB2Avg = double(ImB2Avg);
mseB1Avg = 0;
mseB2Avg = 0;
[m1, n1] = size(ImB);
for i = 1:m1
    for j = 1:n1
        mseB1Avg = mseB1Avg + (ImB(i,j)-ImB1Avg(i,j))^2;
        mseB2Avg = mseB2Avg + (ImB(i,j)-ImB2Avg(i,j))^2;
    end
end

mseB1Avg = mseB1Avg/(m1*n1);
mseB2Avg = mseB2Avg/(m1*n1);

% WERSJA B - filtr medianowy

ImB = uint8(ImB);
ImB1Mdn = PassLowMdn(ImBsz,3);
figure(15); imshow(ImB1Mdn);
title('Obrazek B po filtrze medianowym o macierzy 3x3');
ImB2Mdn = PassLowMdn(ImBsz,5);
figure(16); imshow(ImB2Mdn);
title('Obrazek B po filtrze medianowym o macierzy 5x5');

% własna implementacja obliczania mse
ImB = double(ImB);
ImB1Mdn = double(ImB1Mdn);
ImB2Mdn = double(ImB2Mdn);
mseB1Mdn = 0;
mseB2Mdn = 0;
[m1, n1] = size(ImB);
for i = 1:m1
    for j = 1:n1
        mseB1Mdn = mseB1Mdn + (ImB(i,j)-ImB1Mdn(i,j))^2;
        mseB2Mdn = mseB2Mdn + (ImB(i,j)-ImB2Mdn(i,j))^2;
    end
end

mseB1Mdn = mseB1Mdn/(m1*n1);
mseB2Mdn = mseB2Mdn/(m1*n1);

% WERSJA C - filtr Gaussa

ImB = uint8(ImB);
ImB1Gauss = PassLowGauss(ImBsz,3,0.9);
figure(17); imshow(ImB1Gauss);
title('Obrazek B po filtrze Gaussa o macierzy 3x3 i ro równym 0.9');
ImB2Gauss = PassLowGauss(ImBsz,3,1.8);
figure(18); imshow(ImB2Gauss);
title('Obrazek B po filtrze Gaussa o macierzy 3x3 i ro równym 1.8');
ImB3Gauss = PassLowGauss(ImBsz,5,0.9);
figure(19); imshow(ImB3Gauss);
title('Obrazek B po filtrze Gaussa o macierzy 5x5 i ro równym 0.9');
ImB4Gauss = PassLowGauss(ImBsz,5,1.8);
figure(20); imshow(ImB4Gauss);
title('Obrazek B po filtrze Gaussa o macierzy 5x5 i ro równym 1.8');

% własna implementacja obliczania mse
ImB = double(ImB);
ImB1Gauss = double(ImB1Gauss);
ImB2Gauss = double(ImB2Gauss);
ImB3Gauss = double(ImB3Gauss);
ImB4Gauss = double(ImB4Gauss);
mseB1Gauss = 0;
mseB2Gauss = 0;
mseB3Gauss = 0;
mseB4Gauss = 0;
[m1, n1] = size(ImB);
for i = 1:m1
    for j = 1:n1
        mseB1Gauss = mseB1Gauss + (ImB(i,j)-ImB1Gauss(i,j))^2;
        mseB2Gauss = mseB2Gauss + (ImB(i,j)-ImB2Gauss(i,j))^2;
        mseB3Gauss = mseB3Gauss + (ImB(i,j)-ImB3Gauss(i,j))^2;
        mseB4Gauss = mseB4Gauss + (ImB(i,j)-ImB4Gauss(i,j))^2;
    end
end

mseB1Gauss = mseB1Gauss/(m1*n1);
mseB2Gauss = mseB2Gauss/(m1*n1);
mseB3Gauss = mseB3Gauss/(m1*n1);
mseB4Gauss = mseB4Gauss/(m1*n1);

% *CZĘŚĆ DODATKOWA* - wersje filtru Gaussa z dodanym wyostrzaniem (filtrem górnoprzepustowym)

% WERSJA D - filtr Gaussa i filtr górnoprzepustowy z macierzą 3x3 lub 5x5
% oraz ro równe 0.9 lub 1.8

ImB = uint8(ImB);
ImB1G1 = PassLowGauss(ImBsz,3,0.9);
figure(37); imshow(ImB1G1);
title('Obrazek B po filtrze Gaussa o macierzy 3x3 i ro równym 0.9');
ImB1G2 = PassLowGauss(ImBsz,3,1.8);
figure(38); imshow(ImB1G2);
title('Obrazek B po filtrze Gaussa o macierzy 3x3 i ro równym 1.8');
ImB2G1 = PassLowGauss(ImBsz,5,0.9);
figure(39); imshow(ImB2G1);
title('Obrazek B po filtrze Gaussa o macierzy 5x5 i ro równym 0.9');
ImB2G2 = PassLowGauss(ImBsz,5,1.8);
figure(40); imshow(ImB2G2);
title('Obrazek B po filtrze Gaussa o macierzy 5x5 i ro równym 1.8');

ImB1G1 = PassHigh(ImB1G1,3);
figure(41); imshow(ImB1G1);
title(["Obrazek B po filrze Gaussa i górnoprzepustowym","o macierzy 3x3 i ro równym 0.9"]);
ImB1G2 = PassHigh(ImB1G2,3);
figure(42); imshow(ImB1G2);
title(["Obrazek B po filrze Gaussa i górnoprzepustowym","o macierzy 3x3 i ro równym 1.8"]);
ImB2G1 = PassHigh(ImB2G1,5);
figure(43); imshow(ImB2G1);
title(["Obrazek B po filrze Gaussa i górnoprzepustowym","o macierzy 5x5 i ro równym 0.9"]);
ImB2G2 = PassHigh(ImB2G2,5);
figure(44); imshow(ImB2G2);
title(["Obrazek B po filrze Gaussa i górnoprzepustowym","o macierzy 5x5 i ro równym 1.8"]);

% wykorzystanie funkcji MATLABA
mseB1G1 = immse(ImB,ImB1G1);
mseB1G2 = immse(ImB,ImB1G2);
mseB2G1 = immse(ImB,ImB2G1);
mseB2G2 = immse(ImB,ImB2G2);

% WERSJA E - filtr Gaussa i filtr górnoprzepustowy z macierzą [0,-1,0; -1,5,-1; 0,-1,0]
% oraz ro równe 0.9 lub 1.8

ImB = uint8(ImB);
ImB1G3 = PassLowGauss(ImBsz,3,0.9);
figure(45); imshow(ImB1G3);
title('Obrazek B po filtrze Gaussa o macierzy 3x3 i ro równym 0.9');
ImB1G4 = PassLowGauss(ImBsz,3,1.8);
figure(46); imshow(ImB1G4);
title('Obrazek B po filtrze Gaussa o macierzy 3x3 i ro równym 1.8');
ImB2G3 = PassLowGauss(ImBsz,5,0.9);
figure(47); imshow(ImB2G3);
title('Obrazek B po filtrze Gaussa o macierzy 5x5 i ro równym 0.9');
ImB2G4 = PassLowGauss(ImBsz,5,1.8);
figure(48); imshow(ImB2G4);
title('Obrazek B po filtrze Gaussa o macierzy 5x5 i ro równym 1.8');

ImB1G3 = PassVeryHigh(ImB1G3);
figure(49); imshow(ImB1G3);
title(["Obrazek B po filrze Gaussa i górnoprzepustowym","o macierzy 3x3 i zdefiniowana oraz ro równym 0.9"]);
ImB1G4 = PassVeryHigh(ImB1G4);
figure(50); imshow(ImB1G4);
title(["Obrazek B po filrze Gaussa i górnoprzepustowym","o macierzy 3x3 i zdefiniowana oraz ro równym 1.8"]);
ImB2G3 = PassVeryHigh(ImB2G3);
figure(51); imshow(ImB2G3);
title(["Obrazek B po filrze Gaussa i górnoprzepustowym","o macierzy 5x5 i zdefiniowana oraz ro równym 0.9"]);
ImB2G4 = PassVeryHigh(ImB2G4);
figure(52); imshow(ImB2G4);
title(["Obrazek B po filrze Gaussa i górnoprzepustowym","o macierzy 5x5 i zdefiniowana oraz ro równym 1.8"]);

% wykorzystanie funkcji MATLABA
mseB1G3 = immse(ImB,ImB1G3);
mseB1G4 = immse(ImB,ImB1G4);
mseB2G3 = immse(ImB,ImB2G3);
mseB2G4 = immse(ImB,ImB2G4);

%% FUNKCJE

function Im = PassLowAvg(Im,N)
    % NxN rozmiar macierzy
    OP = ones(N,N)/(N*N);
    [y, x, d] = size(Im);
    if d>1 Im = rgb2gray(Im); end
    dIm = double(Im);
    Im = uint8(zeros(y,x));
    Im = uint8(filter2(OP,dIm,'same'));
end

function Im = PassLowMdn(Im,N)
    % NxN rozmiar obrazka
    [y, x, d] = size(Im);
    if d>1 Im = rgb2gray(Im); end
    off = floor(N/2);
    for j = 1+off:y-off
        for i = 1+off:x-off
            A(1:N,1:N) = Im(j-off:j+off,i-off:i+off);
            a = median(A(:),'all');
            Im(j,i) = a;
        end
    end
end

function Im = PassLowGauss(Im,N,ro)
    % NxN rozmiar macierzy
    [y, x, d] = size(Im);
    if d>1 Im = rgb2gray(Im); end
    dIm = double(Im);
    OP = fspecial('gaussian',N,ro);
    Im = uint8(zeros(y,x));
    Im = uint8(filter2(OP,dIm,'same'));
end

% funkcje pomocnicze

function Im = PassHigh(Im,N)
    % NxN rozmiar macierzy
    TEMP = ones(N,N)/(N*N);
    AUX = zeros(N,N); AUX(ceil(N/2),ceil(N/2)) = 2;
    OP = AUX - TEMP;
    [y, x, d] = size(Im);
    if d>1 Im = rgb2gray(Im); end
    dIm = double(Im);
    Im = uint8(zeros(y,x));
    Im = uint8(filter2(OP,dIm,'same'));
end

function Im = PassVeryHigh(Im)
    OP = [0,-1,0; -1,5,-1; 0,-1,0];
    [y, x, d] = size(Im);
    if d>1 Im = rgb2gray(Im); end
    dIm = double(Im);
    Im = uint8(zeros(y,x));
    Im = uint8(filter2(OP,dIm,'same'));
end