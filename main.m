fn = 's04a.txt';
[iB, S] = load_sudoku(fn);

% E = init_elim_board(iB);
% E2 = E;
% for n = 1:3
%     [E2, count_removed, success] = simple_sudoku(E2);
% end
[sB, OUT, E] = solve_board(iB);

% Etest = {[1 3 4 5], [1 2 8], [9], [2 8 9]};
% 
% R = reshape(1:81, [9 9]);
% R(get_neighbour_idx(81)) = 0;
