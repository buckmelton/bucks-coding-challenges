# PRIMALITY

# Source: HackerRank
# Determine if a number is prime

def prime?(n)

    return false if n == 0
    return false if n == 1

    for i in 2..Math::sqrt(n)
        return false if n % i == 0
    end

    return true

end
