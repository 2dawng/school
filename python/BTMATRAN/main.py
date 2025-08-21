from MaTran import *


def main():
    n = int(input())
    a = inputMatrix(n)
    print("Original Matrix:")
    print_matrix(a)
    print("\nTransposed Matrix:")
    print_matrix(transpose_matrix(a))
    print("\nDiagonal Matrix:")
    print_matrix(diagonal_matrix(a))
    print("\nTransformed Matrix b:")
    print_matrix(create_matrix_b(a))
