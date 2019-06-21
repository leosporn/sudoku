function [board, solved_board] = load_sudoku(varargin)
    % LOAD_SUDOKU  Load a sudoku board
    %    board = LOAD_SUDOKU(X), where X is a 81-element array, reshapes
    %    the array into a 9x9 array.
    %
    %    board = LOAD_SUDOKU(filename) returns the sudoku board saved in
    %    filename.
    %
    %    board = LOAD_SUDOKU(difficulty, ID) returns the board of
    %    difficulty (1-16) and ID (a-c)
    %
    if nargin == 1 && numel(varargin{1}) == 81
        board = reshape(varargin{1}, [9 9]);
        solved_board = NaN;
    elseif nargin == 1 && ischar(varargin{1})
        [filepath, name, ext] = fileparts(varargin{1});
        board_filename        = fullfile(filepath, [name ext]);
        solved_board_filename = fullfile('sudoku', 'solutions', [name '_s' ext]);
        board        = load_sudoku(txtfile2board(       board_filename));
        solved_board = load_sudoku(txtfile2board(solved_board_filename));
    elseif nargin == 2
        difficulty = varargin{1};
        ID = varargin{2};
        filename = sprintf('s%02d', difficulty);
        if difficulty < 16
            filename = [filename ID];
        end
        filename = fullfile('sudoku', 'sudokus', [filename '.txt']);
        [board, solved_board] = load_sudoku(filename);
    end
    % Helper to load board from txt file
    function board = txtfile2board(filename)
        fileID = fopen(filename);
        rawtxt = fscanf(fileID, '%s');
        fclose(fileID);
        switch numel(rawtxt)
            case 81
                txt = rawtxt;
            case 213
                rep = @(s) repmat(num2str(s), [1 9]);
                str2remove = {'=0,45'; '-'; '|'; rep(0); rep(45)};
                txt = erase(rawtxt, str2remove);
        end
        board = zeros([9 9]);
        for n = 1:numel(board)
            board(n) = str2double(txt(n));
        end
        board = board';
    end
end