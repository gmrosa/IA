% fun��o que calcula o beta 0
function b0 = bZero(x, y, xMedia, yMedia, b1)
  b0 = (yMedia - (b1 * xMedia));
end