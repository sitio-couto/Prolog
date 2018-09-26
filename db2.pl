tree(bst(7,bst(3,bst(2,n,n),bst(5,n,n)),bst(11,bst(9,n,n),bst(13,n,n)))).

findNode(X,bst(X,_,_)).
findNode(X,bst(N,L,_)) :- X < N, findNode(X,L).
findNode(X,bst(N,_,R)) :- X > N, findNode(X,R).
