function [solved_board, OUT, E] = solve_board(init_board)
    % SOLVE_BOARD  returns a solved sudoku board given the initial puzzle
    board = init_board;
    E = init_elim_board(board);
    solve_moves = {@simple_sudoku @simple_elim};
    [E, count_removed, success] = try_moves(E, solve_moves);
    solved_board = fill_board(E);
    OUT = struct('CR', count_removed, 'Success', success);
    % Helper function to recursively try solve moves
    function [E, count_removed, success] = try_moves(E, moves)
        success = true;
        count_removed = 0;
        done = false;
        while ~done
            count = 0;
            for k = 1:numel(moves)
                f = moves{k};
                [E, CR, S] = f(E);
                count = count + CR;
                count_removed = count_removed + count;
                success = success || S;
                if CR > 0
                    break
                end
            end
            done = ~success || count == 0;
        end
    end
    % Helper function to convert E into solved board
    function board = fill_board(E)
        board = cellfun(@(x) prod(x)*isscalar(x), E);
    end
end