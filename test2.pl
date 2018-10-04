% arv(CHAVE, VALOR, ArvoreEsquerda, ArvoreDireira)  ou vazia
% insereabb(+Chave,+Valor, +ArvVelha, -ArvNova)
% trocaabb(+Chave, +Valoe, +ArvVelha, -ArvNova)
% lookupabb(+Chave, +Arvore, -Valor)
% arv(11,11,arv(9,9,arv(7,7,arv(3,3,arv(2,2,vazia,vazia),arv(5,5,vazia,vazia)),vazia),vazia),arv(13,13,vazia,vazia))

lookupabb(K,arv(K,V,_,_),V).
lookupabb(K,arv(N,_,L,_),S) :- K < N, lookupabb(K,L,S).
lookupabb(K,arv(N,_,_,R),S) :- K > N, lookupabb(K,R,S).

trocaabb(K,V,arv(K,Y,L,R),E) :- E = arv(K,V,L,R).
trocaabb(K,V,arv(X,Y,L,R),E) :- X > K, trocaabb(K,V,L,Z), E = arv(X,Y,Z,R).
trocaabb(K,V,arv(X,Y,L,R),E) :- X < K, trocaabb(K,V,R,Z), E = arv(X,Y,L,Z).

insereabb(K,V,vazia,E) :- E = t(K,V,vazia,vazia).
insereabb(K,V,arv(K,Y,L,R),E) :- false.
insereabb(K,V,arv(X,Y,L,R),E) :- X > K, insereabb(K,V,L,Z), E = arv(X,Y,Z,R).
insereabb(K,V,arv(X,Y,L,R),E) :- X < K, insereabb(K,V,R,Z), E = arv(X,Y,L,Z).

% getdic(+Chave, +Dicionario, -Valor)
% xgetdic(+Chave, +Dicionario, +ValorDefault, -Valor)
% putdic(+Chave, +Valor, +DicVelho, -DicNovo)

getdic(K,D,V) :- lookupabb(K,D,V).
xgetdic(K,D,Df,V) :- lookupabb(K,D,Z) -> V=Z ; V=Df.
putdic(K,V,D,Dn) :- lookupabb(K,D,_) -> trocaabb(K,V,D,Dn) ; insereabb(K,V,D,Dn).
