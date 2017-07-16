parent(tom, adam).
parent(tom, helen).
parent(sandra, adam).
parent(sandra, helen).
parent(michael, andrew).
parent(michael, john).
parent(eve, andrew).
parent(eve, john).
parent(helen, mark).
parent(andrew, mark).
parent(judy, roger).
parent(judy, jim).
parent(judy, janis).
parent(mark, roger).
parent(mark, jim).
parent(mark, janis).
parent(janis, daphne).
parent(peter, daphne).

man(tom).
man(michael).
man(adam).
man(andrew).
man(john).
man(mark).
man(roger).
man(jim).
man(peter).
woman(sandra).
woman(eve).
woman(helen).
woman(judy).
woman(janis).
woman(daphne).
father(X, Y) :- man(X),
parent(X, Y).
mother(X, Y) :- woman(X),
parent(X, Y).

is_father(X) :- father(X, _).
is_mother(X) :- mother(X, _).

grandparent(X,Z):-parent(X,Y),parent(Y,Z).
ancestor(X,Y):-parent(X,Y).
ancestor(X,Y):-parent(X,Z),parent(Z,Y).



