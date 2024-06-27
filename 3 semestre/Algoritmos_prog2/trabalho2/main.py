import random

#Voce pode criar funcoes auxiliares a vontade

def insertion_sort(l):
	for i in range(1, len(l)):
		j = i
		while j > 0 and l[j] < l[j-1]:
			l[j], l[j-1] = l[j-1], l[j]
			j -= 1
	return

def main():
	
## NÃƒO ALTERE AS 5 LINHAS ABAIXO CÃ“DIGO ABAIXO ##
	n, k = map(int, input().strip().split())
	random.seed(48 + n + k)
	A = [random.randint(0, 2**48) for i in range(n)] 
	i = [random.randint(1, n) for i in range(k)]
	insertion_sort(i)
	
##  Esse MÃ©todo funciona mas Ã© muito lerdo, melhore
## lembre que Ã© proibido usar a funÃ§Ã£o sort do python

	insertion_sort(A)
	for j in range(k):
		print(A[i[j] - 1], end=' ')


if __name__ == "__main__":
	main()