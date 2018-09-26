# Gearbox-fault-detect-matlab
Use SAE to classify the fault of gearbox
# Describe
Through deep learning, deep neural net- works (DNNs) with deep architectures, instead of shallow ones, could be established to mine the useful information from raw data and approximate complex non-linear func- tions. We use the SAE(Stack Autoencoder) to achieve intelligent fault diagnosis of rotating machinery.
# Datasets
Our datasets come from laboratory experiments,which are not very large.
# Data_train
![jpg1](https://github.com/zhengmingzhang/Gearbox-fault-detect-matlab/blob/master/picture/图片%201.jpg)
There are 102 samples in the training set.you can also use other data to train the model such as health_60_1…
# Data_test
The test data ends with the ‘_test’
# How to use
Before you run the program,you should define several variables.
‘is_need_train’:
0:you don’t need train a new model,you just use the saved model to test your sample in order to know what kind of fault it is.
1:you need to train a new model 
‘save_model’: If you choose is_need_train=1,you should choose the model name to save.
‘modelindex’:If you choose is_need_train=0,you should a model you have saved to test your new sample.
You shold also define architecture ,preOption_BPNN.activation
# Result
