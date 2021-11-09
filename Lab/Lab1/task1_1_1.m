[audio,Fs]=audioread('audio_example_WAV.wav');
sound(audio,Fs) 
wavBinary = dec2bin( typecast( single(audio(:)), 'uint8'), 8 ) - '0';
wavSerial = reshape(wavBinary,1,[]);