function show_result(predict_labels,i)
disp(['Test',num2str(i)]);
disp(['Health: ',num2str(predict_labels(1,i)*100),'%']);
disp(['Pinionbroken: ',num2str(predict_labels(2,i)*100),'%']);
disp(['Spbroken: ',num2str(predict_labels(3,i)*100),'%']);
disp(['Sppbroken: ',num2str(predict_labels(4,i)*100),'%']);
end