
remove(_,[],[]).
remove(X,[X|R],R).
remove(X,[Y|R],W) :- remove(X,R,Z), W = [Y|Z].
