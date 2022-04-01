% Code to be run under the condition of COMSOL multiphysics with MATLAB
% written by Chensheng Luo
% Run directly this code IFF the definition is correctly done.
clear,clc;
%% General Definition
Definition

%% Initialization
model = mphopen([root,'\pseuperiode_begin']);
results=NaN(N,17);
filenames = {[root,'\scratch\Tc.txt'],
    [root,'\scratch\Tf.txt'],
    [root,'\scratch\Ts.txt'],
    [root,'\scratch\Uc.txt'],
    [root,'\scratch\Uf.txt'],
    [root,'\scratch\Vc.txt'],
    [root,'\scratch\Vf.txt'],
    [root,'\scratch\Wc.txt'],
    [root,'\scratch\Wf.txt'],
    [root,'\scratch\PcFR.txt'],
    [root,'\scratch\PfFR.txt'],
    [root,'\scratch\PcBE.txt'],
    [root,'\scratch\PfBE.txt'],
    [root,'\scratch\chargecFR.txt'],
    [root,'\scratch\chargefFR.txt'],
    [root,'\scratch\chargecBE.txt'],
    [root,'\scratch\chargefBE.txt']};

charge='p+1/2*ht2.rho*spf.U*spf.U';
quantities={'T2','T2','T2','u','u','v','v','w','w','p','p','p','p',charge,charge,charge,charge};
datasets={outflowset1,outflowset2,outflowsetS,outflowset1,outflowset2,outflowset1,outflowset2,outflowset1,outflowset2,inflowset1,inflowset2,outflowset1,outflowset2,inflowset1,inflowset2,outflowset1,outflowset2};
%% Calculation

for i = 1:N 
    tic
    fprintf('Begin comsol calculation of round %d\n',i);
    model.study('std1').run;
    fprintf('Finish comsol calculation of round %d\n',i);
    
    for k=1:17
        data = mpheval(model,quantities{k},'edim','boundary','selection',datasets{k},'refine',2);
        v = data.d1;
        x = data.p(1,:);
        y = data.p(2,:);
        fid = fopen(filenames{k},'w');
        fprintf(fid,['%%x y ',quantities{k},' %d\n'],i);
        for j = 1:length(v)
            fprintf(fid,'%f %f %f\n',x(j),y(j),v(j));
        end
        fclose(fid);
        results(i,k)= mphmean(model,quantities{k},'surface','selection',datasets{k});
    end
    
    figure(1);
    if i==1
        set(gcf,'outerposition',get(0,'screensize'));
    end
    subplot(a,b,i);
    mphplot(model,'pg1');
    
    figure(2);
    if i==1
        set(gcf,'outerposition',get(0,'screensize'));
    end
    subplot(a,b,i);
    mphplot(model,'pg10');

    fprintf('End of round No.%d\n',i);
    
    if i==1
        model = mphopen([root,'\pseuperiode_suite']);
    end
    
    for k=1:9
        model.func(['int',num2str(k)]).refresh;
    end
    time=toc;
    fprintf('Estimation of remaining time : %d min\n',round(time*(N-i)/60));
end

%% Post Traitment
PostTraitment