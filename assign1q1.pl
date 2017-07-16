swap([X,Y|List],[Y,X|List]) :- 
	X > Y.
swap([Z|List],[Z|List1]) :- 
	swap(List,List1).

printlist([]) :- nl.
printlist([Head|List]) :-
        write(Head),write(' '),
        printlist(List).

bubbleSort(InputList,SortList) :-
        swap(InputList,List) , ! ,
        printlist(List),
        bubbleSort(List,SortList).
    bubbleSort(SortList,SortList).
    

    

