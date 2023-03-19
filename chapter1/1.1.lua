function fact(n)
  if n < 0 then
    return nil
  end

  if n == 0 then
    return 1
  else
    return n * fact(n - 1)
  end
end

print("enter a number:")
a = io.read("*number") -- read a number
print(fact(a))


-- 1.2 dofile :)
-- 1.3 ada language
-- 1.4 ___ _end NULL End
-- 1.5 false as type returns String
-- 1.6

function is_boolean(x)
  return x == true or x == false
end
