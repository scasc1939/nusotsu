local my = {}

-- coprime(a, b)
-- if a is prime to b, return 1.
-- if not, return 0.
function my.coprime(a, b)
    if a == 1 and b == 1 then
        return 1
    end
    for n = 2, math.max(a, b) do
        if a % n == 0 and b % n == 0 then
            return 0
        end
    end
    return 1
end

return my