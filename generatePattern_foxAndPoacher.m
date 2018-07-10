%generates training pattern (sentences and role filler pairs of described events) for SG model training 

constituent1 = zeros(1,179); 
constituent2 = zeros(1,179);
constituent3 = zeros(1,179);
constituent4 = zeros(1,179);
constituent5 = zeros(1,179);
constituent6 = zeros(1,179);
constituent7 = zeros(1,179);

order_constituent1 = zeros(1,179); 
order_constituent2 = zeros(1,179);
order_constituent3 = zeros(1,179);
order_constituent4 = zeros(1,179);

active_constituent1 = zeros(1,179); 
active_constituent2 = zeros(1,179);
active_constituent3 = zeros(1,179);
active_constituent4 = zeros(1,179);


role_act        = zeros(1,182); 
role_act(1,178) = 1;
role_age        = zeros(1,182);
role_age(1,179) = 1;
role_pat        = zeros(1,182);
role_pat(1,180) = 1;
role_loc        = zeros(1,182);
role_loc(1,181) = 1;
role_sit        = zeros(1,182);
role_sit(1,182) = 1;

filler_act    = zeros(1,182);
filler_age    = zeros(1,182);
filler_pat    = zeros(1,182);
filler_loc    = zeros(1,182);
filler_sit    = zeros(1,182);

role_filler_act   = zeros(1,182);
role_filler_age   = zeros(1,182);
role_filler_pat   = zeros(1,182);
role_filler_loc   = zeros(1,182);
role_filler_sit   = zeros(1,182);



loc_c = 1; 
sit = 0; 
sit_c = 0;
pas = 0;

    
       
if act == 1  %"read"
    roles = [1 2 3 4]; %which roles are presented with this action? 1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
    pas = randi(100,1); %passive
    c = 5; % number of constituents in the sentence +1
    
    constituent2(14) = 1;
    filler_act(1,1:177)=sem(14).vec;%read

    if age < 41 %choose agent
        
        constituent1(2) = 1;
        filler_age(1,1:177)=sem(2).vec;%he
              
            if pat < 71 
                constituent3(54) = 1;
                filler_pat(1,1:177)=sem(54).vec;%novel 
          
                   filler_loc(1,1:177)=sem(19).vec;%living room
                   if loc_c == 1           
                            constituent4(19)=1;
                            constituent4(73)=1; %at/in... location-marker
                       
                   end   

            elseif pat > 70
                constituent3(59) = 1;
                filler_pat(1,1:177)=sem(59).vec;%letter
             
                   filler_loc(1,1:177)=sem(83).vec;%bedroom
                   if loc_c == 1           
                            constituent4(83)=1;
                            constituent4(73)=1; %at/in... location-marker
                      
                   end   
            end
                    
    elseif (age > 40) && (age < 81) 
        constituent1(1) = 1;
        filler_age(1,1:177)=sem(1).vec;%she
        
            if pat < 71       
                constituent3(54) = 1;
                filler_pat(1,1:177)=sem(54).vec;%novel 
            
                   filler_loc(1,1:177)=sem(19).vec;%living room
                   if loc_c == 1           
                            constituent4(19)=1;
                            constituent4(73)=1; %at/in... location-marker
                    
                   end   

            elseif pat > 70
                constituent3(59) = 1;
                filler_pat(1,1:177)=sem(59).vec;%letter 
               
                   filler_loc(1,1:177)=sem(83).vec;%bedroom
                   if loc_c == 1           
                            constituent4(83)=1;
                            constituent4(73)=1; %at/in... location-marker
                    
                   end   
            end
            
    elseif (age > 80) && (age < 91) 
        constituent1(3) = 1;
        filler_age(1,1:177)=sem(3).vec;%girl
        
            if pat < 61        
                constituent3(54) = 1;
                filler_pat(1,1:177)=sem(54).vec;%novel 
             
                   filler_loc(1,1:177)=sem(19).vec;%living room
                   if loc_c == 1           
                            constituent4(19)=1;
                            constituent4(73)=1; %at/in... location-marker
                
                   end   

            elseif pat > 60
                constituent3(59) = 1;
                filler_pat(1,1:177)=sem(59).vec;%letter 
               
                   filler_loc(1,1:177)=sem(83).vec;%bedroom
                   if loc_c == 1           
                            constituent4(83)=1;
                            constituent4(73)=1; %at/in... location-marker
                 
                   end   
            end            
    
     elseif age > 90 
        constituent1(4) = 1;
        filler_age(1,1:177)=sem(4).vec;%boy
        
            if pat < 61        
                constituent3(54) = 1;
                filler_pat(1,1:177)=sem(54).vec;%novel
              
                   filler_loc(1,1:177)=sem(19).vec;%living room
                   if loc_c == 1           
                            constituent4(19)=1;
                            constituent4(73)=1; %at/in... location-marker
                    
                   end   

            elseif pat > 60
                constituent3(59) = 1;
                filler_pat(1,1:177)=sem(59).vec;%letter  
              
                   filler_loc(1,1:177)=sem(83).vec;%bedroom
                   if loc_c == 1           
                            constituent4(83)=1;
                            constituent4(73)=1; %at/in... location-marker
                
                   end   
            end
    end
 
           order_constituent1 = constituent1;
           order_constituent2 = constituent2;
           order_constituent3 = constituent3;
           order_constituent4 = constituent4;
           
           constituent2(167) = 1;
           constituent3 = order_constituent3;
           constituent4 = order_constituent2;
           constituent5 = order_constituent4;
           c = c+1;
           
     if pas > 70 %30% of sentences are in passive voice -> change word order 
                 %and add 'was by'
           
           active_constituent1 = constituent1;
           active_constituent2 = constituent2;
           active_constituent3 = constituent3;
           active_constituent4 = constituent4;

           filler_age(1,1)=1;

           constituent1 = active_constituent3; 
           constituent2(75)=1; 
           constituent2(167)=0;
           constituent3 = active_constituent1;
      end                                         
 
                   
elseif act == 2 %"write"
    roles = [1 2 3 4];  %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
    pas = randi(100,1);
    c = 5; 
    
    constituent2(15) = 1;
    filler_act(1,1:177)=sem(15).vec;%write

    if age < 41 %choose agent
        
        constituent1(2) = 1;
        filler_age(1,1:177)=sem(2).vec;%he
              
            if pat < 71 
                constituent3(55) = 1;
                filler_pat(1,1:177)=sem(55).vec;%email

                   filler_loc(1,1:177)=sem(19).vec;%living room
                            constituent4(19)=1;
                            constituent4(73)=1; %at/in... location-marker
 
                   
            elseif pat > 70
                constituent3(56) = 1;
                filler_pat(1,1:177)=sem(56).vec;%sms 

                   filler_loc(1,1:177)=sem(82).vec;%veranda
                            constituent4(82)=1;
                            constituent4(73)=1; %at/in... location-marker

            end
                    
    elseif (age > 40) && (age < 81) 
        constituent1(1) = 1;
        filler_age(1,1:177)=sem(1).vec;%she
        
            if pat < 71        
                constituent3(55) = 1;
                filler_pat(1,1:177)=sem(55).vec;%email 

                   filler_loc(1,1:177)=sem(19).vec;%living room
                            constituent4(19)=1;
                            constituent4(73)=1; %at/in... location-marker

                            
            elseif pat > 70
                constituent3(56) = 1;
                filler_pat(1,1:177)=sem(56).vec;%sms

                   filler_loc(1,1:177)=sem(82).vec;%veranda
                            constituent4(82)=1;
                            constituent4(73)=1; %at/in... location-marker

            end
            
    elseif (age > 80) && (age < 91) 
        constituent1(3) = 1;
        filler_age(1,1:177)=sem(3).vec;%girl
        
            if pat < 61        
                constituent3(55) = 1;
                filler_pat(1,1:177)=sem(55).vec;%email

                   filler_loc(1,1:177)=sem(19).vec;%living room
                            constituent4(19)=1;
                            constituent4(73)=1; %at/in... location-marker

                            
            elseif pat > 60
                constituent3(56) = 1;
                filler_pat(1,1:177)=sem(56).vec;%sms   

                   filler_loc(1,1:177)=sem(82).vec;%veranda
                            constituent4(82)=1;
                            constituent4(73)=1; %at/in... location-marker

            end            
    
     elseif age > 90 
        constituent1(4) = 1;
        filler_age(1,1:177)=sem(4).vec;%boy
        
            if pat < 61        
                constituent3(55) = 1;
                filler_pat(1,1:177)=sem(55).vec;%email

                   filler_loc(1,1:177)=sem(19).vec;%living room
                            constituent4(19)=1;
                            constituent4(73)=1; %at/in... location-marker

                            
            elseif pat > 60
                constituent3(56) = 1;
                filler_pat(1,1:177)=sem(56).vec;%sms 

                   filler_loc(1,1:177)=sem(82).vec;%veranda
                            constituent4(82)=1;
                            constituent4(73)=1; %at/in... location-marker

            end
    end
 
     
           order_constituent1 = constituent1;
           order_constituent2 = constituent2;
           order_constituent3 = constituent3;
           order_constituent4 = constituent4;
           
           constituent2(167) = 1;
           constituent3 = order_constituent3;
           constituent4 = order_constituent2;
           constituent5 = order_constituent4;
           c = c+1;
           
     if pas > 70 %30% of sentences are in passive voice -> change word order 
           
           active_constituent1 = constituent1;
           active_constituent2 = constituent2;
           active_constituent3 = constituent3;
           active_constituent4 = constituent4;

           filler_age(1,1)=1;

           constituent1 = active_constituent3; 
           constituent2(75)=1; 
           constituent2(167)=0;
           constituent3 = active_constituent1;
      end                
    

                   
 
 elseif act == 3; %feed
       roles = [1 2 3 4 5];  %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
       pas = randi(100,1);
       c = 1; %initialize constituent counter (is variable with this action, because the "situation" constituent may not be presented
       sit_c = randi(2,1);% determines whether the "situation" constituent will be presented  

           filler_sit(1,1:177)=sem(86).vec;%holiday
           if sit_c == 1
               constituent1(86) = 1; 
               constituent1(72) = 1; %during
               c = c + 1;
           end
           
           if age < 41 
              filler_age(1,1:177)=sem(2).vec;%man
              if c == 1
                  constituent1(2)=1;
              elseif c == 2
                  constituent2(2)=1;
              end
              c = c+1;
              
                    filler_act(1,1:177)=sem(8).vec;%feed 
                        if c == 2            
                            constituent2(8)=1;
                        elseif c == 3
                            constituent3(8)=1;
                        end
                        c = c+1;
                 
                                if pat< 71 
                                   filler_pat(1,1:177)=sem(66).vec;%robin
                                   if c == 3           
                                        constituent3(66)=1;
                                    elseif c == 4
                                        constituent4(66)=1;
                                   end
                                    c = c+1;

                                    filler_loc(1,1:177)=sem(78).vec;%park
                                    if loc_c == 1
                                        if c == 4           
                                            constituent4(78)=1;
                                            constituent4(73)=1; %at/in... location-marker
                                        elseif c == 5
                                            constituent5(78)=1;
                                            constituent5(73)=1;
                                        end
                                        c = c+1;  
                                    end
                                                     
                                elseif pat > 70 
                                    filler_pat(1,1:177)=sem(67).vec;%canary                 
                                    if c == 3            
                                        constituent3(67)=1;
                                    elseif c == 4
                                        constituent4(67)=1;
                                    end
                                    c = c+1;
 
                                    filler_loc(1,1:177)=sem(20).vec;%garden
                                    if loc_c == 1
                                        if c == 4           
                                            constituent4(20)=1;
                                            constituent4(73)=1; %at/in... location-marker
                                        elseif c == 5
                                            constituent5(20)=1;
                                            constituent5(73)=1;
                                        end
                                        c = c+1;  
                                    end
                 
                                end
              
           elseif (age > 40)&&(age < 81)
              filler_age(1,1:177)=sem(1).vec;%woman
              if c == 1
                  constituent1(1)=1;
              elseif c == 2
                  constituent2(1)=1;
              end
              c = c+1;
              
                    filler_act(1,1:177)=sem(8).vec;%feed 
                        if c == 2           
                            constituent2(8)=1;
                        elseif c == 3
                            constituent3(8)=1;
                        end
                        c = c+1;
                 
                                if pat< 71
                                   filler_pat(1,1:177)=sem(66).vec;%robin
                                   if c == 3           
                                        constituent3(66)=1;
                                    elseif c == 4
                                        constituent4(66)=1;
                                   end
                                    c = c+1;

                                    filler_loc(1,1:177)=sem(78).vec;%park
                                    if loc_c == 1
                                        if c == 4           
                                            constituent4(78)=1;
                                            constituent4(73)=1; %at/in... location-marker
                                        elseif c == 5
                                            constituent5(78)=1;
                                            constituent5(73)=1;
                                        end
                                        c = c+1;  
                                    end
                                    
                                elseif pat > 70 
                                    filler_pat(1,1:177)=sem(67).vec;%canary                 
                                    if c == 3            
                                        constituent3(67)=1;
                                    elseif c == 4
                                        constituent4(67)=1;
                                    end
                                    c = c+1; 
                                    
                                    filler_loc(1,1:177)=sem(20).vec;%garden
                                    if loc_c == 1
                                        if c == 4           
                                            constituent4(20)=1;
                                            constituent4(73)=1; %at/in... location-marker
                                        elseif c == 5
                                            constituent5(20)=1;
                                            constituent5(73)=1;
                                        end
                                        c = c+1;  
                                    end
                 
                                end
                                
                                
           elseif (age > 80)&&(age < 91)
              filler_age(1,1:177)=sem(3).vec;%girl
              if c == 1
                  constituent1(3)=1;
              elseif c == 2
                  constituent2(3)=1;
              end
              c = c+1;
              
                    filler_act(1,1:177)=sem(8).vec;%feed 
                        if c == 2           
                            constituent2(8)=1;
                        elseif c == 3
                            constituent3(8)=1;
                        end
                        c = c+1;
                 
                                if pat< 61 
                                   filler_pat(1,1:177)=sem(66).vec;%robin
                                   if c == 3           
                                        constituent3(66)=1;
                                    elseif c == 4
                                        constituent4(66)=1;
                                   end
                                    c = c+1;
                                    
                                    filler_loc(1,1:177)=sem(78).vec;%park
                                    if loc_c == 1
                                        if c == 4           
                                            constituent4(78)=1;
                                            constituent4(73)=1; %at/in... location-marker
                                        elseif c == 5
                                            constituent5(78)=1;
                                            constituent5(73)=1;
                                        end
                                        c = c+1;  
                                    end

                                elseif pat > 60
                                    filler_pat(1,1:177)=sem(67).vec;%canary                 
                                    if c == 3            
                                        constituent3(67)=1;
                                    elseif c == 4
                                        constituent4(67)=1;
                                    end
                                    c = c+1;
 
                                    filler_loc(1,1:177)=sem(20).vec;%garden
                                    if loc_c == 1
                                        if c == 4           
                                            constituent4(20)=1;
                                            constituent4(73)=1; %at/in... location-marker
                                        elseif c == 5
                                            constituent5(20)=1;
                                            constituent5(73)=1;
                                        end
                                        c = c+1;  
                                    end
                 
                                end                                
                                

           elseif age > 90
              filler_age(1,1:177)=sem(4).vec;%boy
              if c == 1
                  constituent1(4)=1;
              elseif c == 2
                  constituent2(4)=1;
              end
              c = c+1; 
 
                    filler_act(1,1:177)=sem(8).vec;%feed 
                        if c == 2         
                            constituent2(8)=1;
                        elseif c == 3
                            constituent3(8)=1;
                        end
                        c = c+1;
                 
                                if pat< 61 
                                   filler_pat(1,1:177)=sem(66).vec;%robin
                                   if c == 3           
                                        constituent3(66)=1;
                                    elseif c == 4
                                        constituent4(66)=1;
                                   end
                                    c = c+1;

                                    filler_loc(1,1:177)=sem(78).vec;%park
                                    if loc_c == 1
                                        if c == 4           
                                            constituent4(78)=1;
                                            constituent4(73)=1; %at/in... location-marker
                                        elseif c == 5
                                            constituent5(78)=1;
                                            constituent5(73)=1;
                                        end
                                        c = c+1;  
                                    end
                                    
                                elseif pat > 60 
                                    filler_pat(1,1:177)=sem(67).vec;%canary                 
                                    if c == 3            
                                        constituent3(67)=1;
                                    elseif c == 4
                                        constituent4(67)=1;
                                    end
                                    c = c+1;
 
                                    filler_loc(1,1:177)=sem(20).vec;%garden
                                    if loc_c == 1
                                        if c == 4           
                                            constituent4(20)=1;
                                            constituent4(73)=1; %at/in... location-marker
                                        elseif c == 5
                                            constituent5(20)=1;
                                            constituent5(73)=1;
                                        end
                                        c = c+1;  
                                    end
                 
                                end      
           end
        
      
       
           order_constituent1 = constituent1;
           order_constituent2 = constituent2;
           order_constituent3 = constituent3;
           order_constituent4 = constituent4;
           
           if sit_c == 1
            constituent3(167) = 1;
            constituent4 = order_constituent4;
            constituent5 = order_constituent3;                      
           elseif sit_c == 2
            constituent2(167) = 1;
            constituent3 = order_constituent3;
            constituent4 = order_constituent2;           
           end
           
           c=c+1;
           
      
      if pas > 70 %30% of sentences are in passive voice -> change word order 
           
           active_constituent1 = constituent1;
           active_constituent2 = constituent2;
           active_constituent3 = constituent3;
           active_constituent4 = constituent4;
           active_constituent5 = constituent5;

           filler_age(1,1)=1;

           if sit_c == 1
               constituent2 = active_constituent4;
               constituent3(75)=1; 
               constituent3(167)=0;
               constituent4 = active_constituent2;  
           elseif sit_c == 2 
               constituent1 = active_constituent3; 
               constituent2(75)=1; 
               constituent2(167)=0;
               constituent3 = active_constituent1;
           end
       end
                   
 elseif act == 4; %plant
       roles = [1 2 3 4 5]; %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
       pas = randi(100,1);
       c = 1; %initialize constituent counter
       sit_c = randi(2,1);

           filler_sit(1,1:177)=sem(87).vec;%sunday
           if sit_c == 1
               constituent1(87) = 1; 
               constituent1(72) = 1; %during
               c = c + 1;
           end
           
           if age < 41 
              filler_age(1,1:177)=sem(2).vec;%man
              if c == 1
                  constituent1(2)=1;
              elseif c == 2
                  constituent2(2)=1;
              end
              c = c+1;
              
                    filler_act(1,1:177)=sem(10).vec;%plant 
                        if c == 2            
                            constituent2(10)=1;
                        elseif c == 3
                            constituent3(10)=1;
                        end
                        c = c+1;
                 
                                if pat< 71 
                                   filler_pat(1,1:177)=sem(60).vec;%rose
                                   if c == 3            
                                        constituent3(60)=1;
                                    elseif c == 4
                                        constituent4(60)=1;
                                   end
                                    c = c+1;

                                    filler_loc(1,1:177)=sem(20).vec;%garden
                                    if loc_c == 1
                                        if c == 4           
                                            constituent4(20)=1;
                                            constituent4(73)=1; %at/in... location-marker
                                        elseif c == 5
                                            constituent5(20)=1;
                                            constituent5(73)=1;
                                        end
                                        c = c+1;  
                                    end                   

                                                     
                                elseif pat > 70 
                                    filler_pat(1,1:177)=sem(61).vec;%daisy                 
                                    if c == 3            
                                        constituent3(61)=1;
                                    elseif c == 4
                                        constituent4(61)=1;
                                    end
                                    c = c+1;
 
                                    filler_loc(1,1:177)=sem(81).vec;%backyard
                                    if loc_c == 1
                                        if c == 4           
                                            constituent4(81)=1;
                                            constituent4(73)=1; %at/in... location-marker
                                        elseif c == 5
                                            constituent5(81)=1;
                                            constituent5(73)=1;
                                        end
                                        c = c+1;  
                                    end       
                 
                                end
              
           elseif (age > 40)&&(age < 81)
              filler_age(1,1:177)=sem(1).vec;%woman
              if c == 1
                  constituent1(1)=1;
              elseif c == 2
                  constituent2(1)=1;
              end
              c = c+1;
              
                    filler_act(1,1:177)=sem(10).vec;%plant 
                        if c == 2           
                            constituent2(10)=1;
                        elseif c == 3
                            constituent3(10)=1;
                        end
                        c = c+1;
                 
                                if pat< 71 
                                   filler_pat(1,1:177)=sem(60).vec;%rose
                                   if c == 3           
                                        constituent3(60)=1;
                                    elseif c == 4
                                        constituent4(60)=1;
                                   end
                                    c = c+1;

                                    filler_loc(1,1:177)=sem(20).vec;%garden
                                    if loc_c == 1
                                        if c == 4           
                                            constituent4(20)=1;
                                            constituent4(73)=1; %at/in... location-marker
                                        elseif c == 5
                                            constituent5(20)=1;
                                            constituent5(73)=1;
                                        end
                                        c = c+1;  
                                    end       
                                    
                                elseif pat > 70 
                                    filler_pat(1,1:177)=sem(61).vec;%daisy                 
                                    if c == 3            
                                        constituent3(61)=1;
                                    elseif c == 4
                                        constituent4(61)=1;
                                    end
                                    c = c+1;
 
                                    filler_loc(1,1:177)=sem(81).vec;%backyard
                                    if loc_c == 1
                                        if c == 4           
                                            constituent4(81)=1;
                                            constituent4(73)=1; %at/in... location-marker
                                        elseif c == 5
                                            constituent5(81)=1;
                                            constituent5(73)=1;
                                        end
                                        c = c+1;  
                                    end       
                 
                                end
                                
                                
           elseif (age > 80)&&(age < 91)
              filler_age(1,1:177)=sem(3).vec;%girl
              if c == 1
                  constituent1(3)=1;
              elseif c == 2
                  constituent2(3)=1;
              end
              c = c+1;
              
                    filler_act(1,1:177)=sem(10).vec;%plant 
                        if c == 2           
                            constituent2(10)=1;
                        elseif c == 3
                            constituent3(10)=1;
                        end
                        c = c+1;
                 
                                if pat< 61 
                                   filler_pat(1,1:177)=sem(60).vec;%rose
                                   if c == 3           
                                        constituent3(60)=1;
                                    elseif c == 4
                                        constituent4(60)=1;
                                   end
                                    c = c+1;

                                    filler_loc(1,1:177)=sem(20).vec;%garden
                                    if loc_c == 1
                                        if c == 4           
                                            constituent4(20)=1;
                                            constituent4(73)=1; %at/in... location-marker
                                        elseif c == 5
                                            constituent5(20)=1;
                                            constituent5(73)=1;
                                        end
                                        c = c+1;  
                                    end       
                                    
                                elseif pat > 60 
                                    filler_pat(1,1:177)=sem(61).vec;%daisy                 
                                    if c == 3            
                                        constituent3(61)=1;
                                    elseif c == 4
                                        constituent4(61)=1;
                                    end
                                    c = c+1;
 
                                    filler_loc(1,1:177)=sem(81).vec;%backyard
                                    if loc_c == 1
                                        if c == 4           
                                            constituent4(81)=1;
                                            constituent4(73)=1; %at/in... location-marker
                                        elseif c == 5
                                            constituent5(81)=1;
                                            constituent5(73)=1;
                                        end
                                        c = c+1;  
                                    end       
                 
                                end                                
                                

           elseif age > 90
              filler_age(1,1:177)=sem(4).vec;%boy
              if c == 1
                  constituent1(4)=1;
              elseif c == 2
                  constituent2(4)=1;
              end
              c = c+1; 
 
                    filler_act(1,1:177)=sem(10).vec;%plant 
                        if c == 2         
                            constituent2(10)=1;
                        elseif c == 3
                            constituent3(10)=1;
                        end
                        c = c+1;
                 
                                if pat< 61 
                                   filler_pat(1,1:177)=sem(60).vec;%rose
                                   if c == 3           
                                        constituent3(60)=1;
                                    elseif c == 4
                                        constituent4(60)=1;
                                   end
                                    c = c+1;

                                    filler_loc(1,1:177)=sem(20).vec;%garden
                                    if loc_c == 1
                                        if c == 4           
                                            constituent4(20)=1;
                                            constituent4(73)=1; %at/in... location-marker
                                        elseif c == 5
                                            constituent5(20)=1;
                                            constituent5(73)=1;
                                        end
                                        c = c+1;  
                                    end       
                                    
                                elseif pat > 60 
                                    filler_pat(1,1:177)=sem(61).vec;%daisy                 
                                    if c == 3            
                                        constituent3(61)=1;
                                    elseif c == 4
                                        constituent4(61)=1;
                                    end
                                    c = c+1;
 
                                    filler_loc(1,1:177)=sem(81).vec;%backyard
                                    if loc_c == 1
                                        if c == 4           
                                            constituent4(81)=1;
                                            constituent4(73)=1; %at/in... location-marker
                                        elseif c == 5
                                            constituent5(81)=1;
                                            constituent5(73)=1;
                                        end
                                        c = c+1;  
                                    end       
                 
                                end      
           end
        
                         
           order_constituent1 = constituent1;
           order_constituent2 = constituent2;
           order_constituent3 = constituent3;
           order_constituent4 = constituent4;
           
           if sit_c == 1
            constituent3(167) = 1;
            constituent4 = order_constituent4;
            constituent5 = order_constituent3;                      
           elseif sit_c == 2
            constituent2(167) = 1;
            constituent3 = order_constituent3;
            constituent4 = order_constituent2;           
           end
           
           c=c+1;
                 
      if pas > 70 %30% of sentences are in passive voice -> change word order 
           
           active_constituent1 = constituent1;
           active_constituent2 = constituent2;
           active_constituent3 = constituent3;
           active_constituent4 = constituent4;
           active_constituent5 = constituent5;

           filler_age(1,1)=1;

           if sit_c == 1
               constituent2 = active_constituent4;
               constituent3(75)=1; 
               constituent3(167)=0;
               constituent4 = active_constituent2;  
           elseif sit_c == 2 
               constituent1 = active_constituent3; 
               constituent2(75)=1; 
               constituent2(167)=0;
               constituent3 = active_constituent1;
           end
       end
       
         
  elseif act == 5 %look at
            roles = [1 3];  %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
            c = 3; %number of constituents + 1
            pat = randi(20,1);%added the "central agents" as patients
            
            constituent1(16) = 1;
            filler_act(1,1:177)=sem(16).vec;%look at
        
            
                if pat == 1
                    constituent2(54)=1; %
                    filler_pat(1,1:177)=sem(54).vec;
                elseif pat == 2
                    constituent2(55)=1; %
                    filler_pat(1,1:177)=sem(55).vec;
                elseif pat == 3
                    constituent2(56)=1; %
                    filler_pat(1,1:177)=sem(56).vec;
                elseif pat == 4
                    constituent2(57)=1; %
                    filler_pat(1,1:177)=sem(57).vec;
                elseif pat == 5
                    constituent2(58)=1; %
                    filler_pat(1,1:177)=sem(58).vec;
                elseif pat == 6
                    constituent2(59)=1; %
                    filler_pat(1,1:177)=sem(59).vec;
                elseif pat == 7
                    constituent2(60)=1; %
                    filler_pat(1,1:177)=sem(60).vec;
                elseif pat == 8
                    constituent2(61)=1; %
                    filler_pat(1,1:177)=sem(61).vec;
                elseif pat == 9
                    constituent2(62)=1; %
                    filler_pat(1,1:177)=sem(62).vec;
                elseif pat == 10
                    constituent2(66)=1; %
                    filler_pat(1,1:177)=sem(66).vec;
                elseif pat == 11
                    constituent2(67)=1; %
                    filler_pat(1,1:177)=sem(67).vec;
                elseif pat == 12
                    constituent2(68)=1; %
                    filler_pat(1,1:177)=sem(68).vec;
                elseif pat == 13
                    constituent2(5)=1; %
                    filler_pat(1,1:177)=sem(5).vec;
                elseif pat == 14
                    constituent2(34)=1; %
                    filler_pat(1,1:177)=sem(34).vec;
                elseif pat == 15
                    constituent2(95)=1; %
                    filler_pat(1,1:177)=sem(95).vec;
                elseif pat == 16
                    constituent2(104)=1; %
                    filler_pat(1,1:177)=sem(104).vec;
                elseif pat == 17
                    constituent2(113)=1; %
                    filler_pat(1,1:177)=sem(113).vec;
                elseif pat == 18
                    constituent2(122)=1; %
                    filler_pat(1,1:177)=sem(122).vec;
                elseif pat == 19
                    constituent2(131)=1; %
                    filler_pat(1,1:177)=sem(131).vec;
                elseif pat == 20
                    constituent2(140)=1; %
                    filler_pat(1,1:177)=sem(140).vec;
                end

                    
elseif act == 6 %like
            roles = [1 2 3]; %hier am anfang jeder action immer die rollen eintragen, die vorkommen:
                    %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
            c = 4;
            pas = randi(100,1);
            pat = randi(20,1);
            age = randi(8,1); %added the "central patients" as agents
            constituent2(17) = 1;
            filler_act(1,1:177)=sem(17).vec;%like
            
           if age == 1
               constituent1(26)=1;
               filler_age(1,1:177)=sem(26).vec;
           elseif age == 2
               constituent1(52)=1;
               filler_age(1,1:177)=sem(52).vec;
           elseif age == 3
               constituent1(96)=1;
               filler_age(1,1:177)=sem(96).vec;
           elseif age == 4
               constituent1(105)=1;
               filler_age(1,1:177)=sem(105).vec;
           elseif age == 5
               constituent1(114)=1;
               filler_age(1,1:177)=sem(114).vec;
           elseif age == 6
               constituent1(123)=1;
               filler_age(1,1:177)=sem(123).vec;
           elseif age == 7
               constituent1(132)=1;
               filler_age(1,1:177)=sem(132).vec;
           elseif age == 8
               constituent1(141)=1;
               filler_age(1,1:177)=sem(141).vec;
           end
                    
                 if pat == 1
                    constituent3(54)=1; %
                    filler_pat(1,1:177)=sem(54).vec;
                elseif pat == 2
                    constituent3(55)=1; %
                    filler_pat(1,1:177)=sem(55).vec;
                elseif pat == 3
                    constituent3(56)=1; %
                    filler_pat(1,1:177)=sem(56).vec;
                elseif pat == 4
                    constituent3(57)=1; %
                    filler_pat(1,1:177)=sem(57).vec;
                elseif pat == 5
                    constituent3(58)=1; %
                    filler_pat(1,1:177)=sem(58).vec;
                elseif pat == 6
                    constituent3(59)=1; %
                    filler_pat(1,1:177)=sem(59).vec;
                elseif pat == 7
                    constituent3(60)=1; %
                    filler_pat(1,1:177)=sem(60).vec;
                elseif pat == 8
                    constituent3(61)=1; %
                    filler_pat(1,1:177)=sem(61).vec;
                elseif pat == 9
                    constituent3(62)=1; %
                    filler_pat(1,1:177)=sem(62).vec;
                elseif pat == 10
                    constituent3(66)=1; %
                    filler_pat(1,1:177)=sem(66).vec;
                elseif pat == 11
                    constituent3(67)=1; %
                    filler_pat(1,1:177)=sem(67).vec;
                elseif pat == 12
                    constituent3(68)=1; %
                    filler_pat(1,1:177)=sem(68).vec;
                elseif pat == 13
                    constituent3(5)=1; %
                    filler_pat(1,1:177)=sem(5).vec;
                elseif pat == 14
                    constituent3(34)=1; %
                    filler_pat(1,1:177)=sem(34).vec;
                elseif pat == 15
                    constituent3(95)=1; %
                    filler_pat(1,1:177)=sem(95).vec;
                elseif pat == 16
                    constituent3(104)=1; %
                    filler_pat(1,1:177)=sem(104).vec;
                elseif pat == 17
                    constituent3(113)=1; %
                    filler_pat(1,1:177)=sem(113).vec;
                elseif pat == 18
                    constituent3(122)=1; %
                    filler_pat(1,1:177)=sem(122).vec;
                elseif pat == 19
                    constituent3(131)=1; %
                    filler_pat(1,1:177)=sem(131).vec;
                elseif pat == 20
                    constituent3(140)=1; %
                    filler_pat(1,1:177)=sem(140).vec;
                end

                                    
           order_constituent1 = constituent1;
           order_constituent2 = constituent2;
           order_constituent3 = constituent3;
           order_constituent4 = constituent4;
           
           constituent2(167) = 1;
           constituent3 = order_constituent3;
           constituent4 = order_constituent2; 
           c = c+1;
           
      if pas > 70 %30% of sentences are in passive voice -> change word order 
           
           active_constituent1 = constituent1;
           active_constituent2 = constituent2;
           active_constituent3 = constituent3;
           active_constituent4 = constituent4;

           filler_age(1,1)=1;

           constituent1 = active_constituent3; 
           constituent2(75)=1; 
           constituent2(167)=0;
           constituent3 = active_constituent1;
      end
            
elseif act == 7
        roles = [1 2 3]; %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
        pas = randi(100,1); 
        verb = randi(100,1); %adjusted for van Herten simulation
        c = 5;
   
        if age < 61
            filler_age(1,1:177)=sem(5).vec; %poacher is agent
            constituent1(5)=1;%poacher
            
            if pat < 81
                filler_pat(1,1:177)=sem(26).vec;%fox
                constituent3(26) = 1;%fox
            elseif pat > 80 && pat < 101
                filler_pat(1,1:177)=sem(176).vec;%deer
                constituent3(176) = 1;%deer
            end
            
                if verb < 81
                    filler_act(1,1:177)=sem(27).vec;%hunt
                    constituent2(74)=1;%functionword1 op
                    constituent4(27) = 1;%hunt
                elseif verb > 80 && verb < 91
                    filler_act(1,1:177)=sem(28).vec;%approached
                    constituent2(74)=1;%functionword1 op
                    constituent4(28) = 1;
                elseif verb > 90 && verb < 101
                    filler_act(1,1:177)=sem(29).vec;%stood
                    constituent2(76)=1;%functionword2 voor
                    constituent4(29) = 1;
                end
                
        elseif age > 60 && age < 101
            filler_age(1,1:177)=sem(26).vec; %fox
            constituent1(26)=1;%fox
            
            
          if pat < 21
                filler_pat(1,1:177)=sem(34).vec;%chicken
                constituent3(34) = 1;%chicken
                if verb < 41
                filler_act(1,1:177)=sem(27).vec;%hunt
                constituent2(74)=1;%functionword1 op
                constituent4(27) = 1;%hunt
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(28).vec;%approached
                constituent2(74)=1;%functionword1 op
                constituent4(28) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(29).vec;%stood
                constituent2(76)=1;%functionword2 voor
                constituent4(29) = 1;
                end
                
          elseif pat > 20 && pat < 41
                filler_pat(1,1:177)=sem(95).vec;%pat2_one
                constituent3(95) = 1;%pat2_one
                
                if verb < 41
                filler_act(1,1:177)=sem(27).vec;%hunt
                constituent2(74)=1;%functionword1 op
                constituent4(27) = 1;%hunt
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(28).vec;%jump
                constituent2(74)=1;%functionword1 op
                constituent4(28) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(29).vec;%stood
                constituent2(76)=1;%functionword2 voor
                constituent4(29) = 1;
                end
                
          elseif pat > 40 && pat < 61
                filler_pat(1,1:177)=sem(104).vec;%pat2_two
                constituent3(104) = 1;%pat2_two
                if verb < 41
                filler_act(1,1:177)=sem(27).vec;%hunt
                constituent2(74)=1;%functionword1 op
                constituent4(27) = 1;%hunt
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(28).vec;%jump
                constituent2(74)=1;%functionword1 op
                constituent4(28) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(29).vec;%stood
                constituent2(76)=1;%functionword2 voor
                constituent4(29) = 1;
                end
                
          elseif pat > 60 && pat < 81
                filler_pat(1,1:177)=sem(113).vec;%pat2_three
                constituent3(113) = 1;%pat2_three
                if verb < 41
                filler_act(1,1:177)=sem(27).vec;%hunt
                constituent2(74)=1;%functionword1 op
                constituent4(27) = 1;%hunt
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(28).vec;%jump
                constituent2(74)=1;%functionword1 op
                constituent4(28) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(29).vec;%stood
                constituent2(76)=1;%functionword2 voor
                constituent4(29) = 1;
                end
                
          elseif pat > 80 && pat < 101
                constituent3(5) = 1;
                filler_pat(1,1:177)=sem(5).vec;%poacher
                
                if verb < 51
                filler_act(1,1:177)=sem(32).vec;%watch
                constituent2(74)=1;%functionword1 op
                constituent4(32) = 1;
                elseif verb > 50 && verb < 101              
                filler_act(1,1:177)=sem(33).vec;%run
                constituent2(76)=1;%functionword2 voor
                constituent4(33) = 1;
                end
          end
        end
        
        if pas > 70
           active_constituent1 = constituent1;
           active_constituent2 = constituent2;
           active_constituent3 = constituent3;
           active_constituent4 = constituent4;

           filler_age(1,1)=1;

           constituent1 = active_constituent3; 
           constituent2 = zeros(1,179); 
           constituent2(75)=1;
           constituent3 = active_constituent1;
        end
            
    
   
elseif act == 8
        roles = [1 2 3]; %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
        pas = randi(100,1);
        verb = randi(100,1);
        c = 5;
    
        if age < 61
            filler_age(1,1:177)=sem(34).vec; %age_one is agent
            constituent1(34)=1;%age_one
            
            if pat < 81
                filler_pat(1,1:177)=sem(52).vec;%pat_one
                constituent3(52) = 1;%pat_one
            elseif pat > 80 && pat < 101
                filler_pat(1,1:177)=sem(176).vec;%deer_one
                constituent3(176) = 1;%deer_one
            end
            
                if verb < 81
                    filler_act(1,1:177)=sem(53).vec;%act_one
                    constituent2(74)=1;%functionword1 op
                    constituent4(53) = 1;%act_one
                elseif verb > 80 && verb < 91
                    filler_act(1,1:177)=sem(32).vec;%watch
                    constituent2(74)=1;%functionword1 op
                    constituent4(32) = 1;
                elseif verb > 90 && verb < 101
                    filler_act(1,1:177)=sem(33).vec;%run
                    constituent2(76)=1;%functionword2 voor
                    constituent4(33) = 1;
                end
                
        elseif age > 60 && age < 101
            filler_age(1,1:177)=sem(52).vec; %pat_one
            constituent1(52)=1;%pat_one
            
            
          if pat < 21
                filler_pat(1,1:177)=sem(5).vec;%pat2_one
                constituent3(5) = 1;%pat2_one
                
                if verb < 41
                filler_act(1,1:177)=sem(53).vec;%act_one
                constituent2(74)=1;%functionword1 op
                constituent4(53) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(32).vec;%watch
                constituent2(74)=1;%functionword1 op
                constituent4(32) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(33).vec;%run
                constituent2(76)=1;%functionword2 voor
                constituent4(33) = 1;
                end
                
          elseif pat > 20 && pat < 41
                filler_pat(1,1:177)=sem(95).vec;%pat2_one
                constituent3(95) = 1;%pat2_one
                
                if verb < 41
                filler_act(1,1:177)=sem(53).vec;%act_one
                constituent2(74)=1;%functionword1 op
                constituent4(53) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(32).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(32) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(33).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(33) = 1;
                end
                
          elseif pat > 40 && pat < 61
                filler_pat(1,1:177)=sem(104).vec;%pat2_two
                constituent3(104) = 1;%pat2_two
                
                if verb < 41
                filler_act(1,1:177)=sem(53).vec;%act_one
                constituent2(74)=1;%functionword1 op
                constituent4(53) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(32).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(32) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(33).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(33) = 1;
                end
                
          elseif pat > 60 && pat < 81
                filler_pat(1,1:177)=sem(122).vec;%pat2_three
                constituent3(122) = 1;%pat2_three
                
                if verb < 41
                filler_act(1,1:177)=sem(53).vec;%act_one
                constituent2(74)=1;%functionword1 op
                constituent4(53) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(32).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(32) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(33).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(33) = 1;
                end
                
          elseif pat > 80 && pat < 101
                constituent3(34) = 1;
                filler_pat(1,1:177)=sem(34).vec;%poacher
                
                if verb < 51
                filler_act(1,1:177)=sem(28).vec;%approach
                constituent2(74)=1;%functionword1 op
                constituent4(28) = 1;
                elseif verb > 50 && verb < 101              
                filler_act(1,1:177)=sem(29).vec;%stand
                constituent2(76)=1;%functionword2 voor
                constituent4(29) = 1;
                end
          end
        end
        
        if pas > 70
           active_constituent1 = constituent1;
           active_constituent2 = constituent2;
           active_constituent3 = constituent3;
           active_constituent4 = constituent4;

           filler_age(1,1)=1;

           constituent1 = active_constituent3; 
           constituent2 = zeros(1,179); 
           constituent2(75)=1;
           constituent3 = active_constituent1;
        end
        

    
elseif act == 9
        roles = [1 2 3]; %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
        pas = randi(100,1);
        verb = randi(100,1); 
        c = 5;
    
        if age < 61
            filler_age(1,1:177)=sem(95).vec; %age_one is agent
            constituent1(95)=1;%age_one
            
            if pat < 81
                filler_pat(1,1:177)=sem(96).vec;%pat_one
                constituent3(96) = 1;%pat_one
            elseif pat > 80 && pat < 101
                filler_pat(1,1:177)=sem(177).vec;%deer_one
                constituent3(177) = 1;%deer_one
            end
            
                if verb < 81
                    filler_act(1,1:177)=sem(97).vec;%act_one
                    constituent2(74)=1;%functionword1 op
                    constituent4(97) = 1;%act_one
                elseif verb > 80 && verb < 91
                    filler_act(1,1:177)=sem(28).vec;%approach
                    constituent2(74)=1;%functionword1 op
                    constituent4(28) = 1;
                elseif verb > 90 && verb < 101
                    filler_act(1,1:177)=sem(33).vec;%act3_one
                    constituent2(76)=1;%functionword2 voor
                    constituent4(33) = 1;
                end
                
        elseif age > 60 && age < 101
            filler_age(1,1:177)=sem(96).vec; %pat_one
            constituent1(96)=1;%pat_one
            
            
          if pat < 21
                filler_pat(1,1:177)=sem(5).vec;%pat2_one
                constituent3(5) = 1;%pat2_one
                
                if verb < 41
                filler_act(1,1:177)=sem(97).vec;%act_one
                constituent2(74)=1;%functionword1 op
                constituent4(97) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(28).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(28) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(33).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(33) = 1;
                end
                
          elseif pat > 20 && pat < 41
                filler_pat(1,1:177)=sem(34).vec;%pat2_one
                constituent3(34) = 1;%pat2_one
                
                if verb < 41
                filler_act(1,1:177)=sem(97).vec;%act_one
                constituent2(74)=1;%functionword1 op
                constituent4(97) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(28).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(28) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(33).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(33) = 1;
                end
                
          elseif pat > 40 && pat < 61
                filler_pat(1,1:177)=sem(104).vec;%pat2_two
                constituent3(104) = 1;%pat2_two
                
                if verb < 41
                filler_act(1,1:177)=sem(97).vec;%act_one
                constituent2(74)=1;%functionword1 op
                constituent4(97) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(28).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(28) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(33).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(33) = 1;
                end
                
          elseif pat > 60 && pat < 81
                filler_pat(1,1:177)=sem(131).vec;%pat2_three
                constituent3(131) = 1;%pat2_three
                
                if verb < 41
                filler_act(1,1:177)=sem(97).vec;%act_one
                constituent2(74)=1;%functionword1 op
                constituent4(97) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(28).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(28) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(33).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(33) = 1;
                end
                
          elseif pat > 80 && pat < 101
                constituent3(95) = 1;
                filler_pat(1,1:177)=sem(95).vec;%poacher
                
                if verb < 51
                filler_act(1,1:177)=sem(32).vec;%watch
                constituent2(74)=1;%functionword1 op
                constituent4(32) = 1;
                elseif verb > 50 && verb < 101              
                filler_act(1,1:177)=sem(29).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(29) = 1;
                end
          end
        end
        
        if pas > 70
           active_constituent1 = constituent1;
           active_constituent2 = constituent2;
           active_constituent3 = constituent3;
           active_constituent4 = constituent4;

           filler_age(1,1)=1;

           constituent1 = active_constituent3; 
           constituent2 = zeros(1,179); 
           constituent2(75)=1;
           constituent3 = active_constituent1;
        end  
   
   elseif act == 10
       roles = [1 2 3];  %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
        pas = randi(100,1);
        verb = randi(100,1); 
        c = 5;
    
        if age < 61
            filler_age(1,1:177)=sem(104).vec; %age_one is agent
            constituent1(104)=1;%age_one
            
            if pat < 81
                filler_pat(1,1:177)=sem(105).vec;%pat_one
                constituent3(105) = 1;%pat_one
            elseif pat > 80 && pat < 101
                filler_pat(1,1:177)=sem(177).vec;%deer_one
                constituent3(177) = 1;%deer_one
            end
            
                if verb < 81
                    filler_act(1,1:177)=sem(106).vec;%act_one
                    constituent2(74)=1;%functionword1 op
                    constituent4(106) = 1;%act_one
                elseif verb > 80 && verb < 91
                    filler_act(1,1:177)=sem(32).vec;%watch
                    constituent2(74)=1;%functionword1 op
                    constituent4(32) = 1;
                elseif verb > 90 && verb < 101
                    filler_act(1,1:177)=sem(29).vec;%stand
                    constituent2(76)=1;%functionword2 voor
                    constituent4(29) = 1;
                end
                
        elseif age > 60 && age < 101
            filler_age(1,1:177)=sem(105).vec; %pat_one
            constituent1(105)=1;%pat_one
            
            
          if pat < 21
                filler_pat(1,1:177)=sem(5).vec;%pat2_one
                constituent3(5) = 1;%pat2_one
                
                if verb < 41
                filler_act(1,1:177)=sem(106).vec;%act_one
                constituent2(74)=1;%functionword1 op
                constituent4(106) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(32).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(32) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(29).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(29) = 1;
                end
                
          elseif pat > 20 && pat < 41
                filler_pat(1,1:177)=sem(34).vec;%pat2_one
                constituent3(34) = 1;%pat2_one
                
                if verb < 41
                filler_act(1,1:177)=sem(106).vec;%act_one
                constituent2(74)=1;%functionword1 op
                constituent4(106) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(32).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(32) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(29).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(29) = 1;
                end
                
          elseif pat > 40 && pat < 61
                filler_pat(1,1:177)=sem(95).vec;%pat2_two
                constituent3(95) = 1;%pat2_two
                
                if verb < 41
                filler_act(1,1:177)=sem(106).vec;%act_one
                constituent2(74)=1;%functionword1 op
                constituent4(106) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(32).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(32) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(29).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(29) = 1;
                end
                
          elseif pat > 60 && pat < 81
                filler_pat(1,1:177)=sem(140).vec;%pat2_three
                constituent3(140) = 1;%pat2_three
                
                if verb < 41
                filler_act(1,1:177)=sem(106).vec;%act_one
                constituent2(74)=1;%functionword1 op
                constituent4(106) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(32).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(32) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(29).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(29) = 1;
                end
                
          elseif pat > 80 && pat < 101
                constituent3(104) = 1;
                filler_pat(1,1:177)=sem(104).vec;%poacher
                
                if verb < 51
                filler_act(1,1:177)=sem(28).vec;%act5_one
                constituent2(74)=1;%functionword1 op
                constituent4(28) = 1;
                elseif verb > 50 && verb < 101              
                filler_act(1,1:177)=sem(33).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(33) = 1;
                end
          end
        end
        
        if pas > 70
           active_constituent1 = constituent1;
           active_constituent2 = constituent2;
           active_constituent3 = constituent3;
           active_constituent4 = constituent4;

           filler_age(1,1)=1;

           constituent1 = active_constituent3; 
           constituent2 = zeros(1,179); 
           constituent2(75)=1;
           constituent3 = active_constituent1;
        end
        

   
elseif act == 11
        roles = [1 2 3];  %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
        pas = randi(100,1);
        verb = randi(100,1); 
        c = 5;
    
        if age < 61
            filler_age(1,1:177)=sem(113).vec; %age_one is agent
            constituent1(113)=1;%age_one
            
            if pat < 81
                filler_pat(1,1:177)=sem(114).vec;%pat_one
                constituent3(114) = 1;%pat_one
            elseif pat > 80 && pat < 101
                filler_pat(1,1:177)=sem(178).vec;%deer_one
                constituent3(178) = 1;%deer_one
            end
            
                if verb < 81
                    filler_act(1,1:177)=sem(115).vec;%act_one
                    constituent2(76)=1;%functionword1 op
                    constituent4(115) = 1;%act_one
                elseif verb > 80 && verb < 91
                    filler_act(1,1:177)=sem(28).vec;%act2_one
                    constituent2(74)=1;%functionword1 op
                    constituent4(28) = 1;
                elseif verb > 90 && verb < 101
                    filler_act(1,1:177)=sem(29).vec;%act3_one
                    constituent2(76)=1;%functionword2 voor
                    constituent4(29) = 1;
                end
                
        elseif age > 60 && age < 101
            filler_age(1,1:177)=sem(114).vec; %pat_one
            constituent1(114)=1;%pat_one
            
            
          if pat < 21
                filler_pat(1,1:177)=sem(122).vec;%pat2_one
                constituent3(122) = 1;%pat2_one
                
                if verb < 41
                filler_act(1,1:177)=sem(115).vec;%act_one
                constituent2(76)=1;%functionword1 op
                constituent4(115) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(28).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(28) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(29).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(29) = 1;
                end
                
          elseif pat > 20 && pat < 41
                filler_pat(1,1:177)=sem(131).vec;%pat2_one
                constituent3(131) = 1;%pat2_one
                
                if verb < 41
                filler_act(1,1:177)=sem(115).vec;%act_one
                constituent2(76)=1;%functionword1 op
                constituent4(115) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(28).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(28) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(29).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(29) = 1;
                end
                
          elseif pat > 40 && pat < 61
                filler_pat(1,1:177)=sem(140).vec;%pat2_two
                constituent3(140) = 1;%pat2_two
                
                if verb < 41
                filler_act(1,1:177)=sem(115).vec;%act_one
                constituent2(76)=1;%functionword1 op
                constituent4(115) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(28).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(28) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(29).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(29) = 1;
                end
                
          elseif pat > 60 && pat < 81
                filler_pat(1,1:177)=sem(5).vec;%pat2_three
                constituent3(5) = 1;%pat2_three
                
                if verb < 41
                filler_act(1,1:177)=sem(115).vec;%act_one
                constituent2(76)=1;%functionword1 op
                constituent4(115) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(28).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(28) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(29).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(29) = 1;
                end
                
          elseif pat > 80 && pat < 101
                constituent3(113) = 1;
                filler_pat(1,1:177)=sem(113).vec;%poacher
                
                if verb < 51
                filler_act(1,1:177)=sem(32).vec;%act5_one
                constituent2(74)=1;%functionword1 op
                constituent4(32) = 1;
                elseif verb > 50 && verb < 101              
                filler_act(1,1:177)=sem(33).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(33) = 1;
                end
          end
        end
        
        if pas > 70
           active_constituent1 = constituent1;
           active_constituent2 = constituent2;
           active_constituent3 = constituent3;
           active_constituent4 = constituent4;

           filler_age(1,1)=1;

           constituent1 = active_constituent3; 
           constituent2 = zeros(1,179); 
           constituent2(75)=1;
           constituent3 = active_constituent1;
        end


    
   elseif act == 12
        roles = [1 2 3]; %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
        pas = randi(100,1);
        verb = randi(100,1); 
        c = 5;
    
        if age < 61
            filler_age(1,1:177)=sem(122).vec; %age_one is agent
            constituent1(122)=1;%age_one
            
            if pat < 81
                filler_pat(1,1:177)=sem(123).vec;%pat_one
                constituent3(123) = 1;%pat_one
            elseif pat > 80 && pat < 101
                filler_pat(1,1:177)=sem(178).vec;%deer_one
                constituent3(178) = 1;%deer_one
            end
            
                if verb < 81
                    filler_act(1,1:177)=sem(124).vec;%act_one
                    constituent2(76)=1;%functionword1 op
                    constituent4(124) = 1;%act_one
                elseif verb > 80 && verb < 91
                    filler_act(1,1:177)=sem(32).vec;%act2_one
                    constituent2(74)=1;%functionword1 op
                    constituent4(32) = 1;
                elseif verb > 90 && verb < 101
                    filler_act(1,1:177)=sem(33).vec;%act3_one
                    constituent2(76)=1;%functionword2 voor
                    constituent4(33) = 1;
                end
                
        elseif age > 60 && age < 101
            filler_age(1,1:177)=sem(123).vec; %pat_one
            constituent1(123)=1;%pat_one
            
            
          if pat < 21
                filler_pat(1,1:177)=sem(113).vec;%pat2_one
                constituent3(113) = 1;%pat2_one
                
                if verb < 41
                filler_act(1,1:177)=sem(124).vec;%act_one
                constituent2(76)=1;%functionword1 op
                constituent4(124) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(32).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(32) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(33).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(33) = 1;
                end
                
          elseif pat > 20 && pat < 41
                filler_pat(1,1:177)=sem(131).vec;%pat2_one
                constituent3(131) = 1;%pat2_one
                
                if verb < 41
                filler_act(1,1:177)=sem(124).vec;%act_one
                constituent2(76)=1;%functionword1 op
                constituent4(124) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(32).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(32) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(33).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(33) = 1;
                end
                
          elseif pat > 40 && pat < 61
                filler_pat(1,1:177)=sem(140).vec;%pat2_two
                constituent3(140) = 1;%pat2_two
                
                if verb < 41
                filler_act(1,1:177)=sem(124).vec;%act_one
                constituent2(76)=1;%functionword1 op
                constituent4(124) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(32).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(32) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(33).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(33) = 1;
                end
                
          elseif pat > 60 && pat < 81
                filler_pat(1,1:177)=sem(34).vec;%pat2_three
                constituent3(34) = 1;%pat2_three
                
                if verb < 41
                filler_act(1,1:177)=sem(124).vec;%act_one
                constituent2(76)=1;%functionword1 op
                constituent4(124) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(32).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(32) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(33).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(33) = 1;
                end
                
          elseif pat > 80 && pat < 101
                constituent3(122) = 1;
                filler_pat(1,1:177)=sem(122).vec;%poacher
                
                if verb < 51
                filler_act(1,1:177)=sem(28).vec;%act5_one
                constituent2(74)=1;%functionword1 op
                constituent4(28) = 1;
                elseif verb > 50 && verb < 101              
                filler_act(1,1:177)=sem(29).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(29) = 1;
                end
          end
        end
        
        if pas > 70
           active_constituent1 = constituent1;
           active_constituent2 = constituent2;
           active_constituent3 = constituent3;
           active_constituent4 = constituent4;

           filler_age(1,1)=1;

           constituent1 = active_constituent3; 
           constituent2 = zeros(1,179); 
           constituent2(75)=1;
           constituent3 = active_constituent1;
        end
   
   
elseif act == 13
        roles = [1 2 3]; %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
        pas = randi(100,1);
        verb = randi(100,1); 
        c = 5;
    
        if age < 61
            filler_age(1,1:177)=sem(131).vec; %age_one is agent
            constituent1(131)=1;%age_one
            
            if pat < 81
                filler_pat(1,1:177)=sem(132).vec;%pat_one
                constituent3(132) = 1;%pat_one
            elseif pat > 80 && pat < 101
                filler_pat(1,1:177)=sem(179).vec;%deer_one
                constituent3(179) = 1;%deer_one
            end
            
                if verb < 81
                    filler_act(1,1:177)=sem(133).vec;%act_one
                    constituent2(76)=1;%functionword1 op
                    constituent4(133) = 1;%act_one
                elseif verb > 80 && verb < 91
                    filler_act(1,1:177)=sem(28).vec;%act2_one
                    constituent2(74)=1;%functionword1 op
                    constituent4(28) = 1;
                elseif verb > 90 && verb < 101
                    filler_act(1,1:177)=sem(33).vec;%act3_one
                    constituent2(76)=1;%functionword2 voor
                    constituent4(33) = 1;
                end
                
        elseif age > 60 && age < 101
            filler_age(1,1:177)=sem(132).vec; %pat_one
            constituent1(132)=1;%pat_one
            
            
          if pat < 21
                filler_pat(1,1:177)=sem(113).vec;%pat2_one
                constituent3(113) = 1;%pat2_one
                
                if verb < 41
                filler_act(1,1:177)=sem(133).vec;%act_one
                constituent2(76)=1;%functionword1 op
                constituent4(133) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(28).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(28) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(33).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(33) = 1;
                end
                
          elseif pat > 20 && pat < 41
                filler_pat(1,1:177)=sem(122).vec;%pat2_one
                constituent3(122) = 1;%pat2_one
                
                if verb < 41
                filler_act(1,1:177)=sem(133).vec;%act_one
                constituent2(76)=1;%functionword1 op
                constituent4(133) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(28).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(28) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(33).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(33) = 1;
                end
                
          elseif pat > 40 && pat < 61
                filler_pat(1,1:177)=sem(140).vec;%pat2_two
                constituent3(140) = 1;%pat2_two
                
                if verb < 41
                filler_act(1,1:177)=sem(133).vec;%act_one
                constituent2(76)=1;%functionword1 op
                constituent4(133) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(28).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(28) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(33).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(33) = 1;
                end
                
          elseif pat > 60 && pat < 81
                filler_pat(1,1:177)=sem(95).vec;%pat2_three
                constituent3(95) = 1;%pat2_three
                
                if verb < 41
                filler_act(1,1:177)=sem(133).vec;%act_one
                constituent2(76)=1;%functionword1 op
                constituent4(133) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(28).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(28) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(33).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(33) = 1;
                end
                
          elseif pat > 80 && pat < 101
                constituent3(131) = 1;
                filler_pat(1,1:177)=sem(131).vec;%poacher
                
                if verb < 51
                filler_act(1,1:177)=sem(32).vec;%act5_one
                constituent2(74)=1;%functionword1 op
                constituent4(32) = 1;
                elseif verb > 50 && verb < 101              
                filler_act(1,1:177)=sem(29).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(29) = 1;
                end
          end
        end
        
        if pas > 70
           active_constituent1 = constituent1;
           active_constituent2 = constituent2;
           active_constituent3 = constituent3;
           active_constituent4 = constituent4;

           filler_age(1,1)=1;

           constituent1 = active_constituent3; 
           constituent2 = zeros(1,179); 
           constituent2(75)=1;
           constituent3 = active_constituent1;
        end
    
   
 elseif act == 14
        roles = [1 2 3];  %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
        pas = randi(100,1);
        verb = randi(100,1); 
        c = 5;
    
        if age < 61
            filler_age(1,1:177)=sem(140).vec; %age_one is agent
            constituent1(140)=1;%age_one
            
            if pat < 81
                filler_pat(1,1:177)=sem(141).vec;%pat_one
                constituent3(141) = 1;%pat_one
            elseif pat > 80 && pat < 101
                filler_pat(1,1:177)=sem(179).vec;%deer_one
                constituent3(179) = 1;%deer_one
            end
            
                if verb < 81
                    filler_act(1,1:177)=sem(142).vec;%act_one
                    constituent2(76)=1;%functionword1 op
                    constituent4(142) = 1;%act_one
                elseif verb > 80 && verb < 91
                    filler_act(1,1:177)=sem(32).vec;%act2_one
                    constituent2(74)=1;%functionword1 op
                    constituent4(32) = 1;
                elseif verb > 90 && verb < 101
                    filler_act(1,1:177)=sem(29).vec;%act3_one
                    constituent2(76)=1;%functionword2 voor
                    constituent4(29) = 1;
                end
                
        elseif age > 60 && age < 101
            filler_age(1,1:177)=sem(141).vec; %pat_one
            constituent1(141)=1;%pat_one
            
            
          if pat < 21
                filler_pat(1,1:177)=sem(113).vec;%pat2_one
                constituent3(113) = 1;%pat2_one
                
                if verb < 41
                filler_act(1,1:177)=sem(142).vec;%act_one
                constituent2(76)=1;%functionword1 op
                constituent4(142) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(32).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(32) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(29).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(29) = 1;
                end
                
          elseif pat > 20 && pat < 41
                filler_pat(1,1:177)=sem(122).vec;%pat2_one
                constituent3(122) = 1;%pat2_one
                
                if verb < 41
                filler_act(1,1:177)=sem(142).vec;%act_one
                constituent2(76)=1;%functionword1 op
                constituent4(142) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(32).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(32) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(29).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(29) = 1;
                end
                
          elseif pat > 40 && pat < 61
                filler_pat(1,1:177)=sem(131).vec;%pat2_two
                constituent3(131) = 1;%pat2_two
                
                if verb < 41
                filler_act(1,1:177)=sem(142).vec;%act_one
                constituent2(76)=1;%functionword1 op
                constituent4(142) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(32).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(32) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(29).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(29) = 1;
                end
                
          elseif pat > 60 && pat < 81
                filler_pat(1,1:177)=sem(104).vec;%pat2_three
                constituent3(104) = 1;%pat2_three
                
                if verb < 41
                filler_act(1,1:177)=sem(142).vec;%act_one
                constituent2(76)=1;%functionword1 op
                constituent4(142) = 1;%act_one
                elseif verb > 40 && verb < 71
                filler_act(1,1:177)=sem(32).vec;%act4_one
                constituent2(74)=1;%functionword1 op
                constituent4(32) = 1;
                elseif verb > 70 && verb < 101
                filler_act(1,1:177)=sem(29).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(29) = 1;
                end
                
          elseif pat > 80 && pat < 101
                constituent3(140) = 1;
                filler_pat(1,1:177)=sem(140).vec;%poacher
                
                if verb < 51
                filler_act(1,1:177)=sem(28).vec;%act5_one
                constituent2(74)=1;%functionword1 op
                constituent4(28) = 1;
                elseif verb > 50 && verb < 101              
                filler_act(1,1:177)=sem(33).vec;%act6_one
                constituent2(76)=1;%functionword2 voor
                constituent4(33) = 1;
                end
          end
        end
        
        if pas > 70
           active_constituent1 = constituent1;
           active_constituent2 = constituent2;
           active_constituent3 = constituent3;
           active_constituent4 = constituent4;

           filler_age(1,1)=1;

           constituent1 = active_constituent3; 
           constituent2 = zeros(1,179); 
           constituent2(75)=1;
           constituent3 = active_constituent1;
        end
end
    

role_filler_act= horzcat(filler_act(1,1:177),role_act(1,178:182));
role_filler_age= horzcat(filler_age(1,1:177),role_age(1,178:182));
role_filler_pat= horzcat(filler_pat(1,1:177),role_pat(1,178:182));
role_filler_loc= horzcat(filler_loc(1,1:177),role_loc(1,178:182));
role_filler_sit= horzcat(filler_sit(1,1:177),role_sit(1,178:182));

        
c = c - 1; 

%print sequence of constituents
ID = fopen ('sentence_foxAndPoacher.pat','w'); 
fprintf(ID,'sen1');

fprintf(ID,'\n\t');
fprintf(ID,' %d',constituent1);

if c > 1
fprintf(ID,'\n\t');
fprintf(ID,' %d',constituent2);
end

if c > 2
fprintf(ID,'\n\t');
fprintf(ID,' %d',constituent3);
end

if c > 3
fprintf(ID,'\n\t');
fprintf(ID,' %d',constituent4);
end

if c > 4
fprintf(ID,'\n\t');
fprintf(ID,' %d',constituent5);
end

if c > 5
fprintf(ID,'\n\t');
fprintf(ID,' %d',constituent6); 
end

fprintf(ID,'\nend\n');
fclose(ID);

%print role filler probes and output
ID2 = fopen('roleFiller_foxAndPoacher.pat','w');

%fillers
fprintf(ID2,'\t');
fprintf(ID2,' %d',filler_act);
fprintf(ID2,' |');
fprintf(ID2,' %d',role_filler_act);

if find(roles == 2) > 0
fprintf(ID2,'\n\t');
fprintf(ID2,' %d',filler_age);
fprintf(ID2,' |');
fprintf(ID2,' %d',role_filler_age); 
end

if find(roles == 3) > 0
fprintf(ID2,'\n\t');
fprintf(ID2,' %d',filler_pat);
fprintf(ID2,' |');
fprintf(ID2,' %d',role_filler_pat);
end

if find(roles == 4) > 0
fprintf(ID2,'\n\t');
fprintf(ID2,' %d',filler_loc);
fprintf(ID2,' |');
fprintf(ID2,' %d',role_filler_loc);
end

if find(roles == 5) > 0
fprintf(ID2,'\n\t');
fprintf(ID2,' %d',filler_sit);
fprintf(ID2,' |');
fprintf(ID2,' %d',role_filler_sit);
end

%roles

fprintf(ID2,'\n\t');
fprintf(ID2,' %d',role_act);
fprintf(ID2,' |');
fprintf(ID2,' %d',role_filler_act);

if find(roles == 2) > 0
fprintf(ID2,'\n\t');
fprintf(ID2,' %d',role_age);
fprintf(ID2,' |');
fprintf(ID2,' %d',role_filler_age);
end

if find(roles == 3) > 0
fprintf(ID2,'\n\t');
fprintf(ID2,' %d',role_pat);
fprintf(ID2,' |');
fprintf(ID2,' %d',role_filler_pat);
end

if find(roles == 4) > 0
fprintf(ID2,'\n\t');
fprintf(ID2,' %d',role_loc);
fprintf(ID2,' |');
fprintf(ID2,' %d',role_filler_loc);
end

if find(roles == 5) > 0
fprintf(ID2,'\n\t');
fprintf(ID2,' %d',role_sit);
fprintf(ID2,' |');
fprintf(ID2,' %d',role_filler_sit);
end

fprintf(ID2,'\n');
fclose(ID2);
