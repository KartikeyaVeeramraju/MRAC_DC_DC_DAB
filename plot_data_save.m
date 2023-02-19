cd R:\research\ECE\kimballjw\Kartik\Coursework\Adaptive\ProjectResults

 num = 1;
    

    str1 = append('arax_',num2str(num));
    str2 = append('vpvm_',num2str(num)); 
    str3 = append('phi_',num2str(num)); 
    testfile = append(str1,'.eps'); 
    while isfile(testfile)
        %if file is present append the file's last number
        num = num + 1;
    str1 = append('arax_',num2str(num)); 
    str2 = append('vpvm_',num2str(num)); 
    str3 = append('phi_',num2str(num)); 
    
    
    testfile = append('arax_',num2str(num),'.eps');
    %testfile_eps = append('arax_',num2str(num));
    end
    

print(arax_fig,'-depsc','-tiff','-r600',str1)
print(xpxm_fig,'-depsc','-tiff','-r600',str2)
print(phi_fig,'-depsc','-tiff','-r600',str3)
print(arax_fig,'-dpng',str1)
print(xpxm_fig,'-dpng',str2)
print(phi_fig,'-dpng',str3)
readme_str = append('ReadMe_',num2str(num),'.txt');
fileID = fopen(readme_str,'w');

fprintf(fileID,'%s \t\t%s\n','parameter','value');
fprintf(fileID,'-------------------------\n');
fprintf(fileID,'f \t\t%e\n',f);
fprintf(fileID,'Vin \t\t%e\n',Vin);
fprintf(fileID,'Vout1 \t\t%e\n',Vout1);
fprintf(fileID,'Vout2 \t\t%e\n',Vout2);
fprintf(fileID,'Npri \t\t%e\n',n_pri);
fprintf(fileID,'Nsec \t\t%e\n',n_sec);
fprintf(fileID,'Co \t\t%e\n',Co);
fprintf(fileID,'Rc \t\t%e\n',Rc);
fprintf(fileID,'load_step_time \t\t%e\n',load_step_time);
fprintf(fileID,'voltage_step_time \t\t%e\n',voltage_step_time);
fprintf(fileID,'P1 \t\t%e\n',P1);
fprintf(fileID,'P2 \t\t%e\n',P2);
fprintf(fileID,'RL1 \t\t%0.2f\n',Rload1);
fprintf(fileID,'RL2 \t\t%0.2f\n',Rload2);
fprintf(fileID,'Llk \t\t%0.3f\n',Llk);
fprintf(fileID,'Rt \t\t%0.3f\n',Rt);

fclose(fileID);

cd S:\Desktop\Adaptive_Control\Project\Project_Simulation_1\dcdc_dab_mrac
