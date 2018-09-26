tam([],0).
tam([_|R],D+1) :- tam(R,D).

sum([],0).
sum([X|R],Y+X) :- sum(R,Y).

is_even(X) :- Z is X//2, X=:=2*Z.
sump([],0).
sump([X|R],Y) :- sump(R,Z), is_even(X), Y is X+Z.
sump([X|R],Y) :- sump(R,Y).

sumpi(V,S) :- sumpi(V,S,1).
sumpi([],0,_).
sumpi([X|R],Y,Acc) :- sumpi(R,W,Acc+1), is_even(Acc), Y is W+X.
sumpi([X|R],Y,Acc) :- sumpi(R,Y,Acc+1).

contains(X,[X|R]).
contains(X,[Y|R]) :- contains(X,R).

pos(X,L,P) :- pos(X,L,P,1).
pos(X,[X|_],Acc,Acc).
pos(X,[Y|R],P,Acc) :- Acc2 is Acc+1, pos(X,R,P,Acc2).

count(X,L,C) :- count(X,L,C,0).
count(_,[],Acc,Acc).
count(X,[X|R],C,Acc) :- Acc2 is Acc+1, count(X,R,C,Acc2).
count(X,[Y|R],C,Acc) :- count(X,R,C,Acc).

maior([X],X).
maior([X|R],M) :- maior(R,Z), X > Z, M is X.
maior([X|R],M) :- maior(R,Z), X < Z, M is Z.

revert(L,R) :- revert(L,R,[]).
revert([],Acc,Acc).
revert([X|R],L,Acc) :- revert(R,L,[X|Acc]).

inter1([],_,[]).
inter1(_,[],[]).
inter1([X|R1],[Y|R2],I) :- inter1(R1,R2,I2), I = [X|[Y|I2]].

inter2([],X,X).
inter2(X,[],X).
inter2([X|R1],[Y|R2],I) :- inter2(R1,R2,I2), I = [X|[Y|I2]].

sorted([_]).
sorted([X|[Y|R]]) :- X < Y, sorted([Y|R]).

list(N,L) :- list(N,L,1).
list(N,[N],N).
list(N,L,C) :- C2 is C+1, list(N,Z,C2), L = [C|Z].

take_last([X],X).
take_last([X|R],Y) :- take_last(R,Y).

drop_last([X],[]).
drop_last([X|R],L) :- drop_last(R,Z), L = [X|Z].

split_last([X],[],X).
split_last([X|R],L,Y) :- split_last(R,Z,Y), L = [X|Z].

shiftr(L,X) :- split_last(L,Z,Y), X = [Y|Z].

shiftl([X|R],L) :- shiftl(R,X,L).
shiftl([],X,[X]).
shiftl([X|R],Y,L) :- shiftl(R,Y,Z), L = [X|Z].

shiftln(L,0,L).
shiftln(L,N,R) :- N2 is N-1, shiftln(L,N2,Z), shiftl(Z,R).

shiftrn(L,0,L).
shiftrn(L,N,R) :- N2 is N-1, shiftrn(L,N2,Z), shiftr(Z,R).

remove(_,[],[]).
remove(X,[X|R],R).
remove(X,[Y|R],W) :- remove(X,R,Z), W = [Y|Z].

remove_all(_,[],[]).
remove_all(X,[X|R],W) :- remove_all(X,R,W).
remove_all(X,[Y|R],W) :- remove_all(X,R,Z), W = [Y|Z].

removen(_,0,L,L).
removen(X,N,L,R) :- N2 is N-1, removen(X,N2,L,Z), remove(X,Z,R).

remove_last(X,L,W) :- revert(L,Z), remove(X,Z,T), revert(T,W).

switch(_,_,[],[]).
switch(X,Y,[X|R],[Y|R]).
switch(X,Y,[H|R],W) :- switch(X,Y,R,Z), W = [H|Z].

switch_all(_,_,[],[]).
switch_all(X,Y,[X|R],W) :- switch_all(X,Y,R,Z), W = [Y|Z].
switch_all(X,Y,[H|R],W) :- switch_all(X,Y,R,Z), W = [H|Z].

switchn(_,_,0,L,L).
switchn(X,Y,N,L,R) :- N2 is N-1, switchn(X,Y,N2,L,Z), switch(X,Y,Z,R).
