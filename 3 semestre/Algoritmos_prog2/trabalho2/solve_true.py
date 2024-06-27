# Amon Lemes dos Santos - 2023005290
# Pedro Reimberg de Oliveira - 2023006537
import random

def insertion_sort(l):
    for i in range(1, len(l)):
        j = i
        while j > 0 and l[j] < l[j-1]:
            l[j], l[j-1] = l[j-1], l[j]
            j -= 1
    return

# se elemento < pivot move pra esquerda
# se elemento > pivot move pra direita
def partition(list, low, high):
    pivot_index = random.randint(low, high)
    list[high], list[pivot_index] = list[pivot_index], list[high]
    pivot = list[high]
    i = low - 1
    for j in range(low, high):
        if list[j] <= pivot:
            i += 1
            list[i], list[j] = list[j], list[i]
    list[i + 1], list[high] = list[high], list[i + 1]
    return i + 1

def quickselect(list, low, high, indexes, results):
    if low <= high and indexes:
        pivot = partition(list, low, high)
        
        # maiores e menores indices em relacao ao pivot
        left_indexes = [index for index in indexes if index - 1 < pivot]
        right_indexes = [index for index in indexes if index - 1 > pivot]
        
        # se pivot == index, lista[pivot] é k
        for index in indexes:
            if index - 1 == pivot:
                results[index] = list[pivot]
        
        quickselect(list, low, pivot - 1, left_indexes, results)
        quickselect(list, pivot + 1, high, right_indexes, results)
        
def k_selection(A, indexes):
    results = {}
    quickselect(A, 0, len(A) - 1, indexes, results)
    return results

def main():
    ## NÃO ALTERE AS 5 LINHAS ABAIXO CÓDIGO ABAIXO ##
    n, k = map(int, input().strip().split())
    random.seed(48 + n + k)
    A = [random.randint(0, 2**48) for _ in range(n)] 
    i = [random.randint(1, n) for _ in range(k)]
    insertion_sort(i)

    results = k_selection(A, i)
    for j in i:
        print(results[j], end=' ')

if __name__ == "__main__":
    main()
