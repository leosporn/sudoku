function [row_idx, col_idx, ssq_idx] = get_rcs_idx(idx)
    % GET_RCS_IDX  gets index of all squares in the same row, column, and
    % subsquare as square idx
    %    [row_idx, col_idx, ssq_idx] = GET_RCS_IDX(idx)
    I = (1:81)';
    f_col = @(x) floor((x - 1)/9);
    f_ssq = @(x) 3*floor((x - 1)/27) + floor(mod((x - 1)/3, 3));
    row_idx = I(~mod(I - idx, 9));
    col_idx = I(~(f_col(I) - f_col(idx)));
    ssq_idx = I(~(f_ssq(I) - f_ssq(idx)));
end