function [E, count_removed, success] = simple_elim(E)
    % SIMPLE_ELIM  performs "simple sudoku rules" to eliminate
    % possibilities
    %    E = SIMPLE_ELIM(E) fills in cells in E that are the only cell in
    %    their row, column, or subsquare that can take on a certain value.
    %
    %    [E, count_removed] = SIMPLE_ELIM(E) also returns a count of how
    %    many values of E were removed.
    %
    %    [E, count_removed, success] = SIMPLE_ELIM(E) also returns a
    %    success flag which is false if one of the cells in E is now empty.
    %
    count_removed = 0;
    success = true;
    for n = 1:numel(E)
        if ~isscalar(E{n})
            [~, iR, iC, iS] = get_neighbour_idx(n);
            for m = 1:9
                if ismember(m, E{n}) && ~(any(cellcontains(E(iR), m)) ...
                                       && any(cellcontains(E(iC), m)) ...
                                       && any(cellcontains(E(iS), m)))
                    count_removed = count_removed + numel(E{n}(E{n} ~= m));
                    E{n} = m;
                    break
                end
            end
        end
    end
end