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

-- 2.1
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

-- 2.2
function allpossiblepermutations(a, n)
  if n > N then
    for r = 1, N do
      if not isplaceok(a, r, a[r]) then
        return
      end
    end

    printsolution(a)
    return;
  end


  for c = 1, N do
    a[n] = c
    allpossiblepermutations(a, n + 1)
  end
end


allpossiblepermutations({}, 1)
print(isplaceok_count) -- addqueen 876, permutations 50889536
