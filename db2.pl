t(7,t(3,t(2,n,n),t(5,n,n)),t(11,t(9,n,n),t(13,n,n))).

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
