
% Plotear la campana de Gauss (distribuci�n normal) de los datos x
clc,close all;
x=-3:0.1:3;
dx = [];%[(493-433)/279;(480-423)/249;(489-431)/276;(468-400)/249;(524-449)/340;(490-432)/284;(469-424)/268;(480-415)/261;(437-410)/241;(500-440)/308;(484-439)/268;(452-417)/270;(463-409)/269;(455-436)/266;(480-439)/312;(488-416)/270;(472-390)/263;(481-398)/285;(486-421)/281;(485-376)/299;(500-408)/324;(496-444)/267;(465-428)/261;(464-428)/248;(451-418)/246;(476-440)/295;(484-441)/280;(492-421)/276;(500-458)/281;(486-459)/310;(504-446)/347;(428-410)/58;(275-263)/57;(387-379)/44; ];  
dy = [];%[(371-328)/428;(349-311)/382;(369-320)/423;(379-308)/384;(340-296)/520;(356-334)/441;(366-328)/416;(377-318)/402;(357-310)/372;(376-318)/472;(346-338)/410;(360-314)/414;(371-315)/416;(380-323)/409;(361-294)/481;(368-315)/415;(370-306)/409;(350-305)/433;(386-300)/428;(358-294)/460;(372-297)/496;(371-329)/406;(374-308)/405;(374-319)/379;(369-306)/379;(365-293)/458;(378-310)/430;(385-310)/422;(382-295)/429;(382-287)/471;(387-332)/530;(113-96)/90;(368-352)/89;(207-196)/69; ];
  
  histogram(x,6)
  figure
  histogram(y,6)

promedio = sum(x)/length(x);
standar_deviation = std(x);

y = normpdf(x,promedio,standar_deviation);
y = x./standar_deviation;
plot(x,y)