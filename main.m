clc;clear
is_need_train=0;%%do you need to train a new model?
save_model=8;%the model name you want to save 
modelindex=8;%%choose your model
%% 读取 image 及 label
data_train={'health1','health2','pinionbroken1','spbroken1','sppbroken1'};
[images_train,labels_train]=loaddata(data_train);
% randIndex=randperm(size(images_train,2));
% images_train=images_train(:,randIndex);
% labels_train=labels_train(randIndex,:);
data_test={'spbroken_test1'};
[images_Test,labels_Test]=loaddata(data_test);
randIndex=randperm(size(images_Test,2));
images_Test=images_Test(:,randIndex);
labels_Test=labels_Test(randIndex,:);
%% 设置 SAE训练时 参数
architecture = [2001 900 400 200 4]; % SAE网络的结构
% 设置 AE的预选参数 及 BP的预选参数
preOption_SAE.option_AE.activation  = {'ReLU'};

preOption_SAE.option_AE.is_sparse    = 1;
preOption_SAE.option_AE.sparse_rho   = 0.01;
preOption_SAE.option_AE.sparse_beta  = 0.3;

preOption_SAE.option_AE.is_denoising = 0;%denoise即在输入层加入随机噪声增强鲁棒性
preOption_SAE.option_AE.noise_rate   = 0.15;
% preOption_SAE.option_AE.noise_layer = 'all_layers';
preOption_SAE.option_BP.activation = {'softmax'};
% 得到SAE的预选参数
option_SAE = get_SAE_option(preOption_SAE);

%% 设置 SAE预测时 参数
preOption_BPNN.activation = {'ReLU'; 'ReLU';'ReLU';'softmax'};
option_BPNN = get_BPNN_option(preOption_BPNN);

%% 调用 runSAEOnce 运行一次SAE
is_disp_network = 0; % 不展示网络
is_disp_info    = 0; % 展示信息
if (is_need_train==1)
    %%%训练加预测%%%%%
    [opt_theta,predict_labels, accuracy] = run_SAE_once(images_train, labels_train, ...
           images_Test, labels_Test, ... % 数据
           architecture, ...
           option_SAE, option_BPNN, ...
            is_disp_network, is_disp_info,save_model);
else 
    %%%%%用之前得到的模型对新测试集作预测%%%%%
    %%load model%%
    model=load(strcat('./model/opt_theta',num2str(modelindex)));
    opt_theta=model.opt_theta;
    predict_labels = predict_NN( images_train, architecture, opt_theta, option_BPNN);
    % disp(['各种情况概率为',num2str(predict_labels)])
    accuracy = get_accuracy_rate( predict_labels, labels_train );
    disp(['accuracy( fine-tune) on train dataset is ', num2str(accuracy * 100), '%']);
    predict_labels = predict_NN( images_Test, architecture, opt_theta, option_BPNN);
    accuracy = get_accuracy_rate( predict_labels, labels_Test );
    disp(['accuracy( fine-tune) on test dataset is ', num2str(accuracy * 100), '%']);
end
%%%%%disply the predict of each test sample%%%%%%
testindex=1;
show_result(predict_labels,testindex);



    
    



