function B = mat2gray(A, outRange)
%MAT2GRAY Scale numeric data into a target interval.
%   B = MAT2GRAY(A) rescales A using its minimum and maximum values into
%   the interval [0, 1].
%   B = MAT2GRAY(A, [LOW HIGH]) rescales A using its minimum and maximum
%   values into the interval [LOW, HIGH].

if isempty(A)
    B = A;
    return
end

if nargin < 2 || isempty(outRange)
    validValues = A(~isnan(A));
    if isempty(validValues)
        B = nan(size(A));
        return
    end
    outRange = [0, 1];
end

if numel(outRange) ~= 2
    error('mat2gray:InvalidRange', 'Output range must be a two-element vector.')
end

validValues = A(~isnan(A));
if isempty(validValues)
    B = nan(size(A));
    return
end

low = min(validValues(:));
high = max(validValues(:));
outLow = outRange(1);
outHigh = outRange(2);

if any(isnan([outLow, outHigh]))
    B = nan(size(A));
    return
end

if outHigh < outLow
    error('mat2gray:InvalidRange', 'Output range must satisfy range(2) >= range(1).')
end

if high == low
    B = double(A > high);
    B = outLow + B .* (outHigh - outLow);
    B(isnan(A)) = NaN;
    return
end

B = (double(A) - low) ./ (high - low);
B = min(max(B, 0), 1);
B = outLow + B .* (outHigh - outLow);
B(isnan(A)) = NaN;
end
