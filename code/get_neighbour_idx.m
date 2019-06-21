function [iN, iR, iC, iS] = get_neighbour_idx(idx)
    % GET_NEIGHBOUR_IDX  gets index of all squares neighbouring cell
    %    iN = GET_NEIGHBOUR_IDX(idx) returns the index of all squares that
    %    are either in the same row, column, or subsquare of idx.
    %
    %    [iN, iR, iC, iS] = GET_NEIGHBOUR_IDX(idx) also returns the
    %
    [iR, iC, iS] = get_rcs_idx(idx);
    iR = iR(iR ~= idx);
    iC = iC(iC ~= idx);
    iS = iS(iS ~= idx);
    iN = unique(cat(1, iR, iC, iS));
end