# Fibonacci
# Solved using dynamic programming, both via tabulation (with iteration) and
# memoization (with recursion).

def fibonacci(n)
    # Method 1: Dynamic programming: tabulation (iteration)
=begin
    fibs = Array.new(n+1)
    fibs[0] = 0
    fibs[1] = 1
    for i in 2..n
        fibs[i] = fibs[i-1] + fibs[i-2]
    end
    return fibs[n]
=end

    # Method 2: Dynamic programming: memoization (recursion)
    fibs = {}

    fib = lambda do |num|
        return 0 if num == 0
        return 1 if num == 1
        fibs[num-1] ||= fib.call(num-1)
        fibs[num-2] ||= fib.call(num-2)
        fibs[num] = fibs[num-1] + fibs[num-2]
        return fibs[num]
    end

    fib.call(n)

    return fibs[n]
end

n = gets.to_i
print(fibonacci(n))
