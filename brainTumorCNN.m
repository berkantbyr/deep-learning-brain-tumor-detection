cd('C:\Users\berka\OneDrive\Desktop\Brain_Dataset')

imds = imageDatastore('.', ...
    "IncludeSubfolders", true, ...
    "LabelSource", "foldernames"); % Mevcut klasördeki alt klasörleri kullan(. ile)


countEachLabel(imds)  % kontrol et

[imdsTrain, imdsTest] = splitEachLabel(imds, 0.8, "randomized");  %veriyi eğitim ve sınav diye ayır


imdsTrain.ReadFcn = @(x) imresize(im2gray(imread(x)), [224 224]);
imdsTest.ReadFcn  = @(x) imresize(im2gray(imread(x)), [224 224]);   % Hem RGB hem de zaten gri olan görüntülerde çalışır, hepsi 224x224 boyutunda



layers = [                                          % CNN oluştur
    imageInputLayer([224 224 1])
    convolution2dLayer(3,8,"Padding","same")
    reluLayer
    maxPooling2dLayer(2)
    convolution2dLayer(3,16,"Padding","same")
    reluLayer
    maxPooling2dLayer(2)
    fullyConnectedLayer(2)   
    softmaxLayer
    classificationLayer
];                            
 


options = trainingOptions("adam", ...
    "MaxEpochs", 10, ...
    "MiniBatchSize", 16, ...
    "Shuffle", "every-epoch", ...
    "Verbose", true);  % konsola detaylı bilgi verir


net = trainNetwork(imdsTrain, layers, options);  % eğit

YPred = classify(net, imdsTest);
YTrue = imdsTest.Labels;   % sınav yaptır


accuracy = mean(YPred == YTrue)


save("brainTumorCNN.mat", "net");  %modeli kaydet

