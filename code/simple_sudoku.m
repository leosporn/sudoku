function [E, count_removed, success] = simple_sudoku(E)
    % SIMPLE_SUDOKU  performs "simple sudoku rules" to eliminate
    % possibilities
    %    E = SIMPLE_SUDOKU(E) removes values from E based on neighbouring
    %    cells.
    %
    %    [E, count_removed] = SIMPLE_SUDOKU(E) also returns a count of how
    %    many values of E were removed.
    %
    %    [E, count_removed, success] = SIMPLE_SUDOKU(E) also returns a
    %    success flag which is false if one of the cells in E is now empty.
    %
    count_removed = 0;
    success = true;
    for n = 1:numel(E)
        if isscalar(E{n})
            idx = get_neighbour_idx(n);
            [E(idx), new_count, new_success] = removeval(E(idx), E{n});
            count_removed = count_removed + new_count;
            success = new_success || success;
        end
    end
end