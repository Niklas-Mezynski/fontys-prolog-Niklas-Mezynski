% Task 1 - Test
% Assignment example grammar

/***
s --> np(subj), vp. 
np(_) --> det, n. 
np(_) --> pn. 
np(CASE) --> pro(CASE). 
vp --> vi. 
vp --> vt, np(obj). 
 
%% ----- Alphabet 
det --> [a]. 
det --> [the]. 
n --> [bride]. 
n --> [nurse]. 
n --> [whiskey]. 
pn --> [bill]. 
pro(subj) --> [he]. 
pro(subj) --> [she]. 
pro(obj) --> [him]. 
pro(obj) --> [her]. 
vi --> [whistles]. 
vt --> [drinks]. 
vt --> [kills].
***/

/***
Some sentences left out
?- s(L,[]).                               
L = [a, bride, whistles] ;
L = [a, bride, drinks, a, bride] ;
L = [a, bride, drinks, her] ;
L = [a, bride, kills, a, bride] ;
L = [a, nurse, drinks, a, bride] ;
L = [a, nurse, drinks, a, nurse] ;
L = [a, nurse, drinks, a, whiskey] ;
L = [a, nurse, drinks, the, bride] ;
L = [a, nurse, drinks, the, nurse] ;
L = [a, nurse, kills, bill] ;
L = [a, nurse, kills, him] ;
L = [a, nurse, kills, her] ;
L = [a, whiskey, whistles] ;
L = [a, whiskey, drinks, a, bride] ;
L = [a, whiskey, drinks, a, nurse] ;
L = [a, whiskey, drinks, her] ;
L = [a, whiskey, kills, a, bride] ;
L = [the, bride, kills, her] ;
L = [the, nurse, whistles] ;
L = [the, nurse, drinks, a, bride] ;
L = [the, nurse, drinks, a, nurse] ;
L = [the, nurse, drinks, a, whiskey] ;
L = [the, nurse, kills, her] ;
L = [the, whiskey, kills, a, whiskey] ;
L = [the, whiskey, kills, the, bride] ;
L = [the, whiskey, kills, the, nurse] ;
L = [the, whiskey, kills, the, whiskey] ;
L = [bill, kills, her] ;
L = [he, whistles] ;
L = [he, drinks, a, bride] ;
L = [he, drinks, a, nurse] ;
L = [he, drinks, a, whiskey] ;
L = [she, kills, her].
***/

% Task 2 - German grammar
/***
    Some sample german sentences:
    - ["der", "junge", "geht", "in", "die", "schule"]
    - ["niklas", "ist", "programmierer"]
    - ["peter", "ist", "lustig"]
    - ["der", "programmierer", "trinkt", "ein", "glas"]
    - ["er", "findet", "sie", "lustig"]
    - 
***/
% Grammar rules
s --> np(subj), vp. 
np(_) --> det(GENDER), n(GENDER). 
np(_) --> pn. 
np(CASE) --> pro(CASE).
vp --> vi. 
vp --> vt(_), np(obj).
vp --> vt(adj), a.


% Dictionary 
det(m) --> [der]. 
det(f) --> [die]. 
det(n) --> [das]. 
det(m) --> [ein]. 
det(f) --> [eine]. 
det(n) --> [ein]. 
n(m) --> [junge]. 
n(m) --> [programmierer]. 
n(f) --> [schule]. 
n(n) --> [glas]. 
pn --> [niklas]. 
pn --> [peter].
pro(subj) --> [er]. 
pro(subj) --> [es]. 
pro(subj) --> [sie]. 
pro(obj) --> [ihn]. 
pro(obj) --> [sie]. 
vi --> [geht]. 
vt(adj) --> [ist].
vt(noun) --> [findet].
vt(noun) --> [trinkt].
a --> [lustig].

/***
b)
?- s([peter, ist, lustig],[]). 
true ;

?- s([peter, ist, trinkt],[]). 
false.

?- s([niklas, ist, ein, programmierer],[]). 
true .

?- s([niklas, ist, eine, programmierer],[]). 
false.



c)
?- s(L,[]).
L = [der, junge, geht] ;
L = [der, junge, ist, der, junge] ;
L = [der, junge, ist, der, programmierer] ;
L = [der, junge, ist, die, schule] ;
L = [der, junge, ist, das, glas] .
***/