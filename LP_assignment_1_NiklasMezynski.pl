/***	DAY 1, 
		TASK 1 – Gryffindor table ***/
 
sits_right_of(dean,ginny).
sits_right_of(ginny,angelina).
sits_right_of(angelina,seamus).
sits_right_of(seamus,colin).
sits_right_of(colin,harry).
sits_right_of(harry,hermione).
sits_right_of(hermione,ron).
sits_right_of(ron,natalie).
sits_right_of(natalie,katie).
sits_right_of(katie,parvati).
sits_right_of(parvati,lavender).
sits_right_of(lavender,neville).
sits_right_of(neville,alicia).
sits_right_of(alicia,fred).
sits_right_of(fred,geroge).
sits_right_of(geroge,lee).
sits_right_of(lee,dennis).
sits_right_of(dennis,dean).

sits_left_of(X,Y) :- sits_right_of(Y,X).
are_neighbors_of(X,Y,Z) :- sits_left_of(X,Z), sits_right_of(Y,Z).
next_to_each_other(X,Y) :- sits_right_of(X,Y).
next_to_each_other(X,Y) :- sits_left_of(X,Y).

/***
- Is Hermione to the right of Harry?  
?- sits_right_of(hermione,harry).
false.

- Is Harry to the right of Ginny?  
?- sits_right_of(harry,ginny).
false.

- Who is to the right of Harry?  
?- sits_right_of(X,harry).
X = colin.

- Who is sitting at the table?  
?- sits_right_of(X,Y).
X = dean,
Y = ginny ;
X = ginny,
Y = angelina ;
X = angelina,
Y = seamus ;
X = seamus,
Y = colin ;
X = colin,
Y = harry ;
X = harry,
Y = hermione ;
X = hermione,
Y = ron ;
X = ron,
Y = natalie ;
X = natalie,
Y = katie ;
X = katie,
Y = parvati ;
X = parvati,
Y = lavender ;
X = lavender,
Y = neville ;
X = neville,
Y = alicia ;
X = alicia,
Y = fred ;
X = fred,
Y = geroge ;
X = geroge,
Y = lee ;
X = lee,
Y = dennis ;
X = dennis,
Y = dean.

- Who is sitting two seats to the right of Neville?  
?- sits_right_of(X,neville).
X = lavender.

?- sits_right_of(X,lavender).
X = parvati.

- Who is sitting between Neville and Parvati?  
?- are_neighbors_of(neville,parvati,Z).
Z = lavender.

***/
 
/* TASK 2 - Harry’s family relationships */

male(paul).
male(albert).
male(vernon).
male(james).
male(dudley).
male(harry).

female(helen).
female(ruth).
female(petunia).
female(lili).

parent_of(vernon,dudley).
parent_of(petunia,dudley).
parent_of(lili,harry).
parent_of(james,harry).
parent_of(paul,petunia).
parent_of(helen,petunia).
parent_of(paul,lili).
parent_of(helen,lili).
parent_of(ruth,james).
parent_of(albert,james).

father_of(F,C) :- parent_of(F,C), male(F).
mother_of(M,C) :- parent_of(M,C), female(M).
grandfather_of(Grandfather,Child) :- male(Grandfather), parent_of(Grandfather, Parent), parent_of(Parent, Child).
grandmother_of(Grandmother,Child) :- female(Grandmother), parent_of(Grandmother, Parent), parent_of(Parent, Child).
sister_of(Sister,Person) :- female(Sister), parent_of(X, Sister), parent_of(X, Person), male(X), not(Sister = Person).
aunt_of(Aunt,Person) :- sister_of(Aunt, Sister), parent_of(Sister,Person).
uncle_of(Uncle,Person) :- male(Uncle), parent_of(GrandParent,Uncle), parent_of(GrandParent, Parent), male(GrandParent), parent_of(Parent, Person), not(Parent = Uncle).

ancestor_of(X,Y) :- parent_of(X,Y).
ancestor_of(X,Y) :- parent_of(X,Z), ancestor_of(Z,Y).

not_parent(X,Y) :- not(parent_of(X,Y)).

/***
- Does Harry have an uncle? Who? 
?- uncle_of(X,harry).
false.

- Who are the grandparents of Harry? 
?- grandfather_of(X,harry).
X = paul ;
X = albert ;
false.

?- grandmother_of(X,harry).
X = helen ;
X = ruth ;
false.

- Who are the grandchildren of Paul and Helen? 
?- grandmother_of(helen,X).
X = dudley ;
X = harry.

- Does James have a sister? 
?- sister_of(X,james).
false.

- Is Albert an ancestor of Harry? 
?- ancestor_of(albert,harry).
true .

- Who are the ancestors of Harry? 
?- ancestor_of(X,harry).
X = lili ;
X = james ;
X = paul ;
X = helen ;
X = ruth ;
X = albert ;
false.

- Is Dudley an ancestor of Harry? 
?- ancestor_of(dudley,harry).
false.

- Who are the descendants of James? 
?- ancestor_of(james,X).
X = harry ;
false.

***/


/* TASK 3 - Finding a path through the maze (voluntary) */

connected(1,2).
connected(3,4).
connected(5,6). 
connected(7,8).
connected(9,10).
connected(12,13).
connected(13,14).
connected(15,16).
connected(17,18).
connected(19,20).
connected(4,1).
connected(6,3).
connected(4,7).
connected(6,11).
connected(14,9).
connected(11,15).
connected(16,12).
connected(14,17).
connected(16,19).

path(X,Y) :- connected(X,Y).
path(X,Y) :- connected(X,Z), path(Z,Y).

/***
- Can you get from point 5 to point 10?
?- path(5,10).
true

- Which other point can you get to when starting in point 1?  
?- path(1,X).
X = 2 ;
false.

- And which points can be reached from point 13? 
?- path(13,X).
X = 14 ;
X = 9 ;
X = 17 ;
X = 10 ;
X = 18 ;
false.

***/