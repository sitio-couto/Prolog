
% ARVORES ----------------------------------------------------------------------
t(7,t(3,t(2,n,n),t(5,n,n)),t(11,t(9,n,n),t(13,n,n))).
t(11,t(9,t(7,t(3,t(2,n,n),t(5,n,n)),n),n),t(13,n,n)).


findNode(X,t(X,_,_)).
findNode(X,t(N,L,_)) :- X < N, findNode(X,L).
findNode(X,t(N,_,R)) :- X > N, findNode(X,R).

isBst(t(N,L,R)) :- checkBstL(N,L), checkBstR(N,R).
checkBstL(X,n).
checkBstL(X,t(N,L,R)) :- X > N, checkBstL(N,L), checkBstR(N,R).
checkBstR(X,n).
checkBstR(X,t(N,L,R)) :- X < N, checkBstL(N,L), checkBstR(N,R).

addNode(N,n,E) :- E = t(N,n,n).
addNode(N,t(N,L,R),E) :- E = t(N,L,R).
addNode(N,t(X,L,R),E) :- N < X, addNode(N,L,Z), E = t(X,Z,R).
addNode(N,t(X,L,R),E) :- N > X, addNode(N,R,Z), E = t(X,L,Z).

takeMinimum(t(N,n,R), S, C) :- S = R, C = N.
takeMinimum(t(N,L,R), S, C) :- takeMinimum(L, Z, C), S = t(N,Z,R).

dropNode(N,n,E) :- E = n.
dropNode(N,t(N,L,R),E) :- takeMinimum(R,S,C), E = t(C,L,S).
dropNode(N,t(N,L,n),E) :- E = L.
dropNode(N,t(X,L,R),E) :- N < X, dropNode(N,L,Z), E = t(X,Z,R).
dropNode(N,t(X,L,R),E) :- N > X, dropNode(N,R,Z), E = t(X,L,Z).

depth(n,-1).
depth(t(N,L,R),D) :- depth(L,A), depth(R,B), (A>B -> D is A+1 ; D is B+1).

prepend([],N,B,[N|B]).
prepend([X|R],N,B,L) :- prepend(R,N,B,Z), L = [X|Z].

inOrder(n,[]).
inOrder(t(N,L,R),I) :- inOrder(L,A), inOrder(R,B), prepend(A,N,B,I).

preOrder(n,[]).
preOrder(t(N,L,R),I) :- preOrder(L,A), preOrder(R,B), append(A,B,Z), I = [N|Z].

makeBst([X],t(X,n,n)).
makeBst([X|R],T) :- makeBst(R,Z), addNode(X,Z,T).

% DICIONARIOS ------------------------------------------------------------------
[d(1,'a'),d(2,'b'),d(3,'c'),d(4,'d'),d(5,'e'),d(6,'f')].

findKey(X,[d(K,V)|R],F) :- K==X -> F = V ; findKey(X,R,F).

addKey(X,Y,[],[d(X,Y)]).
addKey(X,Y,[d(X,V)|R],F) :- F = [d(X,Y)|R].
addKey(X,Y,[D|R],F) :- F = [D|Z], addKey(X,Y,R,Z).

dropKey(X,[d(K,V)|R],F) :- K==X -> F = R ; F = [d(K,V)|Z], dropKey(X,R,Z).
