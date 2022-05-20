% Task 1 - a
% Calculate the length of the list
list_length( [] , 0) :- true, !.
list_length( [_|Tail] ,Length) :- list_length(Tail,Length1), Length is Length1 + 1.
/***
?- list_length([],L).  
L = 0.

?- list_length([a],L). 
L = 1.

?- list_length([a,a,a,a,a,a],L).  
L = 6.
***/

% Task 2 - b
% Xor the Plaintext with the key to get the Ciphertext
xor( [], [], []). % When the lists are empty, we are done
xor( [H1|T1], [H2|T2], [H3|T3]) :- H3 is H1 xor H2, xor(T1,T2,T3). % Xor the head element of plaintxt and key and append the result to the result list -> recursively iterate through the tail of the lists

% xor(+Plaintext,+Key,-Cipher)
/***
?- xor_list([0,1,1],[0,1,0],Z). 
Z = [0, 0, 1].

?- xor_list([1,1,0,0],[0,1,1,0],Cipher),xor_list(Cipher,[0,1,1,0],Plaintext). 
Cipher = [1, 0, 1, 0],
Plaintext = [1, 1, 0, 0].
***/