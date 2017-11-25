net = googlenet
googlenet

unzip('vald.zip');
images = imageDatastore('vald','IncludeSubfolders',true,'LabelSource','foldernames');
images.ReadFcn = @(loc)imresize(imread(loc),[224,224]);
[trainImages,valImages] = splitEachLabel(images,0.75,'randomized');

net = googlenet;
lgraph = layerGraph(net);
figure('Units','normalized','Position',[0.1 0.1 0.8 0.8]);
plot(lgraph)

lgraph = removeLayers(lgraph, {'loss3-classifier','prob','output'});

numClasses = numel(categories(trainImages.Labels));
newLayers = [
    fullyConnectedLayer(numClasses,'Name','fc','WeightLearnRateFactor',20,'BiasLearnRateFactor', 20)
    softmaxLayer('Name','softmax')
    classificationLayer('Name','classoutput')];
lgraph = addLayers(lgraph,newLayers);

lgraph = connectLayers(lgraph,'pool5-drop_7x7_s1','fc');

figure('Units','normalized','Position',[0.3 0.3 0.4 0.4]);
plot(lgraph)
ylim([0,10])

options = trainingOptions('sgdm',...
    'MiniBatchSize',32,...
    'MaxEpochs',3,...
    'InitialLearnRate',1e-4,...
    'VerboseFrequency',1,...
    'ValidationData',valImages,...
    'ValidationFrequency',4);

net = trainNetwork(trainImages,lgraph,options);

predictedLabels = classify(net,valImages);
accuracy = mean(predictedLabels == valImages.Labels)