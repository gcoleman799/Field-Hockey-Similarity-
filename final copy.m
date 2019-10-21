
function plotOptions


fig = uifigure ('Name', 'Most Similar Field Hockey Teams', 'Color', [0 0.4470 0.7410]); 

intro1 = uilabel(fig,...
    'Position',[30 260 500 200],...
    'Text','This tool allows you to use two different methods, Cosine Similarity', ...
    'FontName', 'Arial', ...
    'FontSize', 16, ...
    'fontColor', 'w' ...
    );
intro2 = uilabel(fig,...
    'Position',[30 240 500 200],...
    'Text','and Euclidean Distance to find the 10 most similar teams to any', ...
    'FontName', 'Arial', ...
    'FontSize', 16, ...
    'fontColor', 'w' ...
    );
intro2 = uilabel(fig,...
    'Position',[30 220 500 200],...
    'Text','other NCAA Division 1 Field Hockey Team.', ...
    'FontName', 'Arial', ...
    'FontSize', 16, ...
    'fontColor', 'w' ...
    );

label1 = uilabel(fig,...
    'Position',[100 164 100 200],...
    'Text','Choose a method:', ...
    'FontName', 'Arial', ...
    'FontSize', 12, ...
    'fontColor', 'w' ...
    );

label2 = uilabel(fig,...
    'Position',[100 84 100 200],...
    'Text','Choose a team:',...
    'FontName', 'Arial', ...
    'FontSize', 12, ...
    'fontColor', 'w' ...
    );

method = uidropdown(fig,...
    'Position',[220 250 100 22],...
    'Items',{'Cosine','Euclidean'},...
    'Value','Cosine',...
    'ValueChangedFcn',@(method,event) selection(team, method));

team = uidropdown(fig,...
    'Position',[220 175 100 22],...
    'Items',{'Albany (NY)'
'American'
'Appalachian St.'
'Ball St.'
'Boston College'
'Boston U.'
'Brown'
'Bryant'
'Bucknell'
'California'
'Central Mich.'
'Colgate'
'Columbia'
'Cornell'
'Dartmouth'
'Davidson'
'Delaware'
'Drexel'
'Duke'
'Fairfield'
'Georgetown'
'Harvard'
'Hofstra'
'Holy Cross'
'Indiana'
'Iowa'
'James Madison'
'Kent St.'
'La Salle'
'Lafayette'
'Lehigh'
'Liberty'
'LIU'
'Lock Haven'
'Longwood'
'Louisville'
'Maine'
'Maryland'
'Massachusetts'
'Miami (OH)'
'Michigan'
'Michigan St.'
'Monmouth'
'New Hampshire'
'North Carolina'
'Northeastern'
'Northwestern'
'Ohio'
'Ohio St.'
'Old Dominion'
'Penn'
'Penn St.'
'Princeton'
'Providence'
'Quinnipiac'
'Richmond'
'Rider'
'Rutgers'
'Sacred Heart'
'Saint Francis (PA)'
'Saint Josephs'
'Saint Louis'
'Stanford'
'Syracuse'
'Temple'
'Towson'
'UC Davis'
'UConn'
'UMass Lowell'
'VCU'
'Vermont'
'Villanova'
'Virginia'
'Wagner'
'Wake Forest'
'William & Mary'
'Yale'},...
    'Value','Albany (NY)',...
    'ValueChangedFcn',@(team,event) selection(team, method));
end

% Create ValueChangedFcn callback:



function selection(team, method)
teamName = team.Value;
distanceMeasure= method.Value;


%distanceMeasure = 'cosine';

%% Make a cell list of Song names 
teamNamesList = {'Albany (NY)'
'American'
'Appalachian St.'
'Ball St.'
'Boston College'
'Boston U.'
'Brown'
'Bryant'
'Bucknell'
'California'
'Central Mich.'
'Colgate'
'Columbia'
'Cornell'
'Dartmouth'
'Davidson'
'Delaware'
'Drexel'
'Duke'
'Fairfield'
'Georgetown'
'Harvard'
'Hofstra'
'Holy Cross'
'Indiana'
'Iowa'
'James Madison'
'Kent St.'
'La Salle'
'Lafayette'
'Lehigh'
'Liberty'
'LIU'
'Lock Haven'
'Longwood'
'Louisville'
'Maine'
'Maryland'
'Massachusetts'
'Miami (OH)'
'Michigan'
'Michigan St.'
'Monmouth'
'New Hampshire'
'North Carolina'
'Northeastern'
'Northwestern'
'Ohio'
'Ohio St.'
'Old Dominion'
'Penn'
'Penn St.'
'Princeton'
'Providence'
'Quinnipiac'
'Richmond'
'Rider'
'Rutgers'
'Sacred Heart'
'Saint Francis (PA)'
'Saint Josephs'
'Saint Louis'
'Stanford'
'Syracuse'
'Temple'
'Towson'
'UC Davis'
'UConn'
'UMass Lowell'
'VCU'
'Vermont'
'Villanova'
'Virginia'
'Wagner'
'Wake Forest'
'William & Mary'
'Yale'};

teamRow = find(strcmp(teamNamesList,teamName));  

%% Make a matrix of song data
Q = [0.872863248	0.720238095	0.625
0.737179487	0.416666667	0.5
0.614316239	0.49702381	0.4
0.456196581	0.324404762	0.208333333
0.621794872	0.62202381	0.5875
0.544871795	0.476190476	0.395833333
0.510683761	0.395833333	0.347916667
0.435897436	0.050595238	0.104166667
0.587606838	0.327380952	0.354166667
0.465811966	0.568452381	0.510416667
0.460470086	0.297619048	0.239583333
0.507478633	0.297619048	0.260416667
0.474358974	0.464285714	0.485416667
0.552350427	0.693452381	0.589583333
0.448717949	0.416666667	0.375
0.516025641	0.223214286	0.208333333
0.555555556	0.416666667	0.479166667
0.683760684	0.535714286	0.395833333
0.543803419	0.431547619	0.56875
0.689102564	0.648809524	0.491666667
0.516025641	0.273809524	0.329166667
0.688034188	0.726190476	0.579166667
0.534188034	0.297619048	0.283333333
0.651709402	0.446428571	0.354166667
0.465811966	0.377976191	0.360416667
0.719017094	0.785714286	0.739583333
0.349358974	0.244047619	0.283333333
0.685897436	0.544642857	0.520833333
1	0.488095238	0.416666667
0.702991453	0.669642857	0.55625
0.737179487	0.446428571	0.458333333
0.664529915	0.860119048	0.741666667
0.521367521	0.297619048	0.260416667
0.641025641	0.217261905	0.189583333
0.576923077	0.238095238	0.333333333
0.728632479	0.568452381	0.56875
0.598290598	0.357142857	0.395833333
0.926282051	0.818452381	0.641666667
0.417735043	0.270833333	0.283333333
0.93482906	0.49702381	0.46875
0.689102564	0.675595238	0.625
0.50534188	0.461309524	0.360416667
0.669871795	0.866071429	0.71875
0.66025641	0.404761905	0.435416667
0.726495727	0.922619048	1
0.543803419	0.702380952	0.777083333
0.626068376	0.657738095	0.595833333
0.700854701	0.49702381	0.508333333
0.705128205	0.773809524	0.833333333
0.512820513	0.595238095	0.375
0.771367521	0.428571429	0.325
0.683760684	0.476190476	0.416666667
0.786324786	0.675595238	0.56875
0.84508547	0.488095238	0.454166667
0.446581197	0.324404762	0.189583333
0.632478633	0.422619048	0.329166667
0.833333333	0.565476191	0.583333333
0.608974359	0.446428571	0.3125
0.572649573	0.190476191	0.208333333
0.553418803	0.377976191	0.302083333
0.641025641	1	0.889583333
0.256410256	0.05952381	0.104166667
0.427350427	0.869047619	0.55625
0.650641026	0.404761905	0.472916667
0.605769231	0.428571429	0.277083333
0.417735043	0.324404762	0.264583333
0.379273504	0.244047619	0.227083333
0.836538462	0.916666667	0.660416667
0.61965812	0.595238095	0.458333333
0.587606838	0.386904762	0.3125
0.427350427	0.416666667	0.375
0.908119658	0.595238095	0.583333333
0.614316239	0.571428571	0.452083333
0.458333333	0.211309524	0.2375
0.388888889	0.324404762	0.245833333
0.480769231	0.565476191	0.4375
0.688034188	0.330357143	0.439583333];

%% Find the distance between all players

Q = Q(1:end,:);

D = pdist(Q ,distanceMeasure);

Z = squareform(D); 

%% Sort from lowest (closest) to highest
[Zsorted,index] = sort(Z(:,teamRow));

%% Output results 

fprintf('Top 10 most similar teams to %s\n',teamName); 
fprintf('=============================================\n',teamName); 
disp(char(teamNamesList(index(2:11))'))




uicontrol('Style','text','unit','inches', 'fontWeight', 'bold', 'FontName', 'Calibri', 'FontSize', 14,'position',[0 1 5 4], 'String','10 most similar teams:');
uicontrol('Style','text','FontName', 'Calibri', 'FontSize', 14,'unit','inches','position',[1 1 5 3],'String',teamNamesList(index(2:11)));


end

function run(method)
val = method.Value;
fprintf (val);
end
