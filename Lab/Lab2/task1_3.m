symbls={'H' 'A' 'R' 'S' 'L' 'B' 'Y' 'N' 'K'};
prob=[0.1875 0.3125 0.125 0.0625 0.0625 0.0625 0.0625 0.0625 0.0625];
% H 3/16
% A 5/16
% R 2/16
% S 1/16
% L 1/16
% B 1/16
% Y 1/16
% N 1/16
% K 1/16
[dict,avglen]=huffmandict(symbls,prob);
inpSig={'H' 'A' 'R' 'S' 'A' 'L' 'B' 'Y' 'N' 'K'};
code=huffmanenco(inpSig,dict);
sig=huffmandeco(code,dict);