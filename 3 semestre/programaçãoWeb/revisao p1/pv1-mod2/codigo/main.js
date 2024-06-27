const qtdProduto = document.querySelector('#qtdProduto');
const nomeProdutoInput = document.querySelector('#nomeProduto');
const btnAdd = document.querySelector('#btnAdicionar');
const listaProdutos = document.querySelector('#listaProdutos');

btnAdd.addEventListener('click', () => {
    let qtd = Number(qtdProduto.value);
    let nomeProduto = nomeProdutoInput.value;
    if(nomeProduto === ''){
        alert('Nome do produto não pode ser vazio');
        return;
    }

    const li = document.createElement('li');
    li.innerHTML = `&bull; ${nomeProduto}. Quantidade: ${qtd}`;
    const btnNovoProduto = document.createElement('button');
    btnNovoProduto.innerHTML = 'X';
    btnNovoProduto.addEventListener('click', remover);
    li.append(btnNovoProduto);
    listaProdutos.append(li);
});

const remover = (e) =>{
    e.target.parentNode.remove();
}