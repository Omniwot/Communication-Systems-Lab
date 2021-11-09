fileID = fopen('text.txt');
B = fread(fileID);
textstream = dec2bin(B); 
textreshape = reshape(textstream, 1 ,[]);