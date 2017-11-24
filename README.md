# Applied_Mathematics_Capstone_Design


-Matlab : 응용수학캡스톤디자인 전공수업 (Alexnet , Googlenet) : cats vs dogs binary classification 
- CNN(Convolutional Neural Network) 사용

 <프로젝트 진행 과정>
 - (1) Python 으로 직접 모델링 (Contests 폴더 kaggle_cats_dogs 참조)
 - (2) image augmentation , training image wavelet transform 하였으나 accuracy 가 평균 65%
 - DWT_RGB.m : discrete wavelet transform code
 - training set의 부족임을 알게되어 googlenet , alexnet 적용 , validation set : cats(77 images) , dogs(77 images)
 - At least, Matlab r2016b version, Using Computer Vision System Toolbox, Image Processing Toolbox, Neural Network Toolbox. Parallel Computing Toolbox, Statistics and Machine Learning Toolbox
 - (3) Alexnet accuracy : cats : 87.04% , dogs : 83.33%
 - (4) Googlenet accuracy : 93.48% (I recommend using GPU better than CPU, because of time spending.) 
