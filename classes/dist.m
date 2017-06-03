function dist = dist(p, q)
  dist = (p.-q).^2;
  dist = sum(dist);
  dist = sqrt(dist);
end;