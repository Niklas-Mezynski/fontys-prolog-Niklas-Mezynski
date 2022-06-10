% Task 2 Parser

% Grammar rules
% s --> np(subj), vp. 
% np(_) --> det(GENDER), n(GENDER). 
% np(_) --> pn. 
% np(CASE) --> pro(CASE).
% vp --> vi. 
% vp --> vt(_), np(obj).
% vp --> vt(adj), a.

s(s(NPT,VPT)) -->
    np(subj,NPT), vp(VPT).
np(_,np(DetT,NT)) -->
    det(GENDER,DetT), n(GENDER,NT).
np(_,np(PNT)) -->
    pn(PNT).
np(CASE,np(ProT)) -->
    pro(CASE,ProT).
vp(vp(VIT)) -->
    vi(VIT). 
vp(vp(VTT,NPT)) -->
    vt(_,VTT), np(obj,NPT).
vp(vp(VTT, AT)) -->
    vt(adj,VTT), a(AT).


% Dictionary 
det(m,det(m,der)) --> [der]. 
det(f,det(f,die)) --> [die]. 
det(n,det(n,das)) --> [das]. 
det(m,det(m,ein)) --> [ein]. 
det(f,det(f,eine)) --> [eine]. 
det(n,det(n,ein)) --> [ein]. 
n(m,n(m,junge)) --> [junge]. 
n(m,n(m,programmierer)) --> [programmierer]. 
n(f,n(f,schule)) --> [schule]. 
n(n,n(n,glas)) --> [glas]. 
pn(pn(niklas)) --> [niklas]. 
pn(pn(peter)) --> [peter].
pro(subj,pro(subj,er)) --> [er]. 
pro(subj,pro(subj,es)) --> [es]. 
pro(subj,pro(subj,sie)) --> [sie]. 
pro(obj,pro(obj,ihn)) --> [ihn].
pro(obj,pro(obj,sie)) --> [sie]. 
vi(vi(geht)) --> [geht]. 
vt(_,vt(_,ist)) --> [ist].
vt(noun,vt(noun,findet)) --> [findet].
vt(noun,vt(noun,trinkt)) --> [trinkt].
a(a(lustig)) --> [lustig].
a(a(doof)) --> [doof].

/***
a)
?- s(Tree,[niklas, ist, ein, programmierer],[]).
Tree = s(np(pn(niklas)), vp(vt(_, ist), np(det(m, ein), n(m, programmierer)))) .

?- s(Tree,[niklas, ist, eine, programmierer],[]).
false.

?- s(Tree,[der,junge,ist,lustig],[]). 
Tree = s(np(det(m, der), n(m, junge)), vp(vt(_, ist), a(lustig))) .

?- s(Tree,[die,schule,ist,doof],[]).
Tree = s(np(det(f, die), n(f, schule)), vp(vt(_, ist), a(doof))) .


b)
?- s(Tree,Satz,[]).
Tree = s(np(det(m, der), n(m, junge)), vp(vi(geht))),
Satz = [der, junge, geht] ;
Tree = s(np(det(m, der), n(m, junge)), vp(vt(_, ist), np(det(m, der), n(m, junge)))),
Satz = [der, junge, ist, der, junge] ;
Tree = s(np(det(m, der), n(m, junge)), vp(vt(_, ist), np(det(m, der), n(m, programmierer)))),
Satz = [der, junge, ist, der, programmierer] ;
Tree = s(np(det(m, der), n(m, junge)), vp(vt(_, ist), np(det(f, die), n(f, schule)))),
Satz = [der, junge, ist, die, schule] ;
Tree = s(np(det(m, der), n(m, junge)), vp(vt(_, ist), np(det(n, das), n(n, glas)))),
Satz = [der, junge, ist, das, glas] .
***/