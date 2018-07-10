all_feat = {'passive_voice','woman','man','girl','boy','drink_v','eat','feed','fish','plant','water','play','wear','read','write',...
    'look_at','like','kitchen','living_room','garden','lake','park','balkony','river','backyard','veranda','bedroom',...
    'egg','toast','cereals','soup','pizza','salad','iced_tea','juice','lemonade','cacao','tea','coffee',...
    'chess','monopoly','backgammon','jeans','shirt','pajamas','novel','email','sms','paper','newspaper','letter','rose','daisy','tulip','pine','oak','birch','robin','canary','sparrow','sunfish','salmon','eel',...
    'breakfast','dinner','excursion','afternoon','holiday','sunday','morning','evening','person','agent','adult','female','male','child','action','consume','done_with_liquids','done_with_food','done_to_animals',...
    'done_to_fish','done_close_water','done_to_plants','done_with_earth','done_with_water','done_with_games','done_for_fun','done_with_clothes','done_for_warming',...
    'done_with_letters','perceptual','productive','visual','positive','location','inside','loc_to_eat','loc_for_leisure','outside','loc_with_animals','loc_to_step_out','loc_with_water','loc_behind_house','loc_front_of_house','loc_to_sleep',...
    'consumeable','food','game','entertaining','strategic','with_dice','old',...
    'garment','to_cover_body','contains_language','contains_letters','art',...
    'communication','short','scientific','information','on_paper','can_grow','has_roots','has_petals','red','yellow','colorful','has_bark','green',...
    'tall','white_bark','can_move','can_fly','brown','can_swim','long','white','brown','healthy','in_bowl','round','light',...
    'drink','from_fruit','from_leaves','sweet','with_chocolate','hot','activating','for_legs','for_upper_part','for_night','situation','food_related','in_the_morning','in_the_evening',...
    'going_somewhere','to_enjoy','after_lunch','day_time','special_day','no_work','free_time','to_relax','early','wake_up','late','get_tired'};



%agents
sem(1).con={'woman'};
sem(1).feat={'person','agent','adult','female','woman'};
sem(2).con={'man'};
sem(2).feat={'person','agent','adult','male','man'};
sem(3).con={'girl'};
sem(3).feat={'person','agent','child','female','girl'};
sem(4).con={'boy'};
sem(4).feat={'person','agent','child','male','boy'};

%actions
sem(6).con={'drink_v'};
sem(6).feat={'action','consume','done_with_liquids','drink_v'};
sem(7).con={'eat'};
sem(7).feat={'action','consume','done_with_food','eat'};
sem(8).con={'feed'};
sem(8).feat={'action','done_to_animals','done_with_food','feed'};
sem(9).con={'fish'};
sem(9).feat={'action','done_to_fish','done_close_water','fish'};
sem(10).con={'plant'};
sem(10).feat={'action','done_to_plants','done_with_earth','plant'};
sem(11).con={'water'};
sem(11).feat={'action','done_to_plants','done_with_water','water'};
sem(12).con={'play'};
sem(12).feat={'action','done_with_games','done_for_fun','play'};
sem(13).con={'wear'};
sem(13).feat={'action','done_with_clothes','done_for_warming','wear'};
sem(14).con={'read'};
sem(14).feat={'action','done_with_letters','perceptual','read'};
sem(15).con={'write'};
sem(15).feat={'action','done_with_letters','productive','write'};
sem(16).con={'look_at'};
sem(16).feat={'action','visual','look_at'};
sem(17).con={'like'};
sem(17).feat={'action','positive','like'};

%locations
sem(18).con={'kitchen'};
sem(18).feat={'location','inside','loc_to_eat','kitchen'};
sem(19).con={'living_room'};
sem(19).feat={'location','inside','loc_for_leisure','living_room'};
sem(20).con={'garden'};
sem(20).feat={'location','outside','loc_for_leisure','garden'};
sem(21).con={'lake'};
sem(21).feat={'location','outside','loc_with_animals','lake'};

%situations 
sem(22).con={'breakfast'};
sem(22).feat={'situation','food_related','in_the_morning','breakfast'};
sem(23).con={'dinner'};
sem(23).feat={'situation','food_related','in_the_evening','dinner'};
sem(24).con={'excursion'};
sem(24).feat={'situation','going_somewhere','to_enjoy','excursion'};
sem(25).con={'afternoon'};
sem(25).feat={'situation','after_lunch','day_time','afternoon'};


%patients
%food and drinks

%food
sem(36).con={'egg'};
sem(36).feat={'consumeable','food','white','egg'};
sem(37).con={'toast'};
sem(37).feat={'consumeable','food','brown','toast'};
sem(38).con={'soup'};
sem(38).feat={'consumeable','food','in_bowl','soup'};
sem(39).con={'pizza'};
sem(39).feat={'consumeable','food','round','pizza'};
sem(40).con={'salad'};
sem(40).feat={'consumeable','food','light','salad'};

%drinks 
sem(41).con={'iced_tea'};
sem(41).feat={'consumeable','drink','from_leaves','iced_tea'};
sem(42).con={'juice'};
sem(42).feat={'consumeable','drink','from_fruit','juice'};
sem(43).con={'lemonade'};
sem(43).feat={'consumeable','drink','sweet','lemonade'};
sem(44).con={'cacao'};
sem(44).feat={'consumeable','drink','with_chocolate','cacao'};
sem(45).con={'tea'};
sem(45).feat={'consumeable','drink','hot','tea'};

%artifacts
%games
sem(46).con={'chess'};
sem(46).feat={'game','entertaining','strategic','chess'};
sem(47).con={'monopoly'};
sem(47).feat={'game','entertaining','with_dice','monopoly'};
sem(48).con={'backgammon'};
sem(48).feat={'game','entertaining','old','backgammon'};

%garments
sem(49).con={'jeans'};
sem(49).feat={'garment','to_cover_body','for_legs','jeans'}; 
sem(50).con={'shirt'};
sem(50).feat={'garment','to_cover_body','for_upper_part','shirt'};
sem(51).con={'pajamas'};
sem(51).feat={'garment','to_cover_body','for_night','pajamas'};

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
%trees
sem(63).con={'pine'};
sem(63).feat={'can_grow','has_roots','has_bark','green','pine'};
sem(64).con={'oak'};
sem(64).feat={'can_grow','has_roots','has_bark','tall','oak'};
sem(65).con={'birch'};
sem(65).feat={'can_grow','has_roots','has_bark','white_bark','birch'};
%birds
sem(66).con={'robin'};
sem(66).feat={'can_grow','can_move','can_fly','red','robin'};
sem(67).con={'canary'};
sem(67).feat={'can_grow','can_move','can_fly','yellow','canary'};
sem(68).con={'sparrow'};
sem(68).feat={'can_grow','can_move','can_fly','brown','sparrow'};
%fish
sem(69).con={'sunfish'};
sem(69).feat={'can_grow','can_move','can_swim','yellow','sunfish'};
sem(70).con={'salmon'};
sem(70).feat={'can_grow','can_move','can_swim','red','salmon'};
sem(71).con={'eel'};
sem(71).feat={'can_grow','can_move','can_swim','long','eel'};

%function words
sem(72).con={'during'};
sem(72).feat={};
sem(73).con={'at'};
sem(73).feat={};
sem(74).con={'has'};%changed relative to standard
sem(74).feat={};
sem(75).con={'was by'};%changed relative to standard
sem(75).feat={};
sem(76).con={'with'};
sem(76).feat={};

%more locations
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

%more foods and drinks
sem(84).con={'cereals'}; 
sem(84).feat={'consumeable','food','healthy','cereals'};
sem(85).con={'coffee'}; 
sem(85).feat={'consumeable','drink','activating','coffee'};

%more situations
sem(86).con={'holiday'};
sem(86).feat={'situation','special_day','no_work','holiday'};
sem(87).con={'sunday'};
sem(87).feat={'situation','free_time','to_relax','sunday'};
sem(88).con={'morning'};
sem(88).feat={'situation','early','wake_up','morning'};
sem(89).con={'evening'};
sem(89).feat={'situation','late','get_tired','evening'};



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

