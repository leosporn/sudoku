function [success, board] = issolved(elim)
%     board = zeros([3 3 3 3], 'uint8');
%     issolvedsquare = sum(elim(:, :) ~= 0) == 1;
%     success = all(issolvedsquare);
%     for n = 1:numel(board)
%         if issolvedsquare(n)
%             board(n) = elim(elim(:, n) ~= 0, n);
%         end
%     end
end