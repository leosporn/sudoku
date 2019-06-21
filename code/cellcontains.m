function idx = cellcontains(E, val)
    % CELLCONTAINS  determine which cells contain a number
    %    idx = CELLCONTAINS(E, n) returns a logical array the same size as
    %    E, which is true where E contains the number val.
    %
    idx = false(size(E));
    for n = 1:numel(E)
        idx(n) = ismember(val, E{n});
    end
end