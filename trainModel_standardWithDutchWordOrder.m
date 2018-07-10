
%% setup
clear all
pdpinit('nogui');
model = 1; %adjust model number
num_ep = 800000; %adjust number of sentences for training


%netA pools
pool('cur_con',89,'input');%some input units are not used; the model has 74 active input units
pool('hidden1',100,'hidden'); 
pool('gestalt',100,'connection'); 
pool('prev_gestalt',100,'copyback',gestalt);

%netB pools
pool('probe',176,'input');
pool('hidden2',100,'hidden');
pool('role_filler',176,'output');

%projection setup
role_filler.connect(hidden2);
hidden2.connect(probe);
hidden2.connect(gestalt);
gestalt.connect(hidden1);
hidden1.connect(prev_gestalt);
hidden1.connect(cur_con);

%netA setup
netA = srn_net([cur_con prev_gestalt hidden1 gestalt]);
netA.train_options.errmeas = 'cee';
netA.train_options.nepochs = 1;
netA.train_options.lrate = 0.00001;
netA.train_options.wrange = 0.1;

%netB setup
netB = bp_net([probe gestalt hidden2 role_filler]);
netB.train_options.errmeas = 'cee';
netB.train_options.nepochs = 1;
netB.train_options.lrate = 0.00001;
netB.train_options.wrange = 0.1;

%% training protocol

generateRepresentations_standardWithDutchWordOrder; %generate feature based semantic representations for the probe and output layer

error = zeros(1,num_ep);
training_dat = zeros(num_ep,8);
error_last_word = zeros(1, num_ep);
training_error = zeros(2,num_ep); 

for enum = 1:num_ep
    disp(enum);
    act = randi(12,1);
    age = randi(100,1);
    pat = randi(100,1);
    generatePattern_standardWithDutchWordOrder; 
    e1 = file_environment('sentence_standardWithDutchWordOrder.pat');
    netA.environment = e1;
    e2 = file_environment('roleFiller_standardWithDutchWordOrder.pat');
    netB.environment = e2;

    for snum = 1:length(netA.environment.sequences)
        netA.environment.sequence_index = snum;
        for pnum = 1:length(netA.environment.sequences(snum).intervals);
            netA.environment.interval_index = pnum;
            gestalt.error_reset_value = zeros(1,gestalt.unit_count);
            netA.clamp_pools;
            netA.compute_output;
            %-----------------------
            netB.train;
            %-----------------------
            netA.compute_error;
            error(enum) = error(enum) + sum(abs(netA.pools(end).error));
            netA.compute_weds;
            netA.change_weights;
            error_last_word(enum) = sum(abs(netA.pools(end).error));
        end
        
    end

    trainingdat(enum,1) = act;
    trainingdat(enum,2) = age;
    trainingdat(enum,3) = pat;
    trainingdat(enum,4) = sit;
    trainingdat(enum,5) = loc_c;
    trainingdat(enum,6) = sit_c;
    trainingdat(enum,7) = ins_c;
    trainingdat(enum,8) = c;
    
    training_error(1,enum) = error(enum);
    training_error(2,enum) = error_last_word(enum);

    if (mod(enum,10000)==0)||((mod(enum,1000)==0)&&(enum<30000))
        weights_a = get_weights(netA);
        weights_b=get_weights(netB);
        fname = ['trainRes_standardWithDutchWordOrder_',num2str(model),'_', num2str(enum)];
        save (fname);
    end
    fclose('all');
end


filename = ['results_standardWithDutchWordOrder_',num2str(model),'_', num2str(enum)];
save(filename)