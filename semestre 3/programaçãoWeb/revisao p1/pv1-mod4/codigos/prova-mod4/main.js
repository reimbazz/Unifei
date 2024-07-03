const nomeProdutoInput = document.querySelector('#nomeProduto');
const btnAdd = document.querySelector('#btnAdicionar');
const listaProdutos = document.querySelector('#listaProdutos');
const btnAddQtd = document.querySelector('#btnAdd');
const btnRemQtd = document.querySelector('#btnRem');
const mostradorQtd = document.querySelector('#qtdProdutos');
const totalItemsSpan = document.querySelector('#totalProdutos');
let totalItems = [];

btnAddQtd.addEventListener('click', () => {
    let qtdAtual = Number(mostradorQtd.innerText);
    qtdAtual++;
    mostradorQtd.innerText = qtdAtual;
});

btnRemQtd.addEventListener('click', () => {
    let qtdAtual = Number(mostradorQtd.innerText);
    qtdAtual--;
    if(qtdAtual <= 1)
        qtdAtual = 1;
    mostradorQtd.innerText = qtdAtual;
    
});

btnAdd.addEventListener('click', () => {
    let nomeProduto = nomeProdutoInput.value;
    if(nomeProduto === ''){
        alert('Nome do produto não pode ser vazio');
        return;
    }
    const li = document.createElement('li');
    li.innerHTML = `&bull; ${nomeProduto}. Quantidade: ${mostradorQtd.innerText}`;

    const btnRemover = document.createElement('button');
    btnRemover.append('X');
    btnRemover.addEventListener('click', removerProduto);
    li.append(btnRemover);
        
    listaProdutos.append(li);
    totalItems.push(0);
    totalItemsSpan.innerText = totalItems.length;
    mostradorQtd.innerText = 1;
});

const removerProduto = (e) =>{
    totalItems.pop();
    totalItemsSpan.innerText = totalItems.length;
    e.target.parentNode.remove();
}