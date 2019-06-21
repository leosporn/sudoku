function [E, count_removed, success] = removeval(E, val)
    % REMOVEVAL  remove value from cells
    %    E = REMOVEVAL(E_in, val) removes val from all cells in E tha
    %    contain it.
    %
    %    [E, count_removed] = REMOVEVAL(E_in, val) also returns the total
    %    number of values removed from E.
    %
    %    [E, count_removed_success] = REMOVEVAL(E_in, val) also returns a
    %    success flag which is false if one of the cells in E is now empty
    %    as a result of the removal.
    %
    count = sum(cellfun(@numel, E));
    for n = 1:numel(E)
        E{n} = E{n}(E{n} ~= val);
    end
    count_removed = count - sum(cellfun(@numel, E));
    success = ~any(cellfun(@isempty, E));
end