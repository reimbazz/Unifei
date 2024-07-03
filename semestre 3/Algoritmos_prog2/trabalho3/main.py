# Pedro Reimberg de Oliveira 2023006537

import csv
import sys


class Node:
    def __init__(self, pergunta=None, esq=None, dir=None, eFolha=False, resultado=None, altura=0):
        self.pergunta = pergunta
        self.esq = esq
        self.dir = dir
        self.eFolha = eFolha
        self.resultado = resultado
        self.altura = altura


def leituraCSV(arquivo):
    with open(arquivo, newline='') as csvfile:
        leitor = csv.reader(csvfile)
        data = list(leitor)

    # primeira linha possui numero de elementos e de perguntas, e as perguntas
    numElementos, numPerguntas = map(int, data[0][0].split())
    perguntas = data[0][1:]

    # o resto possui os elementos e seus "caminhos"
    elementos = [linha for linha in data[1:]]

    return numElementos, numPerguntas, perguntas, elementos

# contrução da arvore de decisao


def contruirArvore(data, perguntas, profundidade=0):
    # se tiver um unico elemento retorna nó folha
    if len(data) == 1:
        return Node(eFolha=True, resultado=data[0][0], altura=profundidade)

    melhorPergunta = None
    menorDiff = float('inf')

    # melhor pergunta é a que minimiza a diferença entre sims e naos
    for i, pergunta in enumerate(perguntas):
        countSim = sum(int(linha[i + 1]) for linha in data)
        countNao = len(data) - countSim
        diff = abs(countSim - countNao)

        if diff < menorDiff:
            menorDiff = diff
            melhorPergunta = i

    # se nao tiver melhor pergunta pega um no folha
    if melhorPergunta is None:
        return Node(eFolha=True, resultado=data[0][0], altura=profundidade)

    # dividir os dados em subarvores de acordo com a melhor pergunta
    esqData = [linha for linha in data if linha[melhorPergunta + 1] == '1']
    dirData = [linha for linha in data if linha[melhorPergunta + 1] == '0']

    # controi as subarvores com recursao
    subArvoreEsq = contruirArvore(esqData, perguntas, profundidade + 1)
    subArvoreDir = contruirArvore(dirData, perguntas, profundidade + 1)

    # retorna no com a pergunta e as subarvores
    return Node(pergunta=perguntas[melhorPergunta], esq=subArvoreEsq, dir=subArvoreDir, altura=profundidade)


def calculaMedia(node):
    alturaTotal = 0
    countFolhas = 0

    # funcaozinha para percorrer a arvore toda, calculando a altura total e numero de folhas
    def percorre(node):
        nonlocal alturaTotal, countFolhas
        if node.eFolha:
            alturaTotal += node.altura
            countFolhas += 1
        else:
            if node.esq:
                percorre(node.esq)
            if node.dir:
                percorre(node.dir)

    percorre(node)
    return alturaTotal / countFolhas if countFolhas > 0 else 0


def main():
    nomeArq = input().strip()
    numElementros, numPerguntas, perguntas, elementos = leituraCSV(nomeArq)

    Arvore = contruirArvore(elementos, perguntas)
    media = calculaMedia(Arvore)

    print(f"{media:.2f}")


if __name__ == "__main__":
    main()
