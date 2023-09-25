import numpy as np
import matplotlib.pyplot as plt

def sieve_of_eratosthenes(limit):
    is_prime = [True] * (limit + 1)
    is_prime[0] = is_prime[1] = False
    primes = []

    for p in range(2, int(limit ** 0.5) + 1):
        if is_prime[p]:
            for i in range(p * p, limit + 1, p):
                is_prime[i] = False

    for i in range(2, limit + 1):
        if is_prime[i]:
            primes.append(i)

    return primes

rows, cols = 10, 12
matrix = np.zeros((rows, cols), dtype=int)
primes = sieve_of_eratosthenes(rows * cols)

fig, ax = plt.subplots()
ax.matshow(matrix, cmap='gray')

for prime in primes:
    for i in range(rows):
        for j in range(cols):
            number = i * cols + j + 1
            if number == prime:
                matrix[i][j] = prime
            elif number % prime == 0:
                matrix[i][j] = -1  # Marcar múltiplos

    ax.matshow(matrix, cmap='viridis')
    plt.pause(0.5)

plt.show()

