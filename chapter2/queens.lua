local inspect = require('inspect')

N = 8
isplaceok_count = 0

function isplaceok(a, n, c)
  isplaceok_count = isplaceok_count + 1

  for i = 1, n - 1 do
    if (a[i] == c) or
        (a[i] - i == c - n) or
        (a[i] + i == c + n) then
      return false
    end
  end

  return true
end

function printsolution(a)
  for i = 1, N do
    for j = 1, N do
      io.write(a[i] == j and "X" or "-", " ")
    end
    io.write("\n")
  end
  io.write("\n")
end

function addqueen(a, n)
  if n > N then
    printsolution(a)
    return true;
  end

  for c = 1, N do
    if isplaceok(a, n, c) then
      a[n] = c

      if (addqueen(a, n + 1)) then
        return true;
      end
    end
  end

  return false;
end

function allpossiblepermutations(a, n)
  if n > N then
    for c = 1, N do
      if not isplaceok(a, c, a[c]) then
        return
      end
    end
    printsolution(a)

    return;
  end

  for c = 1, N do
    for i = 1, n - 1 do
      if a[i] == c then
        break
      end
    end

    a[n] = c
    addqueen(a, n + 1)
  end

  return false
end


allpossiblepermutations({}, 1)
print(isplaceok_count) -- addqueen 876, permutations 2212
