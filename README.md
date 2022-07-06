# Knights Travails
## The Problem
A knight can move to any possible space on a 8x8 chess board. Given starting and ending positions, find the shortest path a knight can take.
## The Program
The following program Breadth-First-Search to solve the problem. By treating all possible (legal) moves a knight can make from a given position as Children of a tree node, BFS can be used to traverse it. Also, by keeping track of the parent of a node, we can backtrack to get the complete path once the knight reaches the end coordinates.
<br><br>
A Brief Overview of the Classes:
<br>
<li><ins><strong>Position:</strong></ins> a class that represents a position on a chess board, with x & y coordinates, along with a parent attribute. This class acts as the 'node' for the tree in the BFS.
<br></li>
<li><ins><strong>KnightTravails:</strong></ins> Class that contains the method 'knight_moves()' used to calculate the shortest path.</li>
<br>
Run main.rb to use the algorithm.