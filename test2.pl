% arv(CHAVE, VALOR, ArvoreEsquerda, ArvoreDireira)  ou vazia
% insereabb(+Chave,+Valor, +ArvVelha, -ArvNova)
% trocaabb(+Chave, +Valoe, +ArvVelha, -ArvNova)
% lookupabb(+Chave, +Arvore, -Valor)

lookupabb(K,arv(K,V,_,_),V).
lookupabb(K,arv(N,_,L,_),S) :- K < N, lookupabb(K,L,S).
lookupabb(K,arv(N,_,_,R),S) :- K > N, lookupabb(K,R,S).

trocaabb(K,arv(K,V,_,_),V).
trocaabb(K,arv(N,_,L,_),S) :- K < N, trocaabb(K,L,S).
trocaabb(K,arv(N,_,_,R),S) :- K > N, trocaabb(K,R,S).

insereabb(K,V,vazia,E) :- E = t(K,V,vazia,vazia).
insereabb(K,V,arv(K,Y,L,R),E) :- false.
insereabb(K,V,arv(X,Y,L,R),E) :- N < K, insereabb(K,V,L,Z), E = t(X,Y,Z,R).
insereabb(K,V,arv(X,Y,L,R),E) :- N > K, insereabb(K,V,R,Z), E = t(X,Y,L,Z).
