all_feat = {'passive_voice','woman','man','girl','boy','feed','plant','read','write',...
    'look_at','like','living_room','garden','lake','park','balkony','river','backyard','veranda','bedroom',...
    'novel','email','sms','paper','newspaper','letter','rose','daisy','tulip','robin','canary','sparrow',...
    'holiday','sunday','person','agent','adult','female','male','child','action','done_to_animals',...
    'done_to_plants','done_with_earth',...
    'done_with_letters','perceptual','productive','visual','positive','location','inside','loc_for_leisure','outside','loc_with_animals','loc_to_step_out','loc_with_water','loc_behind_house','loc_front_of_house','loc_to_sleep',...
    'contains_language','contains_letters','art',...
    'communication','short','scientific','information','on_paper','can_grow','has_roots','has_petals','red','yellow','colorful',...
    'can_move','can_fly','brown',...
    'situation',...
    'special_day','no_work','free_time','to_relax','poacherfeat1','poacherfeat2','poacher',...
    'foxfeat1','foxfeat2','fox','huntfeat1','huntfeat2','hunt','approachfeat1','approachfeat2','approach','stoodfeat1','stoodfeat2','stood',...
    'watchfeat1','watchfeat2','watch','runfeat1','runfeat2','run','age_onefeat1','age_onefeat2','age_one','pat_onefeat1','pat_onefeat2','pat_one',...
    'act1_onefeat1','act1_onefeat2','act1_one',...
    'age_twofeat1','age_twofeat2','age_two','pat_twofeat1','pat_twofeat2','pat_two',...
    'act1_twofeat1','act1_twofeat2','act1_two',...
    'age_threefeat1','age_threefeat2','age_three','pat_threefeat1','pat_threefeat2','pat_three',...
    'act1_threefeat1','act1_threefeat2','act1_three',...
    'age_fourfeat1','age_fourfeat2','age_four','pat_fourfeat1','pat_fourfeat2','pat_four',...
    'act1_fourfeat1','act1_fourfeat2','act1_four',...
    'age_fivefeat1','age_fivefeat2','age_five','pat_fivefeat1','pat_fivefeat2','pat_five',...
    'act1_fivefeat1','act1_fivefeat2','act1_five',...
    'age_sixfeat1','age_sixfeat2','age_six','pat_sixfeat1','pat_sixfeat2','pat_six',...
    'act1_sixfeat1','act1_sixfeat2','act1_six',...
    'age_sevenfeat1','age_sevenfeat2','age_seven','pat_sevenfeat1','pat_sevenfeat2','pat_seven',...
    'act1_sevenfeat1','act1_sevenfeat2','act1_seven',...
    'pat3_deerfeat1','pat3_deerfeat2','pat3_deer','pat3_onefeat1','pat3_onefeat2','pat3_one','pat3_twofeat1','pat3_twofeat2','pat3_two','pat3_threefeat1','pat3_threefeat2','pat3_three'};


%agents
sem(1).con={'woman'};
sem(1).feat={'person','agent','adult','female','woman'};
sem(2).con={'man'};
sem(2).feat={'person','agent','adult','male','man'};
sem(3).con={'girl'};
sem(3).feat={'person','agent','child','female','girl'};
sem(4).con={'boy'};
sem(4).feat={'person','agent','child','male','boy'};
sem(5).con={'poacher'};
sem(5).feat={'agent','poacherfeat1','poacherfeat2','poacher'};

%actions
sem(8).con={'feed'};
sem(8).feat={'action','done_to_animals','done_with_food','feed'};
sem(10).con={'plant'};
sem(10).feat={'action','done_to_plants','done_with_earth','plant'};
sem(14).con={'read'};
sem(14).feat={'action','done_with_letters','perceptual','read'};
sem(15).con={'write'};
sem(15).feat={'action','done_with_letters','productive','write'};
sem(16).con={'look_at'};
sem(16).feat={'action','visual','look_at'};
sem(17).con={'like'};
sem(17).feat={'action','positive','like'};

%locations
sem(19).con={'living_room'};
sem(19).feat={'location','inside','loc_for_leisure','living_room'};
sem(20).con={'garden'};
sem(20).feat={'location','outside','loc_for_leisure','garden'};
sem(21).con={'lake'};
sem(21).feat={'location','outside','loc_with_animals','lake'};

%concepts for the scenarios intended to capture the van Herten materials
sem(26).con={'fox'};
sem(26).feat={'agent','foxfeat1','foxfeat2','fox'};
sem(27).con={'hunt'};
sem(27).feat={'action','huntfeat1','huntfeat2','hunt'};
sem(28).con={'approach'};
sem(28).feat={'action','approachfeat1','approachfeat2','approach'};
sem(29).con={'stood'};
sem(29).feat={'action','stoodfeat1','stoodfeat2','stood'};
sem(32).con={'watch'};
sem(32).feat={'action','watchfeat1','watchfeat2','watch'};
sem(33).con={'run'};
sem(33).feat={'action','runfeat1','runfeat2','run'};
sem(34).con={'age_one'};
sem(34).feat={'agent','age_onefeat1','age_onefeat2','age_one'};
sem(52).con={'pat_one'};
sem(52).feat={'agent','pat_onefeat1','pat_onefeat2','pat_one'};
sem(53).con={'act1_one'};
sem(53).feat={'action','act1_onefeat1','act1_onefeat2','act1_one'};

%reading/writing things
sem(54).con={'novel'};
sem(54).feat={'contains_language','contains_letters','art','novel'};
sem(55).con={'email'};
sem(55).feat={'contains_language','contains_letters','communication','email'};
sem(56).con={'sms'};
sem(56).feat={'contains_language','contains_letters','communication','short','sms'};
sem(57).con={'paper'};
sem(57).feat={'contains_language','contains_letters','scientific','paper'};
sem(58).con={'newspaper'};
sem(58).feat={'contains_language','contains_letters','information','newspaper'};
sem(59).con={'letter'};
sem(59).feat={'contains_language','contains_letters','communication','on_paper','letter'};

%living things
%flowers
sem(60).con={'rose'};
sem(60).feat={'can_grow','has_roots','has_petals','red','rose'};
sem(61).con={'daisy'};
sem(61).feat={'can_grow','has_roots','has_petals','yellow','daisy'};
sem(62).con={'tulip'};
sem(62).feat={'can_grow','has_roots','has_petals','colorful','tulip'};

%birds
sem(66).con={'robin'};
sem(66).feat={'can_grow','can_move','can_fly','red','robin'};
sem(67).con={'canary'};
sem(67).feat={'can_grow','can_move','can_fly','yellow','canary'};
sem(68).con={'sparrow'};
sem(68).feat={'can_grow','can_move','can_fly','brown','sparrow'};

%function words
sem(72).con={'during'};
sem(72).feat={};
sem(73).con={'at'};
sem(73).feat={};
sem(74).con={'op'};%function1
sem(74).feat={};
sem(75).con={'was by'};
sem(75).feat={};
sem(76).con={'voor'};%function2
sem(76).feat={};

%locations
sem(78).con={'park'};
sem(78).feat={'location','outside','loc_with_animals','park'};
sem(79).con={'balkony'};
sem(79).feat={'location','outside','loc_to_step_out','balkony'};
sem(80).con={'river'};
sem(80).feat={'location','outside','loc_with_water','river'};
sem(81).con={'backyard'};
sem(81).feat={'location','outside','loc_behind_house','backyard'};
sem(82).con={'veranda'};
sem(82).feat={'location','outside','loc_front_of_house','veranda'};
sem(83).con={'bedroom'};
sem(83).feat={'location','inside','loc_to_sleep','bedroom'};

%situations
sem(86).con={'holiday'};
sem(86).feat={'situation','special_day','no_work','holiday'};
sem(87).con={'sunday'};
sem(87).feat={'situation','free_time','to_relax','sunday'};

%concepts for the scenarios intended to capture the van Herten materials
sem(95).con={'age_two'};
sem(95).feat={'agent','age_twofeat1','age_twofeat2','age_two'};
sem(96).con={'pat_two'};
sem(96).feat={'agent','pat_twofeat1','pat_twofeat2','pat_two'};
sem(97).con={'act1_two'};
sem(97).feat={'action','act1_twofeat1','act1_twofeat2','act1_two'};

sem(104).con={'age_three'};
sem(104).feat={'agent','age_threefeat1','age_threefeat2','age_three'};
sem(105).con={'pat_three'};
sem(105).feat={'agent','pat_threefeat1','pat_threefeat2','pat_three'};
sem(106).con={'act1_three'};
sem(106).feat={'action','act1_threefeat1','act1_threefeat2','act1_three'};

sem(113).con={'age_four'};
sem(113).feat={'agent','age_fourfeat1','age_fourfeat2','age_four'};
sem(114).con={'pat_four'};
sem(114).feat={'agent','pat_fourfeat1','pat_fourfeat2','pat_four'};
sem(115).con={'act1_four'};
sem(115).feat={'action','act1_fourfeat1','act1_fourfeat2','act1_four'};

sem(122).con={'age_five'};
sem(122).feat={'agent','age_fivefeat1','age_fivefeat2','age_five'};
sem(123).con={'pat_five'};
sem(123).feat={'agent','pat_fivefeat1','pat_fivefeat2','pat_five'};
sem(124).con={'act1_five'};
sem(124).feat={'action','act1_fivefeat1','act1_fivefeat2','act1_five'};

sem(131).con={'age_six'};
sem(131).feat={'agent','age_sixfeat1','age_sixfeat2','age_six'};
sem(132).con={'pat_six'};
sem(132).feat={'agent','pat_sixfeat1','pat_sixfeat2','pat_six'};
sem(133).con={'act1_six'};
sem(133).feat={'action','act1_sixfeat1','act1_sixfeat2','act1_six'};

sem(140).con={'age_seven'};
sem(140).feat={'agent','age_sevenfeat1','age_sevenfeat2','age_seven'};
sem(141).con={'pat_seven'};
sem(141).feat={'agent','pat_sevenfeat1','pat_sevenfeat2','pat_seven'};
sem(142).con={'act1_seven'};
sem(142).feat={'action','act1_sevenfeat1','act1_sevenfeat2','act1_seven'};

sem(167).con={'has'};
sem(167).feat={};

sem(176).con={'deer'};
sem(176).feat={'patient','pat3_deerfeat1','pat3_deerfeat2','pat3_deer'};
sem(177).con={'pat3_one'};
sem(177).feat={'patient','pat3_onefeat1','pat3_onefeat2','pat3_one'};
sem(178).con={'pat3_two'};
sem(178).feat={'patient','pat3_twofeat1','pat3_twofeat2','pat3_two'};
sem(179).con={'pat3_three'};
sem(179).feat={'patient','pat3_threefeat1','pat3_threefeat2','pat3_three'};


for n = 1:length(sem) 
    sem(n).vec = zeros(1,length(all_feat));
end

for i = 1:length(sem) 
    a = zeros(length(sem(i).feat),length(all_feat));
    for j = 1:length(all_feat)
        for k = 1:length(sem(i).feat)
            a(k,j) = strcmp(sem(i).feat(k), all_feat(j));
        end
    end
    sem(i).vec = sum(a); 
end

m = zeros(length(sem),length(all_feat)); 
for l = 1:length(sem) 
    m(l,:) = sem(l).vec;
end

