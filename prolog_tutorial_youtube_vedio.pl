loves(romeo, juliet).
loves(juliet, romeo) :- loves(romeo, juliet).

happy(albert).
happy(alice).
happy(bob).
happy(bill).
with_albert(alice).

runs(albert) :-
	happy(albert).

dances(alice) :- 
	happy(alice),
	with_albert(alice).

does_alice_dance :- dances(alice),
	write('Yes, Alice dances!').

swims(bill) :-
	happy(bill).

swims(bill) :-
	near_water(bill).


what_grade(5) :-
	write('got to 5').

what_grade(6) :-
	write('got to 6').

what_grade(Other) :-
	Grade is Other - 6,
	write(Grade).

customer(sally, smith, 20.55).

vertical(line(point(X,Y), point(X,Y2))) :-
write('Line is vertical').

%?- a = a
%true.

%?- a = z.
%false.

%?- 3>15.
%false.

%?- 3<15.
%true.

warm_blooded(penguin).
warm_blooded(human).

produce_milk(penguin).
produce_milk(human).

have_feather(penguin).
have_hair(human).

mammal(X) :-
	warm_blooded(X),
	produce_milk(X),
	have_hair(X).

double_digit(X,Y) :-
	Y is X*2.


is_even(X) :-
	Y is X//2, X =:= 2*Y.

say_hi :-
	write('What is your name?'),nl,
	read(X),
	write('Hi'),
	write(X).

sort :-
	write('Enter Number'), nl,
	read(X),
	write(X).

