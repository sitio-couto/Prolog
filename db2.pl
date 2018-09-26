t(7,t(3,t(2,n,n),t(5,n,n)),t(11,t(9,n,n),t(13,n,n))).

findNode(X,t(X,_,_)).
findNode(X,t(N,L,_)) :- X < N, findNode(X,L).
findNode(X,t(N,_,R)) :- X > N, findNode(X,R).

isBst(t(N,L,R)) :- checkBstL(N,L), checkBstR(N,R).
checkBstL(X,n).
checkBstL(X,t(N,L,R)) :- X > N, checkBstL(N,L), checkBstR(N,R).
checkBstR(X,n).
checkBstR(X,t(N,L,R)) :- X < N, checkBstL(N,L), checkBstR(N,R).

addNode(N,n,E) :- addNode(N,R).
addNode(N,t(X,L,R)) :- N < X, addNode(N,L).
addNode(N,t(X,L,R)) :- N > X, addNode(N,R).
