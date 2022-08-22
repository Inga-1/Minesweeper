sums([], [_,_]).
sums([X|M], [A, B, C|L]) :- X #= A + B + C, sums(M, [B, C|L]).
    
appending(L, L2) :- append([0], L, L1), append(L1, [0], L2).

converting(X, Y) :- (X = 0, Y = o); (X = 1, Y= x).
%convert the list of 0s and 1s into list of os and xs
convert([], []).
convert([X|L01], [Y|Lox]) :- converting(X, Y), convert(L01, Lox).

mines(L, M) :-  same_length(L, M), same_length(M, M1), M1 ins 0..1, appending(M1, M2), sums(L, M2), convert(M1, M). 