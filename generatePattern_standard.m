%generates training pattern (sentences and role filler pairs of described events) for SG model training

constituent1 = zeros(1,89); 
constituent2 = zeros(1,89);
constituent3 = zeros(1,89);
constituent4 = zeros(1,89);
constituent5 = zeros(1,89);
constituent6 = zeros(1,89);
constituent7 = zeros(1,89);


role_act        = zeros(1,176); 
role_act(1,172) = 1;
role_age        = zeros(1,176);
role_age(1,173) = 1;
role_pat        = zeros(1,176);
role_pat(1,174) = 1;
role_loc        = zeros(1,176);
role_loc(1,175) = 1;
role_sit        = zeros(1,176);
role_sit(1,176) = 1;

filler_act    = zeros(1,176);
filler_age    = zeros(1,176);
filler_pat    = zeros(1,176);
filler_loc    = zeros(1,176);
filler_sit    = zeros(1,176);

role_filler_act   = zeros(1,176);
role_filler_age   = zeros(1,176);
role_filler_pat   = zeros(1,176);
role_filler_loc   = zeros(1,176);
role_filler_sit   = zeros(1,176);


loc_c = 1; 
sit = 0; 
sit_c = 0;
ins_c = 2; 
cop_c = 2;
pas = 0;
       
       
if act == 1 %"wear"
    roles = [1 2 3]; %which roles are presented with this action? 1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
    c = 4; % number of constituents +1
    
   constituent2(13) = 1;
   filler_act(1,1:171)=sem(13).vec;%wear

    if age < 41 %choose agent
        
        constituent1(2) = 1;
        filler_age(1,1:171)=sem(2).vec;%he
              
            if pat > 70
                constituent3(49) = 1;
                filler_pat(1,1:171)=sem(49).vec;%jeans           
            elseif pat < 71
                constituent3(50) = 1;
                filler_pat(1,1:171)=sem(50).vec;%shirt              
            end
                    
    elseif (age > 40) && (age < 81) 
        constituent1(1) = 1;
        filler_age(1,1:171)=sem(1).vec;%she
        
            if pat < 71        
                constituent3(50) = 1;
                filler_pat(1,1:171)=sem(50).vec;%shirt             
            elseif pat > 70
                constituent3(49) = 1;
                filler_pat(1,1:171)=sem(49).vec;%jeans                
            end
            
    elseif (age > 80) && (age < 91) 
        constituent1(3) = 1;
        filler_age(1,1:171)=sem(3).vec;%girl
        
            if pat < 61        
                constituent3(50) = 1;
                filler_pat(1,1:171)=sem(50).vec;%shirt              
            elseif pat > 60
                constituent3(49) = 1;
                filler_pat(1,1:171)=sem(49).vec;%jeans                
            end
            
            
    elseif (age > 90) && (age < 101) 
        constituent1(4) = 1;
        filler_age(1,1:171)=sem(4).vec;%boy
        
            if pat > 60        
                constituent3(49) = 1;
                filler_pat(1,1:171)=sem(49).vec;%jeans              
            elseif pat < 61
                constituent3(50) = 1;
                filler_pat(1,1:171)=sem(50).vec;%shirt               
            end
    
    end
 

elseif act == 2; %eat
       roles = [1 2 3 4 5]; %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
       c = 1; %initialize constituent counter
       sit = randi(2,1); %dinner or breakfast? 
       sit_c = randi(2,1);%present "situation"constituent?
       pas = randi(100,1);%passive?
       
       if sit == 1
           filler_sit(1,1:171)=sem(22).vec;%breakfast
           if sit_c == 1
               constituent1(22) = 1; 
               constituent1(72) = 1; %during
               c = c + 1;
           end
           
           if age < 41 
              filler_age(1,1:171)=sem(2).vec;%man
              if c == 1
                  constituent1(2)=1;
              elseif c == 2
                  constituent2(2)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(7).vec;%eat 
                        if c == 2            
                            constituent2(7)=1;
                        elseif c == 3
                            constituent3(7)=1;
                        end
                        c = c+1;
                 
                                if pat< 71 
                                   filler_pat(1,1:171)=sem(36).vec;%eggs
                                   if c == 3            
                                        constituent3(36)=1;
                                    elseif c == 4
                                        constituent4(36)=1;
                                   end
                                    c = c+1;

                                        filler_loc(1,1:171)=sem(18).vec;%kitchen 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(18)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(18)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(18)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end

                                    
                                elseif pat > 70 
                                filler_pat(1,1:171)=sem(37).vec;%toast                 
                                if c == 3            
                                    constituent3(37)=1;
                                elseif c == 4
                                    constituent4(37)=1;
                                end
                                c = c+1; 


                                        filler_loc(1,1:171)=sem(79).vec;%balkony 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(79)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(79)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(79)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end
                                end
              
           elseif (age > 40)&&(age < 81)
              filler_age(1,1:171)=sem(1).vec;%woman
              if c == 1
                  constituent1(1)=1;
              elseif c == 2
                  constituent2(1)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(7).vec;%eat 
                        if c == 2            
                            constituent2(7)=1;
                        elseif c == 3
                            constituent3(7)=1;
                        end
                        c = c+1;
                 
                                if pat< 71 
                                   filler_pat(1,1:171)=sem(36).vec;%eggs
                                   if c == 3            
                                        constituent3(36)=1;
                                    elseif c == 4
                                        constituent4(36)=1;
                                   end
                                    c = c+1;

                                        filler_loc(1,1:171)=sem(18).vec;%kitchen 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(18)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(18)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(18)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end
                                    
                                elseif pat > 70 
                                filler_pat(1,1:171)=sem(37).vec;%toast                 
                                if c == 3            
                                    constituent3(37)=1;
                                elseif c == 4
                                    constituent4(37)=1;
                                end
                                c = c+1; 

                                        filler_loc(1,1:171)=sem(79).vec;%balkony 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(79)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(79)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(79)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end
                                end
          
              
           elseif (age > 80)&&(age < 91)
              filler_age(1,1:171)=sem(3).vec;%girl
              if c == 1
                  constituent1(3)=1;
              elseif c == 2
                  constituent2(3)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(7).vec;%eat 
                        if c == 2            
                            constituent2(7)=1;
                        elseif c == 3
                            constituent3(7)=1;
                        end
                        c = c+1;
                 
                                if pat< 61 
                                   filler_pat(1,1:171)=sem(36).vec;%eggs
                                   if c == 3            
                                        constituent3(36)=1;
                                    elseif c == 4
                                        constituent4(36)=1;
                                   end
                                    c = c+1;

                                        filler_loc(1,1:171)=sem(18).vec;%kitchen 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(18)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(18)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(18)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end
                                    
                                elseif pat > 60 
                                filler_pat(1,1:171)=sem(37).vec;%toast                 
                                if c == 3            
                                    constituent3(37)=1;
                                elseif c == 4
                                    constituent4(37)=1;
                                end
                                c = c+1; 

                                        filler_loc(1,1:171)=sem(79).vec;%balkony 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(79)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(79)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(79)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end
                                end
           elseif age > 90 
              filler_age(1,1:171)=sem(4).vec;%boy
              if c == 1
                  constituent1(4)=1;
              elseif c == 2
                  constituent2(4)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(7).vec;%eat 
                        if c == 2            
                            constituent2(7)=1;
                        elseif c == 3
                            constituent3(7)=1;
                        end
                        c = c+1;
                 
                                if pat< 61 
                                   filler_pat(1,1:171)=sem(36).vec;%eggs
                                   if c == 3            
                                        constituent3(36)=1;
                                    elseif c == 4
                                        constituent4(36)=1;
                                   end
                                    c = c+1;
   
                                        filler_loc(1,1:171)=sem(18).vec;%kitchen 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(18)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(18)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(18)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end

                                    
                                elseif pat > 60 
                                filler_pat(1,1:171)=sem(37).vec;%toast                 
                                if c == 3            
                                    constituent3(37)=1;
                                elseif c == 4
                                    constituent4(37)=1;
                                end
                                c = c+1; 

                                        filler_loc(1,1:171)=sem(79).vec;%balkony 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(79)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(79)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(79)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end
                                end           
           end
        
       elseif sit == 2
           filler_sit(1,1:171)=sem(23).vec;%dinner
           if sit_c == 1
               constituent1(23) = 1;
               constituent1(72) = 1;%during
               c = c + 1;
           end

           if age < 41 
              filler_age(1,1:171)=sem(2).vec;%man
              if c == 1
                  constituent1(2)=1;
              elseif c == 2
                  constituent2(2)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(7).vec;%eat 
                        if c == 2            
                            constituent2(7)=1;
                        elseif c == 3
                            constituent3(7)=1;
                        end
                        c = c+1;
                 
                                if pat< 71 
                                   filler_pat(1,1:171)=sem(39).vec;%pizza
                                   if c == 3           
                                        constituent3(39)=1;
                                    elseif c == 4
                                        constituent4(39)=1;
                                   end
                                    c = c+1;

                                        filler_loc(1,1:171)=sem(18).vec;%kitchen 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(18)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(18)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(18)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end

                                elseif pat > 70 
                                filler_pat(1,1:171)=sem(38).vec;%soup                 
                                if c == 3            
                                    constituent3(38)=1;
                                elseif c == 4
                                    constituent4(38)=1;
                                end
                                c = c+1; 

                                        filler_loc(1,1:171)=sem(79).vec;%balkony 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(79)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(79)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(79)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end
                                end
              
           elseif (age > 40)&&(age < 81)
              filler_age(1,1:171)=sem(1).vec;%woman
              if c == 1
                  constituent1(1)=1;
              elseif c == 2
                  constituent2(1)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(7).vec;%eat 
                        if c == 2            
                            constituent2(7)=1;
                        elseif c == 3
                            constituent3(7)=1;
                        end
                        c = c+1;
                 
                                if pat< 71 
                                   filler_pat(1,1:171)=sem(39).vec;%pizza
                                   if c == 3            
                                        constituent3(39)=1;
                                    elseif c == 4
                                        constituent4(39)=1;
                                   end
                                    c = c+1;

                                        filler_loc(1,1:171)=sem(18).vec;%kitchen 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(18)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(18)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(18)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end
                                    
                                elseif pat > 70 
                                filler_pat(1,1:171)=sem(38).vec;%soup               
                                if c == 3            
                                    constituent3(38)=1;
                                elseif c == 4
                                    constituent4(38)=1;
                                end
                                c = c+1; 

                                        filler_loc(1,1:171)=sem(79).vec;%balkony 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(79)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(79)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(79)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end
                                end
           elseif (age > 80)&&(age < 91)
              filler_age(1,1:171)=sem(3).vec;%girl
              if c == 1
                  constituent1(3)=1;
              elseif c == 2
                  constituent2(3)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(7).vec;%eat 
                        if c == 2            
                            constituent2(7)=1;
                        elseif c == 3
                            constituent3(7)=1;
                        end
                        c = c+1;
                 
                                if pat< 61 
                                   filler_pat(1,1:171)=sem(39).vec;%pizza
                                   if c == 3            
                                        constituent3(39)=1;
                                    elseif c == 4
                                        constituent4(39)=1;
                                   end
                                    c = c+1;

                                        filler_loc(1,1:171)=sem(18).vec;%kitchen 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(18)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(18)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(18)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end
                                    
                                elseif pat > 60 
                                filler_pat(1,1:171)=sem(38).vec;%soup               
                                if c == 3            
                                    constituent3(38)=1;
                                elseif c == 4
                                    constituent4(38)=1;
                                end
                                c = c+1; 

                                        filler_loc(1,1:171)=sem(79).vec;%balkony 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(79)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(79)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(79)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end
                                end
           elseif age > 90 
              filler_age(1,1:171)=sem(4).vec;%boy
              if c == 1
                  constituent1(4)=1;
              elseif c == 2
                  constituent2(4)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(7).vec;%eat 
                        if c == 2            
                            constituent2(7)=1;
                        elseif c == 3
                            constituent3(7)=1;
                        end
                        c = c+1;
                 
                                if pat< 61 
                                   filler_pat(1,1:171)=sem(39).vec;%pizza
                                   if c == 3           
                                        constituent3(39)=1;
                                    elseif c == 4
                                        constituent4(39)=1;
                                   end
                                    c = c+1;

                                        filler_loc(1,1:171)=sem(18).vec;%kitchen 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(18)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(18)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(18)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end

                                elseif pat > 60 
                                filler_pat(1,1:171)=sem(38).vec;%soup                 
                                if c == 3            
                                    constituent3(38)=1;
                                elseif c == 4
                                    constituent4(38)=1;
                                end
                                c = c+1; 

                                        filler_loc(1,1:171)=sem(79).vec;%balkony 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(79)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(79)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(79)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end
                                end
                                
                                
           end
       end
       
                   
                  
                   
        if pas > 90 %passive
           
           active_constituent1 = constituent1;
           active_constituent2 = constituent2;
           active_constituent3 = constituent3;
           active_constituent4 = constituent4;

           filler_age(1,1)=1;

           if sit_c == 1 %situation constituent presented

               constituent2 = active_constituent4;
               constituent3(74)=1; 
               constituent4 = active_constituent2; 
               constituent4(75)=1; 

           elseif sit_c == 2 %no situation constituent presented
               constituent1 = active_constituent3; 
               constituent2(74)=1; %"was"
               constituent3 = active_constituent1;
               constituent3(75)=1;

           end
       end
       
       
elseif act == 3; %drink
       roles = [1 2 3 4 5]; %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
       pas = randi(100,1);
       c = 1; %initialize constituent counter
       sit = randi(2,1); %morning or evening? 
       sit_c = randi(2,1);

       
       if sit == 1
           filler_sit(1,1:171)=sem(88).vec;%morning
           if sit_c == 1
               constituent1(88) = 1; 
               constituent1(72) = 1; %during
               c = c + 1;
           end
           
           if age < 41 
              filler_age(1,1:171)=sem(2).vec;%man
              if c == 1
                  constituent1(2)=1;
              elseif c == 2
                  constituent2(2)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(6).vec;%drink 
                        if c == 2            
                            constituent2(6)=1;
                        elseif c == 3
                            constituent3(6)=1;
                        end
                        c = c+1;
                 
                                if pat< 71 
                                   filler_pat(1,1:171)=sem(45).vec;%tea
                                   if c == 3            
                                        constituent3(45)=1;
                                    elseif c == 4
                                        constituent4(45)=1;
                                   end
                                    c = c+1;

                                        filler_loc(1,1:171)=sem(18).vec;%kitchen 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(18)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(18)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(18)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;
                                        end

                                    
                                elseif pat > 70 
                                filler_pat(1,1:171)=sem(44).vec;%cacao                 
                                if c == 3           
                                    constituent3(44)=1;
                                elseif c == 4
                                    constituent4(44)=1;
                                end
                                c = c+1; 

                                        filler_loc(1,1:171)=sem(79).vec;%balkony 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(79)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(79)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(79)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end
                                end
              
           elseif (age > 40)&&(age < 81)
              filler_age(1,1:171)=sem(1).vec;%woman
              if c == 1
                  constituent1(1)=1;
              elseif c == 2
                  constituent2(1)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(6).vec;%drink
                        if c == 2           
                            constituent2(6)=1;
                        elseif c == 3
                            constituent3(6)=1;
                        end
                        c = c+1;
                 
                                if pat> 70 
                                   filler_pat(1,1:171)=sem(44).vec;%cacao
                                   if c == 3            
                                        constituent3(44)=1;
                                    elseif c == 4
                                        constituent4(44)=1;
                                   end
                                    c = c+1;

                                        filler_loc(1,1:171)=sem(79).vec;%balkony 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(79)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(79)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(79)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end
                                        
                                    
                                elseif pat < 71 
                                filler_pat(1,1:171)=sem(45).vec;%tea                 
                                if c == 3            
                                    constituent3(45)=1;
                                elseif c == 4
                                    constituent4(45)=1;
                                end
                                c = c+1; 
                                
                                        filler_loc(1,1:171)=sem(18).vec;%kitchen 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(18)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(18)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(18)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;
                                        end

                                        
                                end
           elseif (age > 80)&&(age < 91)
              filler_age(1,1:171)=sem(3).vec;%girl
              if c == 1
                  constituent1(3)=1;
              elseif c == 2
                  constituent2(3)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(6).vec;%drink
                        if c == 2           
                            constituent2(6)=1;
                        elseif c == 3
                            constituent3(6)=1;
                        end
                        c = c+1;
                 
                                if pat> 60 
                                   filler_pat(1,1:171)=sem(44).vec;%cacao
                                   if c == 3            
                                        constituent3(44)=1;
                                    elseif c == 4
                                        constituent4(44)=1;
                                   end
                                    c = c+1;

                                        filler_loc(1,1:171)=sem(79).vec;%balkony 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(79)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(79)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(79)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end
                                       

                                    
                                elseif pat < 61 
                                filler_pat(1,1:171)=sem(45).vec;%tea                 
                                if c == 3            
                                    constituent3(45)=1;
                                elseif c == 4
                                    constituent4(45)=1;
                                end
                                c = c+1; 

                                
                                        filler_loc(1,1:171)=sem(18).vec;%kitchen 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(18)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(18)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(18)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;
                                        end
                                        
                                end

           elseif age > 90 
              filler_age(1,1:171)=sem(4).vec;%boy
              if c == 1
                  constituent1(4)=1;
              elseif c == 2
                  constituent2(4)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(6).vec;%drink 
                        if c == 2            
                            constituent2(6)=1;
                        elseif c == 3
                            constituent3(6)=1;
                        end
                        c = c+1;
                 
                                if pat< 61 
                                   filler_pat(1,1:171)=sem(45).vec;%tea
                                   if c == 3            
                                        constituent3(45)=1;
                                    elseif c == 4
                                        constituent4(45)=1;
                                   end
                                    c = c+1;

                                        filler_loc(1,1:171)=sem(18).vec;%kitchen 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(18)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(18)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(18)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;
                                        end

                                    
                                elseif pat > 60 
                                filler_pat(1,1:171)=sem(44).vec;%cacao                 
                                if c == 3           
                                    constituent3(44)=1;
                                elseif c == 4
                                    constituent4(44)=1;
                                end
                                c = c+1; 

                                        filler_loc(1,1:171)=sem(79).vec;%balkony 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(79)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(79)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(79)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end
                                end

           end
        
       elseif sit == 2
           filler_sit(1,1:171)=sem(89).vec;%evening
           if sit_c == 1
               constituent1(89) = 1;
               constituent1(72) = 1;%during
               c = c + 1;
           end

           if age < 41 
              filler_age(1,1:171)=sem(2).vec;%man
              if c == 1
                  constituent1(2)=1;
              elseif c == 2
                  constituent2(2)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(6).vec;%drink 
                        if c == 2            
                            constituent2(6)=1;
                        elseif c == 3
                            constituent3(6)=1;
                        end
                        c = c+1;
                 
                                if pat> 70 
                                   filler_pat(1,1:171)=sem(42).vec;%juice
                                   if c == 3           
                                        constituent3(42)=1;
                                    elseif c == 4
                                        constituent4(42)=1;
                                   end
                                    c = c+1;

                                        filler_loc(1,1:171)=sem(79).vec;%balkony 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(79)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(79)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(79)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end
                                                     
                                elseif pat < 71 
                                filler_pat(1,1:171)=sem(41).vec;%iced_tea                 
                                    if c == 3            
                                        constituent3(41)=1;
                                    elseif c == 4
                                        constituent4(41)=1;
                                    end
                                    c = c+1; 
                                        
                                        filler_loc(1,1:171)=sem(18).vec;%kitchen 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(18)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(18)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(18)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1; 
                                        end

                 
                                end
              
           elseif (age > 40)&&(age < 81)
              filler_age(1,1:171)=sem(1).vec;%woman
              if c == 1
                  constituent1(1)=1;
              elseif c == 2
                  constituent2(1)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(6).vec;%drink 
                        if c == 2            
                            constituent2(6)=1;
                        elseif c == 3
                            constituent3(6)=1;
                        end
                        c = c+1;
                 
                                if pat> 70 
                                   filler_pat(1,1:171)=sem(42).vec;%juice
                                   if c == 3            
                                        constituent3(42)=1;
                                    elseif c == 4
                                        constituent4(42)=1;
                                   end
                                    c = c+1;

                                        filler_loc(1,1:171)=sem(79).vec;%balkony 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(79)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(79)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(79)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end
                                    
                                elseif pat < 71 
                                filler_pat(1,1:171)=sem(41).vec;%iced_tea               
                                    if c == 3            
                                        constituent3(41)=1;
                                    elseif c == 4
                                        constituent4(41)=1;
                                    end
                                    c = c+1; 

                                        filler_loc(1,1:171)=sem(18).vec;%kitchen 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(18)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(18)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(18)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;                   
                                        end
                                end
                                
           elseif (age > 80)&&(age < 91)
              filler_age(1,1:171)=sem(3).vec;%girl
              if c == 1
                  constituent1(3)=1;
              elseif c == 2
                  constituent2(3)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(6).vec;%drink 
                        if c == 2            
                            constituent2(6)=1;
                        elseif c == 3
                            constituent3(6)=1;
                        end
                        c = c+1;
                 
                                if pat> 60 
                                   filler_pat(1,1:171)=sem(42).vec;%juice
                                   if c == 3            
                                        constituent3(42)=1;
                                    elseif c == 4
                                        constituent4(42)=1;
                                   end
                                    c = c+1;

                                        filler_loc(1,1:171)=sem(79).vec;%balkony 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(79)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(79)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(79)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end
                                    
                                elseif pat < 61 
                                filler_pat(1,1:171)=sem(41).vec;%iced_tea               
                                    if c == 3            
                                        constituent3(41)=1;
                                    elseif c == 4
                                        constituent4(41)=1;
                                    end
                                    c = c+1; 

                                        filler_loc(1,1:171)=sem(18).vec;%kitchen 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(18)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(18)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(18)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;                   
                                        end
                                end

           elseif age > 90 
              filler_age(1,1:171)=sem(4).vec;%boy
              if c == 1
                  constituent1(4)=1;
              elseif c == 2
                  constituent2(4)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(6).vec;%drink 
                        if c == 2            
                            constituent2(6)=1;
                        elseif c == 3
                            constituent3(6)=1;
                        end
                        c = c+1;
                 
                                if pat> 60 
                                   filler_pat(1,1:171)=sem(42).vec;%juice
                                   if c == 3           
                                        constituent3(42)=1;
                                    elseif c == 4
                                        constituent4(42)=1;
                                   end
                                    c = c+1;

                                        filler_loc(1,1:171)=sem(79).vec;%balkony 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(79)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(79)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(79)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1;  
                                        end
                                                     
                                elseif pat < 61 
                                filler_pat(1,1:171)=sem(41).vec;%iced_tea                 
                                    if c == 3            
                                        constituent3(41)=1;
                                    elseif c == 4
                                        constituent4(41)=1;
                                    end
                                    c = c+1; 
                                        
                                        filler_loc(1,1:171)=sem(18).vec;%kitchen 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(18)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(18)=1;
                                                constituent5(73)=1;
                                            elseif c == 6
                                                constituent6(18)=1;
                                                constituent6(73)=1;
                                            end
                                            c = c+1; 
                                        end

                 
                                end      
           end
       end

       
                                     
                   
     if pas > 90 %passive
           
           active_constituent1 = constituent1;
           active_constituent2 = constituent2;
           active_constituent3 = constituent3;
           active_constituent4 = constituent4;

           filler_age(1,1)=1;

           if sit_c == 1 %situation constituent presented
               constituent2 = active_constituent4;
               constituent3(74)=1; 
               constituent4 = active_constituent2; 
               constituent4(75)=1; 
           elseif sit_c == 2 %no situation constituent presented
               constituent1 = active_constituent3; 
               constituent2(74)=1; %"was"
               constituent3 = active_constituent1;
               constituent3(75)=1;
           end
     end
       
     
elseif act == 4 %"play"
    roles = [1 2 3 4];  %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
    c = 5;
    
    constituent2(12) = 1;
    filler_act(1,1:171)=sem(12).vec;%play

    if age < 41 %choose agent
        
        constituent1(2) = 1;
        filler_age(1,1:171)=sem(2).vec;%he
              
            if pat < 71
                constituent3(46) = 1;
                filler_pat(1,1:171)=sem(46).vec;%chess

                   filler_loc(1,1:171)=sem(19).vec;%living room
                   if loc_c == 1           
                            constituent4(19)=1;
                            constituent4(73)=1; %at/in... location-marker
                    
                   end   

            elseif pat > 70
                constituent3(47) = 1;
                filler_pat(1,1:171)=sem(47).vec;%monopoly
              
                   filler_loc(1,1:171)=sem(82).vec;%veranda
                   if loc_c == 1           
                            constituent4(82)=1;
                            constituent4(73)=1; %at/in... location-marker
                         
                   end   
            end
                    
    elseif (age > 40) && (age < 81) 
        constituent1(1) = 1;
        filler_age(1,1:171)=sem(1).vec;%she
        
            if pat < 71        
                constituent3(46) = 1;
                filler_pat(1,1:171)=sem(46).vec;%chess
              
                   filler_loc(1,1:171)=sem(19).vec;%living room
                   if loc_c == 1           
                            constituent4(19)=1;
                            constituent4(73)=1; %at/in... location-marker
                       
                   end   

            elseif pat > 70
                constituent3(47) = 1;
                filler_pat(1,1:171)=sem(47).vec;%monopoly 
               
                   filler_loc(1,1:171)=sem(82).vec;%veranda
                   if loc_c == 1           
                            constituent4(82)=1;
                            constituent4(73)=1; %at/in... location-marker
                     
                   end   

            end
    
    elseif (age > 80) && (age < 91) 
        constituent1(3) = 1;
        filler_age(1,1:171)=sem(3).vec;%girl
        
            if pat < 61        
                constituent3(46) = 1;
                filler_pat(1,1:171)=sem(46).vec;%chess
              
                   filler_loc(1,1:171)=sem(19).vec;%living room
                   if loc_c == 1           
                            constituent4(19)=1;
                            constituent4(73)=1; %at/in... location-marker
                       
                   end   

            elseif pat > 60
                constituent3(47) = 1;
                filler_pat(1,1:171)=sem(47).vec;%monopoly 
               
                   filler_loc(1,1:171)=sem(82).vec;%veranda
                   if loc_c == 1           
                            constituent4(82)=1;
                            constituent4(73)=1; %at/in... location-marker
                       
                   end   

            end
    
    elseif age > 90 %choose agent
        
        constituent1(4) = 1;
        filler_age(1,1:171)=sem(4).vec;%boy
              
            if pat < 61
                constituent3(46) = 1;
                filler_pat(1,1:171)=sem(46).vec;%chess

                   filler_loc(1,1:171)=sem(19).vec;%living room
                   if loc_c == 1           
                            constituent4(19)=1;
                            constituent4(73)=1; %at/in... location-marker
                    
                   end   

            elseif pat > 60
                constituent3(47) = 1;
                filler_pat(1,1:171)=sem(47).vec;%monopoly
              
                   filler_loc(1,1:171)=sem(82).vec;%veranda
                   if loc_c == 1           
                            constituent4(82)=1;
                            constituent4(73)=1; %at/in... location-marker
                      
                   end   
            end
   
    end  
    
                   
                   
                   
elseif act == 5 %"read"
    roles = [1 2 3 4]; %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
    c = 5; 
    
    constituent2(14) = 1;
    filler_act(1,1:171)=sem(14).vec;%read

    if age < 41 %choose agent
        
        constituent1(2) = 1;
        filler_age(1,1:171)=sem(2).vec;%he
              
            if pat < 71 
                constituent3(54) = 1;
                filler_pat(1,1:171)=sem(54).vec;%novel 
          
                   filler_loc(1,1:171)=sem(19).vec;%living room
                   if loc_c == 1           
                            constituent4(19)=1;
                            constituent4(73)=1; %at/in... location-marker
                       
                   end   

            elseif pat > 70
                constituent3(59) = 1;
                filler_pat(1,1:171)=sem(59).vec;%letter
             
                   filler_loc(1,1:171)=sem(83).vec;%bedroom
                   if loc_c == 1           
                            constituent4(83)=1;
                            constituent4(73)=1; %at/in... location-marker
                      
                   end   
            end
                    
    elseif (age > 40) && (age < 81) 
        constituent1(1) = 1;
        filler_age(1,1:171)=sem(1).vec;%she
        
            if pat < 71       
                constituent3(54) = 1;
                filler_pat(1,1:171)=sem(54).vec;%novel 
            
                   filler_loc(1,1:171)=sem(19).vec;%living room
                   if loc_c == 1           
                            constituent4(19)=1;
                            constituent4(73)=1; %at/in... location-marker
                    
                   end   

            elseif pat > 70
                constituent3(59) = 1;
                filler_pat(1,1:171)=sem(59).vec;%letter 
               
                   filler_loc(1,1:171)=sem(83).vec;%bedroom
                   if loc_c == 1           
                            constituent4(83)=1;
                            constituent4(73)=1; %at/in... location-marker
                    
                   end   
            end
            
    elseif (age > 80) && (age < 91) 
        constituent1(3) = 1;
        filler_age(1,1:171)=sem(3).vec;%girl
        
            if pat < 61        
                constituent3(54) = 1;
                filler_pat(1,1:171)=sem(54).vec;%novel 
             
                   filler_loc(1,1:171)=sem(19).vec;%living room
                   if loc_c == 1           
                            constituent4(19)=1;
                            constituent4(73)=1; %at/in... location-marker
                
                   end   

            elseif pat > 60
                constituent3(59) = 1;
                filler_pat(1,1:171)=sem(59).vec;%letter 
               
                   filler_loc(1,1:171)=sem(83).vec;%bedroom
                   if loc_c == 1           
                            constituent4(83)=1;
                            constituent4(73)=1; %at/in... location-marker
                 
                   end   
            end            
    
     elseif age > 90 
        constituent1(4) = 1;
        filler_age(1,1:171)=sem(4).vec;%boy
        
            if pat < 61        
                constituent3(54) = 1;
                filler_pat(1,1:171)=sem(54).vec;%novel
              
                   filler_loc(1,1:171)=sem(19).vec;%living room
                   if loc_c == 1           
                            constituent4(19)=1;
                            constituent4(73)=1; %at/in... location-marker
                    
                   end   

            elseif pat > 60
                constituent3(59) = 1;
                filler_pat(1,1:171)=sem(59).vec;%letter  
              
                   filler_loc(1,1:171)=sem(83).vec;%bedroom
                   if loc_c == 1           
                            constituent4(83)=1;
                            constituent4(73)=1; %at/in... location-marker
                
                   end   
            end
    end
 
                          
 
                   
elseif act == 6 %"write"
    roles = [1 2 3 4]; %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
    c = 5; 
    constituent2(15) = 1;
    filler_act(1,1:171)=sem(15).vec;%write

    if age < 41 %choose agent
        
        constituent1(2) = 1;
        filler_age(1,1:171)=sem(2).vec;%he
              
            if pat < 71 
                constituent3(55) = 1;
                filler_pat(1,1:171)=sem(55).vec;%email

                   filler_loc(1,1:171)=sem(19).vec;%living room
                            constituent4(19)=1;
                            constituent4(73)=1; %at/in... location-marker
 
                   
            elseif pat > 70
                constituent3(56) = 1;
                filler_pat(1,1:171)=sem(56).vec;%sms 

                   filler_loc(1,1:171)=sem(82).vec;%veranda
                            constituent4(82)=1;
                            constituent4(73)=1; %at/in... location-marker

            end
                    
    elseif (age > 40) && (age < 81) 
        constituent1(1) = 1;
        filler_age(1,1:171)=sem(1).vec;%she
        
            if pat < 71        
                constituent3(55) = 1;
                filler_pat(1,1:171)=sem(55).vec;%email 

                   filler_loc(1,1:171)=sem(19).vec;%living room
                            constituent4(19)=1;
                            constituent4(73)=1; %at/in... location-marker

                            
            elseif pat > 70
                constituent3(56) = 1;
                filler_pat(1,1:171)=sem(56).vec;%sms

                   filler_loc(1,1:171)=sem(82).vec;%veranda
                            constituent4(82)=1;
                            constituent4(73)=1; %at/in... location-marker

            end
            
    elseif (age > 80) && (age < 91) 
        constituent1(3) = 1;
        filler_age(1,1:171)=sem(3).vec;%girl
        
            if pat < 61        
                constituent3(55) = 1;
                filler_pat(1,1:171)=sem(55).vec;%email

                   filler_loc(1,1:171)=sem(19).vec;%living room
                            constituent4(19)=1;
                            constituent4(73)=1; %at/in... location-marker

                            
            elseif pat > 60
                constituent3(56) = 1;
                filler_pat(1,1:171)=sem(56).vec;%sms   

                   filler_loc(1,1:171)=sem(82).vec;%veranda
                            constituent4(82)=1;
                            constituent4(73)=1; %at/in... location-marker

            end            
    
     elseif age > 90 
        constituent1(4) = 1;
        filler_age(1,1:171)=sem(4).vec;%boy
        
            if pat < 61        
                constituent3(55) = 1;
                filler_pat(1,1:171)=sem(55).vec;%email

                   filler_loc(1,1:171)=sem(19).vec;%living room
                            constituent4(19)=1;
                            constituent4(73)=1; %at/in... location-marker

                            
            elseif pat > 60
                constituent3(56) = 1;
                filler_pat(1,1:171)=sem(56).vec;%sms 

                   filler_loc(1,1:171)=sem(82).vec;%veranda
                            constituent4(82)=1;
                            constituent4(73)=1; %at/in... location-marker

            end
    end
 
     
    

                   
 
 elseif act == 7; %feed
       roles = [1 2 3 4 5]; %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
       pas = randi(100,1);
       c = 1; %initialize constituent counter
       sit_c = randi(2,1);      

           filler_sit(1,1:171)=sem(86).vec;%holiday
           if sit_c == 1
               constituent1(86) = 1; 
               constituent1(72) = 1; %during
               c = c + 1;
           end
           
           if age < 41 
              filler_age(1,1:171)=sem(2).vec;%man
              if c == 1
                  constituent1(2)=1;
              elseif c == 2
                  constituent2(2)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(8).vec;%feed 
                        if c == 2            
                            constituent2(8)=1;
                        elseif c == 3
                            constituent3(8)=1;
                        end
                        c = c+1;
                 
                                if pat< 71 
                                   filler_pat(1,1:171)=sem(66).vec;%robin
                                   if c == 3           
                                        constituent3(66)=1;
                                    elseif c == 4
                                        constituent4(66)=1;
                                   end
                                    c = c+1;

                                    filler_loc(1,1:171)=sem(78).vec;%park
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
                                    filler_pat(1,1:171)=sem(67).vec;%canary                 
                                    if c == 3            
                                        constituent3(67)=1;
                                    elseif c == 4
                                        constituent4(67)=1;
                                    end
                                    c = c+1;
 
                                    filler_loc(1,1:171)=sem(20).vec;%garden
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
              filler_age(1,1:171)=sem(1).vec;%woman
              if c == 1
                  constituent1(1)=1;
              elseif c == 2
                  constituent2(1)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(8).vec;%feed 
                        if c == 2           
                            constituent2(8)=1;
                        elseif c == 3
                            constituent3(8)=1;
                        end
                        c = c+1;
                 
                                if pat< 71
                                   filler_pat(1,1:171)=sem(66).vec;%robin
                                   if c == 3           
                                        constituent3(66)=1;
                                    elseif c == 4
                                        constituent4(66)=1;
                                   end
                                    c = c+1;

                                    filler_loc(1,1:171)=sem(78).vec;%park
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
                                    filler_pat(1,1:171)=sem(67).vec;%canary                 
                                    if c == 3            
                                        constituent3(67)=1;
                                    elseif c == 4
                                        constituent4(67)=1;
                                    end
                                    c = c+1; 
                                    
                                    filler_loc(1,1:171)=sem(20).vec;%garden
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
              filler_age(1,1:171)=sem(3).vec;%girl
              if c == 1
                  constituent1(3)=1;
              elseif c == 2
                  constituent2(3)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(8).vec;%feed 
                        if c == 2           
                            constituent2(8)=1;
                        elseif c == 3
                            constituent3(8)=1;
                        end
                        c = c+1;
                 
                                if pat< 61 
                                   filler_pat(1,1:171)=sem(66).vec;%robin
                                   if c == 3           
                                        constituent3(66)=1;
                                    elseif c == 4
                                        constituent4(66)=1;
                                   end
                                    c = c+1;
                                    
                                    filler_loc(1,1:171)=sem(78).vec;%park
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
                                    filler_pat(1,1:171)=sem(67).vec;%canary                 
                                    if c == 3            
                                        constituent3(67)=1;
                                    elseif c == 4
                                        constituent4(67)=1;
                                    end
                                    c = c+1;
 
                                    filler_loc(1,1:171)=sem(20).vec;%garden
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
              filler_age(1,1:171)=sem(4).vec;%boy
              if c == 1
                  constituent1(4)=1;
              elseif c == 2
                  constituent2(4)=1;
              end
              c = c+1; 
 
                    filler_act(1,1:171)=sem(8).vec;%feed 
                        if c == 2         
                            constituent2(8)=1;
                        elseif c == 3
                            constituent3(8)=1;
                        end
                        c = c+1;
                 
                                if pat< 61 
                                   filler_pat(1,1:171)=sem(66).vec;%robin
                                   if c == 3           
                                        constituent3(66)=1;
                                    elseif c == 4
                                        constituent4(66)=1;
                                   end
                                    c = c+1;

                                    filler_loc(1,1:171)=sem(78).vec;%park
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
                                    filler_pat(1,1:171)=sem(67).vec;%canary                 
                                    if c == 3            
                                        constituent3(67)=1;
                                    elseif c == 4
                                        constituent4(67)=1;
                                    end
                                    c = c+1;
 
                                    filler_loc(1,1:171)=sem(20).vec;%garden
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
        
      
       


       if pas > 90
           
           active_constituent1 = constituent1;
           active_constituent2 = constituent2;
           active_constituent3 = constituent3;
           active_constituent4 = constituent4;

           filler_age(1,1)=1;
           
           if sit_c == 1
               constituent2 = active_constituent4;
               constituent3(74)=1; 
               constituent4 = active_constituent2; 
               constituent4(75)=1; 
               
           elseif sit_c == 2 
               constituent1 = active_constituent3; 
               constituent2(74)=1; %"was"
               constituent3 = active_constituent1;
               constituent3(75)=1;

           end
       end
                   
 elseif act == 8; %fish
       roles = [1 2 3 4 5]; %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
       pas = randi(100,1);
       c = 1; %initialize constituent counter
       sit_c = randi(2,1);

           filler_sit(1,1:171)=sem(24).vec;%excursion
           if sit_c == 1
               constituent1(24) = 1; 
               constituent1(72) = 1; %during
               c = c + 1;
           end
           
           if age < 41 
              filler_age(1,1:171)=sem(2).vec;%man
              if c == 1
                  constituent1(2)=1;
              elseif c == 2
                  constituent2(2)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(9).vec;%fish 
                        if c == 2            
                            constituent2(9)=1;
                        elseif c == 3
                            constituent3(9)=1;
                        end
                        c = c+1;
                 
                                if pat< 71 
                                   filler_pat(1,1:171)=sem(70).vec;%salmon
                                   if c == 3            
                                        constituent3(70)=1;
                                    elseif c == 4
                                        constituent4(70)=1;
                                   end
                                    c = c+1;

                                        filler_loc(1,1:171)=sem(21).vec;%lake - hier gut! 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(21)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(21)=1;
                                                constituent5(73)=1;
                                            end
                                            c = c+1;  
                                        end
                                                     
                                elseif pat > 70 
                                    filler_pat(1,1:171)=sem(69).vec;%sunfish                 
                                    if c == 3            
                                        constituent3(69)=1;
                                    elseif c == 4
                                        constituent4(69)=1;
                                    end
                                    c = c+1; 

                                        filler_loc(1,1:171)=sem(80).vec;%river - hier gut! 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(80)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(80)=1;
                                                constituent5(73)=1;
                                            end
                                            c = c+1;  
                                        end
                 
                                end
              
           elseif (age > 40)&&(age < 81)
              filler_age(1,1:171)=sem(1).vec;%woman
              if c == 1
                  constituent1(1)=1;
              elseif c == 2
                  constituent2(1)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(9).vec;%fish 
                        if c == 2           
                            constituent2(9)=1;
                        elseif c == 3
                            constituent3(9)=1;
                        end
                        c = c+1;
                 
                                if pat< 71
                                   filler_pat(1,1:171)=sem(70).vec;%salmon
                                   if c == 3           
                                        constituent3(70)=1;
                                    elseif c == 4
                                        constituent4(70)=1;
                                   end
                                    c = c+1;

                                        filler_loc(1,1:171)=sem(21).vec;%lake - hier gut! 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(21)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(21)=1;
                                                constituent5(73)=1;
                                            end
                                            c = c+1;  
                                        end
                                    
                                elseif pat > 70 
                                    filler_pat(1,1:171)=sem(69).vec;%sunfish                 
                                    if c == 3            
                                        constituent3(69)=1;
                                    elseif c == 4
                                        constituent4(69)=1;
                                    end
                                    c = c+1;
 
                                        filler_loc(1,1:171)=sem(80).vec;%lake - hier gut! 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(80)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(80)=1;
                                                constituent5(73)=1;
                                            end
                                            c = c+1;  
                                        end
                 
                                end
                                
                                
           elseif (age > 80)&&(age < 91)
              filler_age(1,1:171)=sem(3).vec;%girl
              if c == 1
                  constituent1(3)=1;
              elseif c == 2
                  constituent2(3)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(9).vec;%fish 
                        if c == 2           
                            constituent2(9)=1;
                        elseif c == 3
                            constituent3(9)=1;
                        end
                        c = c+1;
                 
                                if pat< 61
                                   filler_pat(1,1:171)=sem(70).vec;%salmon
                                   if c == 3           
                                        constituent3(70)=1;
                                    elseif c == 4
                                        constituent4(70)=1;
                                   end
                                    c = c+1;

                                        filler_loc(1,1:171)=sem(21).vec;%lake - hier gut! 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(21)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(21)=1;
                                                constituent5(73)=1;
                                            end
                                            c = c+1;  
                                        end
                                    
                                elseif pat > 60 
                                    filler_pat(1,1:171)=sem(69).vec;%sunfish                 
                                    if c == 3            
                                        constituent3(69)=1;
                                    elseif c == 4
                                        constituent4(69)=1;
                                    end
                                    c = c+1; 

                                        filler_loc(1,1:171)=sem(80).vec;%lake - hier gut! 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(80)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(80)=1;
                                                constituent5(73)=1;
                                            end
                                            c = c+1;  
                                        end
                 
                                end                                
                                

           elseif age > 90
              filler_age(1,1:171)=sem(4).vec;%boy
              if c == 1
                  constituent1(4)=1;
              elseif c == 2
                  constituent2(4)=1;
              end
              c = c+1; 
 
                    filler_act(1,1:171)=sem(9).vec;%fish 
                        if c == 2         
                            constituent2(9)=1;
                        elseif c == 3
                            constituent3(9)=1;
                        end
                        c = c+1;
                 
                                if pat< 61 
                                   filler_pat(1,1:171)=sem(70).vec;%salmon
                                   if c == 3           
                                        constituent3(70)=1;
                                    elseif c == 4
                                        constituent4(70)=1;
                                   end
                                    c = c+1;

                                        filler_loc(1,1:171)=sem(21).vec;%lake - hier gut! 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(21)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(21)=1;
                                                constituent5(73)=1;
                                            end
                                            c = c+1;  
                                        end
                                    
                                elseif pat > 60 
                                    filler_pat(1,1:171)=sem(69).vec;%sunfish                 
                                    if c == 3            
                                        constituent3(69)=1;
                                    elseif c == 4
                                        constituent4(69)=1;
                                    end
                                    c = c+1; 

                                        filler_loc(1,1:171)=sem(80).vec;%lake - hier gut! 
                                        if loc_c == 1
                                            if c == 4           
                                                constituent4(80)=1;
                                                constituent4(73)=1; %at/in... location-marker
                                            elseif c == 5
                                                constituent5(80)=1;
                                                constituent5(73)=1;
                                            end
                                            c = c+1;  
                                        end
                 
                                end      
           end
        
      
       

       if pas > 90
           
           active_constituent1 = constituent1;
           active_constituent2 = constituent2;
           active_constituent3 = constituent3;
           active_constituent4 = constituent4;

           filler_age(1,1)=1;
           
           if sit_c == 1
               constituent2 = active_constituent4;
               constituent3(74)=1; 
               constituent4 = active_constituent2; 
               constituent4(75)=1; 

           elseif sit_c == 2 
               constituent1 = active_constituent3; 
               constituent2(74)=1; %"was"
               constituent3 = active_constituent1;
               constituent3(75)=1;

           end
       end
       
       
 elseif act == 9; %plant
       roles = [1 2 3 4 5];%1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
       pas = randi(100,1);
       c = 1; %initialize constituent counter
       sit_c = randi(2,1);

           filler_sit(1,1:171)=sem(87).vec;%sunday
           if sit_c == 1
               constituent1(87) = 1; 
               constituent1(72) = 1; %during
               c = c + 1;
           end
           
           if age < 41 
              filler_age(1,1:171)=sem(2).vec;%man
              if c == 1
                  constituent1(2)=1;
              elseif c == 2
                  constituent2(2)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(10).vec;%plant 
                        if c == 2            
                            constituent2(10)=1;
                        elseif c == 3
                            constituent3(10)=1;
                        end
                        c = c+1;
                 
                                if pat< 71 
                                   filler_pat(1,1:171)=sem(60).vec;%rose
                                   if c == 3            
                                        constituent3(60)=1;
                                    elseif c == 4
                                        constituent4(60)=1;
                                   end
                                    c = c+1;

                                    filler_loc(1,1:171)=sem(20).vec;%garden
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
                                    filler_pat(1,1:171)=sem(61).vec;%daisy                 
                                    if c == 3            
                                        constituent3(61)=1;
                                    elseif c == 4
                                        constituent4(61)=1;
                                    end
                                    c = c+1;
 
                                    filler_loc(1,1:171)=sem(81).vec;%backyard
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
              filler_age(1,1:171)=sem(1).vec;%woman
              if c == 1
                  constituent1(1)=1;
              elseif c == 2
                  constituent2(1)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(10).vec;%plant 
                        if c == 2           
                            constituent2(10)=1;
                        elseif c == 3
                            constituent3(10)=1;
                        end
                        c = c+1;
                 
                                if pat< 71 
                                   filler_pat(1,1:171)=sem(60).vec;%rose
                                   if c == 3           
                                        constituent3(60)=1;
                                    elseif c == 4
                                        constituent4(60)=1;
                                   end
                                    c = c+1;

                                    filler_loc(1,1:171)=sem(20).vec;%garden
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
                                    filler_pat(1,1:171)=sem(61).vec;%daisy                 
                                    if c == 3            
                                        constituent3(61)=1;
                                    elseif c == 4
                                        constituent4(61)=1;
                                    end
                                    c = c+1;
 
                                    filler_loc(1,1:171)=sem(81).vec;%backyard
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
              filler_age(1,1:171)=sem(3).vec;%girl
              if c == 1
                  constituent1(3)=1;
              elseif c == 2
                  constituent2(3)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(10).vec;%plant 
                        if c == 2           
                            constituent2(10)=1;
                        elseif c == 3
                            constituent3(10)=1;
                        end
                        c = c+1;
                 
                                if pat< 61 
                                   filler_pat(1,1:171)=sem(60).vec;%rose
                                   if c == 3           
                                        constituent3(60)=1;
                                    elseif c == 4
                                        constituent4(60)=1;
                                   end
                                    c = c+1;

                                    filler_loc(1,1:171)=sem(20).vec;%garden
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
                                    filler_pat(1,1:171)=sem(61).vec;%daisy                 
                                    if c == 3            
                                        constituent3(61)=1;
                                    elseif c == 4
                                        constituent4(61)=1;
                                    end
                                    c = c+1;
 
                                    filler_loc(1,1:171)=sem(81).vec;%backyard
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
              filler_age(1,1:171)=sem(4).vec;%boy
              if c == 1
                  constituent1(4)=1;
              elseif c == 2
                  constituent2(4)=1;
              end
              c = c+1; 
 
                    filler_act(1,1:171)=sem(10).vec;%plant 
                        if c == 2         
                            constituent2(10)=1;
                        elseif c == 3
                            constituent3(10)=1;
                        end
                        c = c+1;
                 
                                if pat< 61 
                                   filler_pat(1,1:171)=sem(60).vec;%rose
                                   if c == 3           
                                        constituent3(60)=1;
                                    elseif c == 4
                                        constituent4(60)=1;
                                   end
                                    c = c+1;

                                    filler_loc(1,1:171)=sem(20).vec;%garden
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
                                    filler_pat(1,1:171)=sem(61).vec;%daisy                 
                                    if c == 3            
                                        constituent3(61)=1;
                                    elseif c == 4
                                        constituent4(61)=1;
                                    end
                                    c = c+1;
 
                                    filler_loc(1,1:171)=sem(81).vec;%backyard
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
        
      
       
                   
         if pas > 90
           
           active_constituent1 = constituent1;
           active_constituent2 = constituent2;
           active_constituent3 = constituent3;
           active_constituent4 = constituent4;

           filler_age(1,1)=1;
           
           if sit_c == 1
               constituent2 = active_constituent4;
               constituent3(74)=1; 
               constituent4 = active_constituent2; 
               constituent4(75)=1; 

           elseif sit_c == 2 
               constituent1 = active_constituent3; 
               constituent2(74)=1; %"was"
               constituent3 = active_constituent1;%agent als drittes
               constituent3(75)=1;

           end
         end
       
         
  elseif act == 10; %water %%%%%%%%%
       roles = [1 2 3 4 5]; %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
       pas = randi(100,1);
       c = 1; %initialize costituent counter
       sit_c = randi(2,1);

           filler_sit(1,1:171)=sem(25).vec;%afternoon
           if sit_c == 1
               constituent1(25) = 1; 
               constituent1(72) = 1; %during
               c = c + 1;
           end
           
           if age < 41 
              filler_age(1,1:171)=sem(2).vec;%man
              if c == 1
                  constituent1(2)=1;
              elseif c == 2
                  constituent2(2)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(11).vec;%water 
                        if c == 2            
                            constituent2(11)=1;
                        elseif c == 3
                            constituent3(11)=1;
                        end
                        c = c+1;
                 
                                if pat< 71 
                                   filler_pat(1,1:171)=sem(63).vec;%pine
                                   if c == 3            
                                        constituent3(63)=1;
                                    elseif c == 4
                                        constituent4(63)=1;
                                   end
                                    c = c+1;

                                  filler_loc(1,1:171)=sem(20).vec;%garden
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
                                    filler_pat(1,1:171)=sem(64).vec;%oak                 
                                    if c == 3            
                                        constituent3(64)=1;
                                    elseif c == 4
                                        constituent4(64)=1;
                                    end
                                    c = c+1;
 
                                    filler_loc(1,1:171)=sem(81).vec;%backyard
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
              filler_age(1,1:171)=sem(1).vec;%woman
              if c == 1
                  constituent1(1)=1;
              elseif c == 2
                  constituent2(1)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(11).vec;%water 
                        if c == 2           
                            constituent2(11)=1;
                        elseif c == 3
                            constituent3(11)=1;
                        end
                        c = c+1;
                 
                                if pat< 71 
                                   filler_pat(1,1:171)=sem(63).vec;%pine
                                   if c == 3           
                                        constituent3(63)=1;
                                    elseif c == 4
                                        constituent4(63)=1;
                                   end
                                    c = c+1;

                                  filler_loc(1,1:171)=sem(20).vec;%garden
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
                                    filler_pat(1,1:171)=sem(64).vec;%oak                 
                                    if c == 3            
                                        constituent3(64)=1;
                                    elseif c == 4
                                        constituent4(64)=1;
                                    end
                                    c = c+1;
 
                                    filler_loc(1,1:171)=sem(81).vec;%backyard
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
              filler_age(1,1:171)=sem(3).vec;%girl
              if c == 1
                  constituent1(3)=1;
              elseif c == 2
                  constituent2(3)=1;
              end
              c = c+1;
              
                    filler_act(1,1:171)=sem(11).vec;%water 
                        if c == 2           
                            constituent2(11)=1;
                        elseif c == 3
                            constituent3(11)=1;
                        end
                        c = c+1;
                 
                                if pat< 61
                                   filler_pat(1,1:171)=sem(63).vec;%pine
                                   if c == 3           
                                        constituent3(63)=1;
                                    elseif c == 4
                                        constituent4(63)=1;
                                   end
                                    c = c+1;

                                  filler_loc(1,1:171)=sem(20).vec;%garden
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
                                    filler_pat(1,1:171)=sem(64).vec;%oak                 
                                    if c == 3            
                                        constituent3(64)=1;
                                    elseif c == 4
                                        constituent4(64)=1;
                                    end
                                    c = c+1;
 
                                    filler_loc(1,1:171)=sem(81).vec;%backyard
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
              filler_age(1,1:171)=sem(4).vec;%boy
              if c == 1
                  constituent1(4)=1;
              elseif c == 2
                  constituent2(4)=1;
              end
              c = c+1; 
 
                    filler_act(1,1:171)=sem(11).vec;%water 
                        if c == 2         
                            constituent2(11)=1;
                        elseif c == 3
                            constituent3(11)=1;
                        end
                        c = c+1;
                 
                                if pat< 61 
                                   filler_pat(1,1:171)=sem(63).vec;%pine
                                   if c == 3           
                                        constituent3(63)=1;
                                    elseif c == 4
                                        constituent4(63)=1;
                                   end
                                    c = c+1;

                                  filler_loc(1,1:171)=sem(20).vec;%garden
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
                                    filler_pat(1,1:171)=sem(64).vec;%oak                 
                                    if c == 3            
                                        constituent3(64)=1;
                                    elseif c == 4
                                        constituent4(64)=1;
                                    end
                                    c = c+1;
 
                                    filler_loc(1,1:171)=sem(81).vec;%backyard
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
        
      
       if pas > 90 %passive
           
           active_constituent1 = constituent1;
           active_constituent2 = constituent2;
           active_constituent3 = constituent3;
           active_constituent4 = constituent4;

           filler_age(1,1)=1;
           
           if sit_c == 1
               constituent2 = active_constituent4;
               constituent3(74)=1; 
               constituent4 = active_constituent2; 
               constituent4(75)=1; 

           elseif sit_c == 2 
               constituent1 = active_constituent3; 
               constituent2(74)=1; %"was"
               constituent3 = active_constituent1;
               constituent3(75)=1;

           end
       end
       
       
elseif act == 11 %look at
            roles = [1 3]; %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
            c = 3;
            pat = randi(36,1);
            constituent1(16) = 1;
            filler_act(1,1:171)=sem(16).vec;%look at
        
            
                if pat == 1
                    constituent2(36)=1; %
                    filler_pat(1,1:171)=sem(36).vec;
                elseif pat == 2
                    constituent2(37)=1; %
                    filler_pat(1,1:171)=sem(37).vec;
                elseif pat == 3
                    constituent2(38)=1; %
                    filler_pat(1,1:171)=sem(38).vec;
                elseif pat == 4
                    constituent2(39)=1; %
                    filler_pat(1,1:171)=sem(39).vec;
                elseif pat == 5
                    constituent2(40)=1; %
                    filler_pat(1,1:171)=sem(40).vec;
                elseif pat == 6
                    constituent2(41)=1; %
                    filler_pat(1,1:171)=sem(41).vec;
                elseif pat == 7
                    constituent2(42)=1; %
                    filler_pat(1,1:171)=sem(42).vec;
                elseif pat == 8
                    constituent2(43)=1; %
                    filler_pat(1,1:171)=sem(43).vec;
                elseif pat == 9
                    constituent2(44)=1; %
                    filler_pat(1,1:171)=sem(44).vec;
                elseif pat == 10
                    constituent2(45)=1; %
                    filler_pat(1,1:171)=sem(45).vec;
                elseif pat == 11
                    constituent2(46)=1; %
                    filler_pat(1,1:171)=sem(46).vec;
                elseif pat == 12
                    constituent2(47)=1; %
                    filler_pat(1,1:171)=sem(47).vec;
                elseif pat == 13
                    constituent2(48)=1; %
                    filler_pat(1,1:171)=sem(48).vec;
                elseif pat == 14
                    constituent2(49)=1; %
                    filler_pat(1,1:171)=sem(49).vec;
                elseif pat == 15
                    constituent2(50)=1; %
                    filler_pat(1,1:171)=sem(50).vec;
                elseif pat == 16
                    constituent2(51)=1; %
                    filler_pat(1,1:171)=sem(51).vec;
                elseif pat == 17
                    constituent2(84)=1; %cereals (for catviol)
                    filler_pat(1,1:171)=sem(84).vec;
                elseif pat == 18
                    constituent2(85)=1; %coffee (for catviol)
                    filler_pat(1,1:171)=sem(85).vec;
                elseif pat == 19
                    constituent2(54)=1; %
                    filler_pat(1,1:171)=sem(54).vec;
                elseif pat == 20
                    constituent2(55)=1; %
                    filler_pat(1,1:171)=sem(55).vec;
                elseif pat == 21
                    constituent2(56)=1; %
                    filler_pat(1,1:171)=sem(56).vec;
                elseif pat == 22
                    constituent2(57)=1; %
                    filler_pat(1,1:171)=sem(57).vec;
                elseif pat == 23
                    constituent2(58)=1; %
                    filler_pat(1,1:171)=sem(58).vec;
                elseif pat == 24
                    constituent2(59)=1; %
                    filler_pat(1,1:171)=sem(59).vec;
                elseif pat == 25
                    constituent2(60)=1; %
                    filler_pat(1,1:171)=sem(60).vec;
                elseif pat == 26
                    constituent2(61)=1; %
                    filler_pat(1,1:171)=sem(61).vec;
                elseif pat == 27
                    constituent2(62)=1; %
                    filler_pat(1,1:171)=sem(62).vec;
                elseif pat == 28
                    constituent2(63)=1; %
                    filler_pat(1,1:171)=sem(63).vec;
                elseif pat == 29
                    constituent2(64)=1; %
                    filler_pat(1,1:171)=sem(64).vec;
                elseif pat == 30
                    constituent2(65)=1; %
                    filler_pat(1,1:171)=sem(65).vec;
                elseif pat == 31
                    constituent2(66)=1; %
                    filler_pat(1,1:171)=sem(66).vec;
                elseif pat == 32
                    constituent2(67)=1; %
                    filler_pat(1,1:171)=sem(67).vec;
                elseif pat == 33
                    constituent2(68)=1; %
                    filler_pat(1,1:171)=sem(68).vec;
                elseif pat == 34
                    constituent2(69)=1; %
                    filler_pat(1,1:171)=sem(69).vec;
                elseif pat == 35
                    constituent2(70)=1; %
                    filler_pat(1,1:171)=sem(70).vec;
                elseif pat == 36
                    constituent2(71)=1; %
                    filler_pat(1,1:171)=sem(71).vec;
                end


                
                    
elseif act == 12 %like
            roles = [1 2 3]; %1 act, 2 age, 3 pat, 4 loc, 5 sit, 6 ins, 7 cop
            c = 4;
            pat = randi(36,1);
            constituent2(17) = 1;
            filler_act(1,1:171)=sem(17).vec;%like
            
           if age < 26
               constituent1(1)=1;
               filler_age(1,1:171)=sem(1).vec;
                    
                if pat == 1
                    constituent3(36)=1; %
                    filler_pat(1,1:171)=sem(36).vec;
                elseif pat == 2
                    constituent3(37)=1; %
                    filler_pat(1,1:171)=sem(37).vec;
                elseif pat == 3
                    constituent3(38)=1; %
                    filler_pat(1,1:171)=sem(38).vec;
                elseif pat == 4
                    constituent3(39)=1; %
                    filler_pat(1,1:171)=sem(39).vec;
                elseif pat == 5
                    constituent3(40)=1; %
                    filler_pat(1,1:171)=sem(40).vec;
                elseif pat == 6
                    constituent3(41)=1; %
                    filler_pat(1,1:171)=sem(41).vec;
                elseif pat == 7
                    constituent3(42)=1; %
                    filler_pat(1,1:171)=sem(42).vec;
                elseif pat == 8
                    constituent3(43)=1; %
                    filler_pat(1,1:171)=sem(43).vec;
                elseif pat == 9
                    constituent3(44)=1; %
                    filler_pat(1,1:171)=sem(44).vec;
                elseif pat == 10
                    constituent3(45)=1; %
                    filler_pat(1,1:171)=sem(45).vec;
                elseif pat == 11
                    constituent3(46)=1; %
                    filler_pat(1,1:171)=sem(46).vec;
                elseif pat == 12
                    constituent3(47)=1; %
                    filler_pat(1,1:171)=sem(47).vec;
                elseif pat == 13
                    constituent3(48)=1; %
                    filler_pat(1,1:171)=sem(48).vec;
                elseif pat == 14
                    constituent3(49)=1; %
                    filler_pat(1,1:171)=sem(49).vec;
                elseif pat == 15
                    constituent3(50)=1; %
                    filler_pat(1,1:171)=sem(50).vec;
                elseif pat == 16
                    constituent3(51)=1; %
                    filler_pat(1,1:171)=sem(51).vec;
                elseif pat == 17
                    constituent3(84)=1; %cereals (for catviol)
                    filler_pat(1,1:171)=sem(84).vec;
                elseif pat == 18
                    constituent3(85)=1; %coffee (for catviol)
                    filler_pat(1,1:171)=sem(85).vec;
                elseif pat == 19
                    constituent3(54)=1; %
                    filler_pat(1,1:171)=sem(54).vec;
                elseif pat == 20
                    constituent3(55)=1; %
                    filler_pat(1,1:171)=sem(55).vec;
                elseif pat == 21
                    constituent3(56)=1; %
                    filler_pat(1,1:171)=sem(56).vec;
                elseif pat == 22
                    constituent3(57)=1; %
                    filler_pat(1,1:171)=sem(57).vec;
                elseif pat == 23
                    constituent3(58)=1; %
                    filler_pat(1,1:171)=sem(58).vec;
                elseif pat == 24
                    constituent3(59)=1; %
                    filler_pat(1,1:171)=sem(59).vec;
                elseif pat == 25
                    constituent3(60)=1; %
                    filler_pat(1,1:171)=sem(60).vec;
                elseif pat == 26
                    constituent3(61)=1; %
                    filler_pat(1,1:171)=sem(61).vec;
                elseif pat == 27
                    constituent3(62)=1; %
                    filler_pat(1,1:171)=sem(62).vec;
                elseif pat == 28
                    constituent3(63)=1; %
                    filler_pat(1,1:171)=sem(63).vec;
                elseif pat == 29
                    constituent3(64)=1; %
                    filler_pat(1,1:171)=sem(64).vec;
                elseif pat == 30
                    constituent3(65)=1; %
                    filler_pat(1,1:171)=sem(65).vec;
                elseif pat == 31
                    constituent3(66)=1; %
                    filler_pat(1,1:171)=sem(66).vec;
                elseif pat == 32
                    constituent3(67)=1; %
                    filler_pat(1,1:171)=sem(67).vec;
                elseif pat == 33
                    constituent3(68)=1; %
                    filler_pat(1,1:171)=sem(68).vec;
                elseif pat == 34
                    constituent3(69)=1; %
                    filler_pat(1,1:171)=sem(69).vec;
                elseif pat == 35
                    constituent3(70)=1; %
                    filler_pat(1,1:171)=sem(70).vec;
                elseif pat == 36
                    constituent3(71)=1; %
                    filler_pat(1,1:171)=sem(71).vec;
                end

                    
          elseif (age > 25)&&(age<51)
              constituent1(2)=1;
              filler_age(1,1:171)=sem(2).vec;
                if pat == 1
                    constituent3(36)=1; %
                    filler_pat(1,1:171)=sem(36).vec;
                elseif pat == 2
                    constituent3(37)=1; %
                    filler_pat(1,1:171)=sem(37).vec;
                elseif pat == 3
                    constituent3(38)=1; %
                    filler_pat(1,1:171)=sem(38).vec;
                elseif pat == 4
                    constituent3(39)=1; %
                    filler_pat(1,1:171)=sem(39).vec;
                elseif pat == 5
                    constituent3(40)=1; %
                    filler_pat(1,1:171)=sem(40).vec;
                elseif pat == 6
                    constituent3(41)=1; %
                    filler_pat(1,1:171)=sem(41).vec;
                elseif pat == 7
                    constituent3(42)=1; %
                    filler_pat(1,1:171)=sem(42).vec;
                elseif pat == 8
                    constituent3(43)=1; %
                    filler_pat(1,1:171)=sem(43).vec;
                elseif pat == 9
                    constituent3(44)=1; %
                    filler_pat(1,1:171)=sem(44).vec;
                elseif pat == 10
                    constituent3(45)=1; %
                    filler_pat(1,1:171)=sem(45).vec;
                elseif pat == 11
                    constituent3(46)=1; %
                    filler_pat(1,1:171)=sem(46).vec;
                elseif pat == 12
                    constituent3(47)=1; %
                    filler_pat(1,1:171)=sem(47).vec;
                elseif pat == 13
                    constituent3(48)=1; %
                    filler_pat(1,1:171)=sem(48).vec;
                elseif pat == 14
                    constituent3(49)=1; %
                    filler_pat(1,1:171)=sem(49).vec;
                elseif pat == 15
                    constituent3(50)=1; %
                    filler_pat(1,1:171)=sem(50).vec;
                elseif pat == 16
                    constituent3(51)=1; %
                    filler_pat(1,1:171)=sem(51).vec;
                elseif pat == 17
                    constituent3(84)=1; %cereals (for catviol)
                    filler_pat(1,1:171)=sem(84).vec;
                elseif pat == 18
                    constituent3(85)=1; %coffee (for catviol)
                    filler_pat(1,1:171)=sem(85).vec;
                elseif pat == 19
                    constituent3(54)=1; %
                    filler_pat(1,1:171)=sem(54).vec;
                elseif pat == 20
                    constituent3(55)=1; %
                    filler_pat(1,1:171)=sem(55).vec;
                elseif pat == 21
                    constituent3(56)=1; %
                    filler_pat(1,1:171)=sem(56).vec;
                elseif pat == 22
                    constituent3(57)=1; %
                    filler_pat(1,1:171)=sem(57).vec;
                elseif pat == 23
                    constituent3(58)=1; %
                    filler_pat(1,1:171)=sem(58).vec;
                elseif pat == 24
                    constituent3(59)=1; %
                    filler_pat(1,1:171)=sem(59).vec;
                elseif pat == 25
                    constituent3(60)=1; %
                    filler_pat(1,1:171)=sem(60).vec;
                elseif pat == 26
                    constituent3(61)=1; %
                    filler_pat(1,1:171)=sem(61).vec;
                elseif pat == 27
                    constituent3(62)=1; %
                    filler_pat(1,1:171)=sem(62).vec;
                elseif pat == 28
                    constituent3(63)=1; %
                    filler_pat(1,1:171)=sem(63).vec;
                elseif pat == 29
                    constituent3(64)=1; %
                    filler_pat(1,1:171)=sem(64).vec;
                elseif pat == 30
                    constituent3(65)=1; %
                    filler_pat(1,1:171)=sem(65).vec;
                elseif pat == 31
                    constituent3(66)=1; %
                    filler_pat(1,1:171)=sem(66).vec;
                elseif pat == 32
                    constituent3(67)=1; %
                    filler_pat(1,1:171)=sem(67).vec;
                elseif pat == 33
                    constituent3(68)=1; %
                    filler_pat(1,1:171)=sem(68).vec;
                elseif pat == 34
                    constituent3(69)=1; %
                    filler_pat(1,1:171)=sem(69).vec;
                elseif pat == 35
                    constituent3(70)=1; %
                    filler_pat(1,1:171)=sem(70).vec;
                elseif pat == 36
                    constituent3(71)=1; %
                    filler_pat(1,1:171)=sem(71).vec;
                end
                
          elseif (age > 50)&&(age<76)
              constituent1(3)=1;
              filler_age(1,1:171)=sem(3).vec; 
                    
                 if pat == 1
                    constituent3(36)=1; %
                    filler_pat(1,1:171)=sem(36).vec;
                elseif pat == 2
                    constituent3(37)=1; %
                    filler_pat(1,1:171)=sem(37).vec;
                elseif pat == 3
                    constituent3(38)=1; %
                    filler_pat(1,1:171)=sem(38).vec;
                elseif pat == 4
                    constituent3(39)=1; %
                    filler_pat(1,1:171)=sem(39).vec;
                elseif pat == 5
                    constituent3(40)=1; %
                    filler_pat(1,1:171)=sem(40).vec;
                elseif pat == 6
                    constituent3(41)=1; %
                    filler_pat(1,1:171)=sem(41).vec;
                elseif pat == 7
                    constituent3(42)=1; %
                    filler_pat(1,1:171)=sem(42).vec;
                elseif pat == 8
                    constituent3(43)=1; %
                    filler_pat(1,1:171)=sem(43).vec;
                elseif pat == 9
                    constituent3(44)=1; %
                    filler_pat(1,1:171)=sem(44).vec;
                elseif pat == 10
                    constituent3(45)=1; %
                    filler_pat(1,1:171)=sem(45).vec;
                elseif pat == 11
                    constituent3(46)=1; %
                    filler_pat(1,1:171)=sem(46).vec;
                elseif pat == 12
                    constituent3(47)=1; %
                    filler_pat(1,1:171)=sem(47).vec;
                elseif pat == 13
                    constituent3(48)=1; %
                    filler_pat(1,1:171)=sem(48).vec;
                elseif pat == 14
                    constituent3(49)=1; %
                    filler_pat(1,1:171)=sem(49).vec;
                elseif pat == 15
                    constituent3(50)=1; %
                    filler_pat(1,1:171)=sem(50).vec;
                elseif pat == 16
                    constituent3(51)=1; %
                    filler_pat(1,1:171)=sem(51).vec;
                elseif pat == 17
                    constituent3(84)=1; %cereals (for catviol)
                    filler_pat(1,1:171)=sem(84).vec;
                elseif pat == 18
                    constituent3(85)=1; %coffee (for catviol)
                    filler_pat(1,1:171)=sem(85).vec;
                elseif pat == 19
                    constituent3(54)=1; %
                    filler_pat(1,1:171)=sem(54).vec;
                elseif pat == 20
                    constituent3(55)=1; %
                    filler_pat(1,1:171)=sem(55).vec;
                elseif pat == 21
                    constituent3(56)=1; %
                    filler_pat(1,1:171)=sem(56).vec;
                elseif pat == 22
                    constituent3(57)=1; %
                    filler_pat(1,1:171)=sem(57).vec;
                elseif pat == 23
                    constituent3(58)=1; %
                    filler_pat(1,1:171)=sem(58).vec;
                elseif pat == 24
                    constituent3(59)=1; %
                    filler_pat(1,1:171)=sem(59).vec;
                elseif pat == 25
                    constituent3(60)=1; %
                    filler_pat(1,1:171)=sem(60).vec;
                elseif pat == 26
                    constituent3(61)=1; %
                    filler_pat(1,1:171)=sem(61).vec;
                elseif pat == 27
                    constituent3(62)=1; %
                    filler_pat(1,1:171)=sem(62).vec;
                elseif pat == 28
                    constituent3(63)=1; %
                    filler_pat(1,1:171)=sem(63).vec;
                elseif pat == 29
                    constituent3(64)=1; %
                    filler_pat(1,1:171)=sem(64).vec;
                elseif pat == 30
                    constituent3(65)=1; %
                    filler_pat(1,1:171)=sem(65).vec;
                elseif pat == 31
                    constituent3(66)=1; %
                    filler_pat(1,1:171)=sem(66).vec;
                elseif pat == 32
                    constituent3(67)=1; %
                    filler_pat(1,1:171)=sem(67).vec;
                elseif pat == 33
                    constituent3(68)=1; %
                    filler_pat(1,1:171)=sem(68).vec;
                elseif pat == 34
                    constituent3(69)=1; %
                    filler_pat(1,1:171)=sem(69).vec;
                elseif pat == 35
                    constituent3(70)=1; %
                    filler_pat(1,1:171)=sem(70).vec;
                elseif pat == 36
                    constituent3(71)=1; %
                    filler_pat(1,1:171)=sem(71).vec;
                end

         elseif age > 75
             constituent1(4)=1;
             filler_age(1,1:171)=sem(4).vec;
                    
                if pat == 1
                    constituent3(36)=1; %
                    filler_pat(1,1:171)=sem(36).vec;
                elseif pat == 2
                    constituent3(37)=1; %
                    filler_pat(1,1:171)=sem(37).vec;
                elseif pat == 3
                    constituent3(38)=1; %
                    filler_pat(1,1:171)=sem(38).vec;
                elseif pat == 4
                    constituent3(39)=1; %
                    filler_pat(1,1:171)=sem(39).vec;
                elseif pat == 5
                    constituent3(40)=1; %
                    filler_pat(1,1:171)=sem(40).vec;
                elseif pat == 6
                    constituent3(41)=1; %
                    filler_pat(1,1:171)=sem(41).vec;
                elseif pat == 7
                    constituent3(42)=1; %
                    filler_pat(1,1:171)=sem(42).vec;
                elseif pat == 8
                    constituent3(43)=1; %
                    filler_pat(1,1:171)=sem(43).vec;
                elseif pat == 9
                    constituent3(44)=1; %
                    filler_pat(1,1:171)=sem(44).vec;
                elseif pat == 10
                    constituent3(45)=1; %
                    filler_pat(1,1:171)=sem(45).vec;
                elseif pat == 11
                    constituent3(46)=1; %
                    filler_pat(1,1:171)=sem(46).vec;
                elseif pat == 12
                    constituent3(47)=1; %
                    filler_pat(1,1:171)=sem(47).vec;
                elseif pat == 13
                    constituent3(48)=1; %
                    filler_pat(1,1:171)=sem(48).vec;
                elseif pat == 14
                    constituent3(49)=1; %
                    filler_pat(1,1:171)=sem(49).vec;
                elseif pat == 15
                    constituent3(50)=1; %
                    filler_pat(1,1:171)=sem(50).vec;
                elseif pat == 16
                    constituent3(51)=1; %
                    filler_pat(1,1:171)=sem(51).vec;
                elseif pat == 17
                    constituent3(84)=1; %cereals (for catviol)
                    filler_pat(1,1:171)=sem(84).vec;
                elseif pat == 18
                    constituent3(85)=1; %coffee (for catviol)
                    filler_pat(1,1:171)=sem(85).vec;
                elseif pat == 19
                    constituent3(54)=1; %
                    filler_pat(1,1:171)=sem(54).vec;
                elseif pat == 20
                    constituent3(55)=1; %
                    filler_pat(1,1:171)=sem(55).vec;
                elseif pat == 21
                    constituent3(56)=1; %
                    filler_pat(1,1:171)=sem(56).vec;
                elseif pat == 22
                    constituent3(57)=1; %
                    filler_pat(1,1:171)=sem(57).vec;
                elseif pat == 23
                    constituent3(58)=1; %
                    filler_pat(1,1:171)=sem(58).vec;
                elseif pat == 24
                    constituent3(59)=1; %
                    filler_pat(1,1:171)=sem(59).vec;
                elseif pat == 25
                    constituent3(60)=1; %
                    filler_pat(1,1:171)=sem(60).vec;
                elseif pat == 26
                    constituent3(61)=1; %
                    filler_pat(1,1:171)=sem(61).vec;
                elseif pat == 27
                    constituent3(62)=1; %
                    filler_pat(1,1:171)=sem(62).vec;
                elseif pat == 28
                    constituent3(63)=1; %
                    filler_pat(1,1:171)=sem(63).vec;
                elseif pat == 29
                    constituent3(64)=1; %
                    filler_pat(1,1:171)=sem(64).vec;
                elseif pat == 30
                    constituent3(65)=1; %
                    filler_pat(1,1:171)=sem(65).vec;
                elseif pat == 31
                    constituent3(66)=1; %
                    filler_pat(1,1:171)=sem(66).vec;
                elseif pat == 32
                    constituent3(67)=1; %
                    filler_pat(1,1:171)=sem(67).vec;
                elseif pat == 33
                    constituent3(68)=1; %
                    filler_pat(1,1:171)=sem(68).vec;
                elseif pat == 34
                    constituent3(69)=1; %
                    filler_pat(1,1:171)=sem(69).vec;
                elseif pat == 35
                    constituent3(70)=1; %
                    filler_pat(1,1:171)=sem(70).vec;
                elseif pat == 36
                    constituent3(71)=1; %
                    filler_pat(1,1:171)=sem(71).vec;
                end

                end
            
            
end
    

role_filler_act= horzcat(filler_act(1,1:171),role_act(1,172:176));
role_filler_age= horzcat(filler_age(1,1:171),role_age(1,172:176));
role_filler_pat= horzcat(filler_pat(1,1:171),role_pat(1,172:176));
role_filler_loc= horzcat(filler_loc(1,1:171),role_loc(1,172:176));
role_filler_sit= horzcat(filler_sit(1,1:171),role_sit(1,172:176));


        
c = c - 1; 

%print sequence of constituents
ID = fopen ('sentence_standard.pat','w'); 
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
ID2 = fopen('roleFiller_standard.pat','w');

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
