clear all; close all; clc;

filePath = 'C:\Program Files\MATLAB\R2016a\bin\vald\cats';
fileList = dir(filePath);
nFiles=length(fileList);
HND=figure;

for k=1:nFiles
    [~,namefiled,ext]=fileparts(fileList(k).name);
    filename=fullfile(filePath,namefiled,ext);
    outname=fullfile(filePath,sprintf('% s_wav.jpg',namefiled));
    
    if ~isempty(strfind(fileList(k).name,'.jpg'))
       fullinput = strcat(filePath,'\',fileList(k).name);
       img = imread(fullinput);
       img=imresize(img,[128 128]);
       [xar,xhr,xvr,xdr]=dwt2(img(:,:,1),'haar');
       [xag,xhg,xvg,xdg]=dwt2(img(:,:,2),'haar');
       [xab,xhb,xvb,xdb]=dwt2(img(:,:,3),'haar');
       xa(:,:,1)=xar; xa(:,:,2)=xag; xa(:,:,3)=xab;
       xh(:,:,1)=xhr; xh(:,:,2)=xhg; xh(:,:,3)=xhb;
       xv(:,:,1)=xvr; xv(:,:,2)=xvg; xv(:,:,3)=xvb;
       xd(:,:,1)=xdr; xd(:,:,2)=xdg; xd(:,:,3)=xdb;
       img=[xa*0.003 log10(xv)*0.3;log10(xh)*0.3 log10(xd)*0.3];
       imshow(img)
       %iptsetpref('ImshowBorder','tight');
       set(gcf,'PaperUnits','inches','PaperPosition',[0 0 1 1])
       saveas(HND, outname,'jpg'); 
       
    end
   
end

filePath2 = 'C:\Program Files\MATLAB\R2016a\bin\vald\dogs';
fileList2 = dir(filePath2);
nFiles2=length(fileList2);
HND=figure;

for k=1:nFiles2
    [~,namefiled,ext]=fileparts(fileList2(k).name);
    filename=fullfile(filePath2,namefiled,ext);
    outname=fullfile(filePath2,sprintf('% s_wav.jpg',namefiled));
    
    if ~isempty(strfind(fileList2(k).name,'.jpg'))
       fullinput = strcat(filePath2,'\',fileList2(k).name);
       img = imread(fullinput);
       img=imresize(img,[128 128]);
       [xar,xhr,xvr,xdr]=dwt2(img(:,:,1),'haar');
       [xag,xhg,xvg,xdg]=dwt2(img(:,:,2),'haar');
       [xab,xhb,xvb,xdb]=dwt2(img(:,:,3),'haar');
       xa(:,:,1)=xar; xa(:,:,2)=xag; xa(:,:,3)=xab;
       xh(:,:,1)=xhr; xh(:,:,2)=xhg; xh(:,:,3)=xhb;
       xv(:,:,1)=xvr; xv(:,:,2)=xvg; xv(:,:,3)=xvb;
       xd(:,:,1)=xdr; xd(:,:,2)=xdg; xd(:,:,3)=xdb;
       img=[xa*0.003 log10(xv)*0.3;log10(xh)*0.3 log10(xd)*0.3];
       imshow(img)
       %iptsetpref('ImshowBorder','tight');
       set(gcf,'PaperUnits','inches','PaperPosition',[0 0 1 1])
       saveas(HND, outname,'jpg'); 
       
    end
   
end