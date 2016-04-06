insert into types values('type1','blackbox','1st floor classroom blackbox'),('type2','chalkbox','1st floor classroom chalkbox'),('type3','amplifierbox','1st floor classroom amplifierbox'),('type4','room','1st floor classroom'),('type5','door','1st floor classroom left door '),('type6','beam','1st floor classroom beam'),('type7','bench','1st floor classroom bench'),('type8','table','1st floor classroom table'),('type9','stage','1st floor classroom stage'),('type11','switch board','1st floor classroom switch board'),('type12','PA amplifier','1st floor classroom PA amplifier');


insert into typeInheritance values('type1','type2'),('type2','type3'),('type3','type4'),('type4','type5'),('type5','type1');


insert into containerConcreteTypes values('type1',55,45,47,4,'cBlackBox'),('type2',7,9,9,1,'cChalkBox'),('type3',70,45,50,5,'cPA-AmplifierBox'),('type4',300,612,1360,30,'cRoom ');

insert into wall values('blackboxtopface',0,0,0,55,45),('blackboxbottomface',0,0,0,55,45),('blackboxleftface',0,0,0,45,55),('blackboxrightface',0,0,0,45,55),('blackboxfrontface',0,0,0,45,47),('blackboxbackface',0,0,0,45,47);
insert into wall values('chalkboxtopface',150,150,150,7,9),('chalkboxbottomface',150,150,150,57,9),('chalkboxleftface',150,150,150,9,9),('chalkboxrightface',250,250,250,9,9),('chalkboxfrontface',150,150,150,9,9),('chalkboxbackface',150,150,150,9,9);
insert into wall values('roomtopface',250,250,250,300,612),('roombottomface',250,250,250,300,612),('roomleftface',250,250,250,612,360),('roomrightface',250,250,250,612,360),('roomfrontface',250,250,250,360,300),('roombackface',250,250,250,360,300);
insert into wall values('PAboxtopface',255,255,255,70,45),('PAboxbottomface',255,255,255,70,45),('PAboxleftface',255,255,255,45,50),('PAboxrightface',255,255,255,45,50),('PAboxfrontface',255,255,255,70,50),('PAboxbackface',255,255,255,70,50);
insert into wall values('PAtopface',255,255,255,35,25),('PAbottomface',255,255,255,35,25),('PAleftface',255,255,255,25,30),('PArightface',255,255,255,25,30),('PAfrontface',255,255,255,35,30),('PAbackface',255,255,255,35,30);
insert into wall values('benchtopface',255,255,255,35,25),('benchbottomface',255,255,255,35,25),('benchleftface',255,255,255,25,30),('benchrightface',255,255,255,25,30),('benchfrontface',255,255,255,35,30),('benchbackface',255,255,255,35,30);
insert into wall values('tabletopface',40,40,40,35,25),('tablebottomface',40,40,40,35,25),('tableleftface',40,40,40,25,30),('tablerightface',40,40,40,25,30),('tablefrontface',40,40,40,35,30),('tablebackface',40,40,40,35,30);
insert into wall values('stagetopface',255,255,255,35,25),('stagebottomface',255,255,255,35,25),('stageleftface',255,255,255,25,30),('stagerightface',255,255,255,25,30),('stagefrontface',255,255,255,35,30),('stagebackface',255,255,255,35,30);
insert into wall values('beamtopface',285,285,285,35,25),('beambottomface',285,285,285,35,25),('beamleftface',285,285,285,25,30),('beamrightface',285,285,285,25,30),('beamfrontface',285,285,285,35,30),('beambackface',285,285,285,35,30);


insert into containerConcreteTypeFaces values ('type1','blackboxtopface','blackboxbottomface','blackboxleftface','blackboxrightface','blackboxfrontface','blackboxbackface'),
('type3','PAboxtopface','PAboxbottomface','PAboxleftface','PAboxrightface','PAboxfrontface','PAboxbackface'),
('type2','chalkboxtopface','chalkboxbottomface','chalkboxleftface','chalkboxrightface','chalkboxfrontface','chalkboxbackface');
insert into containerConcreteTypeFaces values ('type4','roomtopface','roombottomface','roomleftface','roomrightface','roomfrontface','roombackface');



insert into containerConcreteTypeFacesDoors values('roomleftface','rlf01','type4',150,250,200,50,120,80,39);



insert into nonContainerConcreteTypes values('type6',56,26,620,'ncBeam'),('type7',75,75,91,'ncBeanch'),('type11',10,8,10,'ncswitchBoard'),('type9',30,610,200,'ncStage'),('type12',35,30,25,'ncPA'),('type7',90,75,75,'ncbench'),('type8',90,115,85,'nctable');



insert into properties values('pr1','Fragile',''),('pr2','Expiry',''),('pr3','Weight',''),('pr4','Temperature',''),('pr5','SideUp',''),('pr6','waterproof','');



insert into propertyTypes values('prtype1','pr1','bool',''),('prtype2','pr2','date',''),('prtype3','pr3','number',''),('prtype4','pr4','number',''),('prtype5','pr5','string',''),('prtype6','pr6','string','');



insert into measurementUnits values('unit1','cm'),('unit2','celcius'),('unit3','kg'),('unit4','percent'),('unit5','date');


insert into containerConcreteTypeProperties values('type1','pr2','12-12-2020','unit5',''),('type2','pr3','1','unit3',''),('type3','pr4','20','unit4',''),('type4','pr5','122','unit1','');

insert into nonContainerConcreteTypeProperties values('type6','pr1','false','unit4',''),('type7','pr3','5','unit3',''),('type12','pr2','12-12-2020','unit5','');

insert into objects values('con00'),('con01'),('con02'),('con03'),('noncon01'),('noncon03'),('noncon05'),('noncon04');


insert into containerObjects values('con01','type1','','black box object'),('con02','type2','','chalk object'),('con03','type3','','PA amplifier box object'),('con00','type4','','room object');


insert into nonContainerObjects values('noncon01','type6','','beam object'),('noncon03','type7','','beanch object'),('noncon05','type11','','switch board object'),('noncon04','type12','','PA amplifier object');


insert into containerObjectProperties values('con01','usrcon01','pr2','12-12-2020','','usrblackbox'),('con02','usrcon02','pr3','1','','usrchalkbox'),('con00','usrcon00','pr5','122','','usrroom');


insert into nonContainerObjectProperties values ('noncon01','usrnoncon01','pr1','false','','usrbeam'),('noncon03','usrnoncon03','pr3','5','',''),('noncon05','usrnoncon05','pr6','yes','',''),('noncon04','usrnoncon04','pr2','12-12-2020','','');


insert into childObjectList values('con00','noncon01',56,26,620,'ABCD','DCGH'),('con00','noncon03',75,75,91,'ABCD','ABEF'),('con03','noncon04',15,5,10,'ABCD','DCGH'),('con00','con03',220,312,50,'ABCD','BCGF'),('con00','noncon05',1,510,300,'ABCD','ADHE');


insert into compulsoryProperties values('pr2'),('pr3');


insert into immutableProperties values ('pr2'),('pr1'),('pr3');




