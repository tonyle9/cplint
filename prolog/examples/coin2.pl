/*
Throwing two coins with uncertainty on their fairness.
J. Vennekens, S. Verbaeten, and M. Bruynooghe. Logic programs with annotated 
disjunctions. In International Conference on Logic Programming, 
volume 3131 of LNCS, pages 195-209. Springer, 2004.
*/
:- use_module(library(pita)).

:- if(current_predicate(use_rendering/1)).
:- use_rendering(c3).
:- endif.

:- pita.

:- begin_lpad.

heads(Coin): 0.5; tails(Coin) : 0.5:-toss(Coin),fair(Coin).
% if we toss a Coin that is not biased then it lands heads with probability 1/2
% and tails with probability 1/2
heads(Coin): 0.6 ; tails(Coin) : 0.4:-toss(Coin),biased(Coin).
% if we toss a Coin that is biased then it lands heads with probability 0.6
% % and tails with probability 0.4
fair(Coin):0.9 ; biased(Coin):0.1.
% a Coin is fair with probability 0.9 and biased with probability 0.1
toss(coin1).
% coin1 is certainly tossed
toss(coin2).
% coin2 is certainly tossed

:- end_lpad.

/** <examples>

?- prob(heads(coin2),Prob).  % what is the probability that coin1 lands heads? 
% expected result 0.51
?- prob(tails(coin2),Prob).  % what is the probability that coin1 lands tails?
% expected result 0.49
?- prob(heads(coin1),Prob).  % what is the probability that coin2 lands heads? 
% expected result 0.51
?- prob(tails(coin1),Prob).  % what is the probability that coin2 lands tails?
% expected result 0.49
?- prob(heads(coin2),Prob),bar(Prob,C).  % what is the probability that coin1 lands heads? 
% expected result 0.51
?- prob(tails(coin2),Prob),bar(Prob,C).  % what is the probability that coin1 lands tails?
% expected result 0.49
?- prob(heads(coin1),Prob),bar(Prob,C).  % what is the probability that coin2 lands heads? 
% expected result 0.51
?- prob(tails(coin1),Prob),bar(Prob,C).  % what is the probability that coin2 lands tails?
% expected result 0.49


*/
 
