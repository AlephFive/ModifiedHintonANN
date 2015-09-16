% Version 1.000
%
% Code provided by Ruslan Salakhutdinov and Geoff Hinton  
%
% Permission is granted for anyone to copy, use, modify, or distribute this
% program and accompanying programs and documents for any purpose, provided
% this copyright notice is retained and prominently displayed, along with
% a note saying that the original programs are available from our 
% web page. 
% The programs and documents are distributed without any warranty, express or
% implied.  As the programs were written for research purposes only, they have
% not been tested to the degree that would be advisable in any important
% application.  All use of these programs is entirely at the user's own risk.


% This program pretrains a deep autoencoder for MNIST dataset
% You can set the maximum number of epochs for pretraining each layer
% and you can set the architecture of the multilayer net.

clear all
close all

maxepoch=1; 
numhid=5; numpen=5; numpen2=5; numpen3=5; numpen4=5; numpen5=5; numpen6=5;

fprintf(1,'Converting Raw files into Matlab format \n');
%converter; 

fprintf(1,'Pretraining a deep autoencoder. \n');
fprintf(1,'The Science paper used 50 epochs. This uses %3i \n', maxepoch);

makebatches;
[numcases numdims numbatches]=size(batchdata);

fprintf(1,'Pretraining Layer 1 with RBM: %d-%d \n',numdims,numhid);
restart=1;
rbm;
hidrecbiases=hidbiases; 
save mnistvhclassify vishid hidrecbiases visbiases;

fprintf(1,'\nPretraining Layer 2 with RBM: %d-%d \n',numhid,numpen);
batchdata=batchposhidprobs;
numhid=numpen;
restart=1;
rbm;
hidpen=vishid; penrecbiases=hidbiases; hidgenbiases=visbiases;
save mnisthpclassify hidpen penrecbiases hidgenbiases;

fprintf(1,'\nPretraining Layer 3 with RBM: %d-%d \n',numpen,numpen2);
batchdata=batchposhidprobs;
numhid=numpen2;
restart=1;
rbm;
hidpen2=vishid; penrecbiases2=hidbiases; hidgenbiases2=visbiases;
save mnisthp2classify hidpen2 penrecbiases2 hidgenbiases2;

%%new
fprintf(1,'\nPretraining Layer 4 with RBM: %d-%d \n',numpen2,numpen3);
batchdata=batchposhidprobs;
numhid=numpen3;
restart=1;
rbm;
hidpen3=vishid; penrecbiases3=hidbiases; hidgenbiases3=visbiases;
save mnisthp3classify hidpen3 penrecbiases3 hidgenbiases3;

fprintf(1,'\nPretraining Layer 5 with RBM: %d-%d \n',numpen3,numpen4);
batchdata=batchposhidprobs;
numhid=numpen4;
restart=1;
rbm;
hidpen4=vishid; penrecbiases4=hidbiases; hidgenbiases4=visbiases;
save mnisthp4classify hidpen4 penrecbiases4 hidgenbiases4;

fprintf(1,'\nPretraining Layer 6 with RBM: %d-%d \n',numpen4,numpen5);
batchdata=batchposhidprobs;
numhid=numpen5;
restart=1;
rbm;
hidpen5=vishid; penrecbiases5=hidbiases; hidgenbiases5=visbiases;
save mnisthp5classify hidpen5 penrecbiases5 hidgenbiases5;

fprintf(1,'\nPretraining Layer 7 with RBM: %d-%d \n',numpen5,numpen6);
batchdata=batchposhidprobs;
numhid=numpen6;
restart=1;
rbm;
hidpen6=vishid; penrecbiases6=hidbiases; hidgenbiases6=visbiases;
save mnisthp6classify hidpen6 penrecbiases6 hidgenbiases6;

backpropclassify; 

