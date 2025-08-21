# def transposeMatrix(matrix):
#     return [[row[i] for row in matrix] for i in range(len(matrix[0]))]


# def diagonalMatrix(matrix):
#     rows = len(matrix)
#     cols = len(matrix[0])
#     new_matrix = [[0 if i != j else matrix[i][j]
#                    for j in range(cols)] for i in range(rows)]
#     return new_matrix


# def bMatrix(matrix):
#     row_sums = [sum(row) for row in matrix]

#     col_sums = [sum(col) for col in transposeMatrix(matrix)]

#     b = [[0 for _ in range(len(matrix[0]))] for _ in range(len(matrix))]

#     for i in range(len(matrix)):
#         for j in range(len(matrix[0])):
#             b[i][j] = row_sums[i] + col_sums[j] - matrix[i][j]

#     return b


# n = int(input("Enter the number of rows: "))
# m = int(input("Enter the number of columns: "))
# matrix = []
# for i in range(n):
#     row = list(map(int, input().split()))
#     matrix.append(row)

# print("Original Matrix:")
# for row in matrix:
#     print(row)

# print("\nTransposed Matrix:")
# for row in transposeMatrix(matrix):
#     print(row)

# print("\nDiagonal Matrix:")
# for row in diagonalMatrix(matrix):
#     print(row)

# print("\nTransformed Matrix b:")
# for row in bMatrix(matrix):
#     print(row)

import numpy as np


def inputMatrix(n):
    matrix = np.array([list(map(int, input().split())) for i in range(n)])
    return matrix


n = int(input())
a = inputMatrix(n)


def print_matrix(matrix):
    for row in matrix:
        print(row)


def transpose_matrix(matrix):
    return matrix.T


def diagonal_matrix(matrix):
    return np.diag(np.diag(matrix))


def create_matrix_b(a):
    row_sums = a.sum(axis=1)
    col_sums = a.sum(axis=0)

    b = row_sums[:, np.newaxis] + col_sums - a

    return b


print("Original Matrix:")
print_matrix(a)
print("\nTransposed Matrix:")
print_matrix(transpose_matrix(a))
print("\nDiagonal Matrix:")
print_matrix(diagonal_matrix(a))
print("\nTransformed Matrix b:")
print_matrix(create_matrix_b(a))
