function E = init_elim_board(varargin)
    % INIT_ELIM_BOARD  construct and initialize an "elimination" board,
    % i.e. an 81-element cell array where each element contains the
    % possible values that can go in the corresponding square
    %
    %    E = INIT_ELIM_BOARD() returns an empty elimination board
    %
    %    E = INIT_ELIM_BOARD(init_board) returns an elim board where the
    %    known cells of init_board are filled in
    %
    E = repmat({1:9}, [9 9]);
    if nargin == 1
        init_board = varargin{1};
        E(logical(init_board)) = num2cell(init_board(logical(init_board)));
    end
end