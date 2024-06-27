const nomeProduto = document.querySelector('#nomeProduto');
const btnAumentar = document.querySelector('#aumentaQtd');
const btnDiminuir = document.querySelector('#diminuiQtd');
const areaQtd = document.querySelector('#areaQtd');
const btnAdicionar = document.querySelector('#btnAdicionar');
const listaProdutos = document.querySelector('#listaProdutos');
const areaTotal = document.querySelector('#totalProdutos');

let itens = 0;
let quantidade = 1;

btnAumentar.addEventListener('click', () =>{
    quantidade +=1;
    areaQtd.innerHTML = `${quantidade}`;
});
btnDiminuir.addEventListener('click', () =>{
    quantidade -=1;
    areaQtd.innerHTML = `${quantidade}`;
});

btnAdicionar.addEventListener('click', () =>{
    if (nomeProduto.value === '') {
        alert('Nome do produto nao pode ser vazio');
        return;
    }
    let nomeP = nomeProduto.value;

    const item = document.createElement('li');
    item.innerHTML = `${nomeP}. Quantidade: ${quantidade}.`;

    const btnRemover = document.createElement('button');
    btnRemover.append('X');
    btnRemover.addEventListener('click', remover);
    item.append(btnRemover);
    listaProdutos.append(item);
    itens += 1;
    areaTotal.innerHTML = `${itens}`;
    quantidade = 1;
    areaQtd.innerHTML = `${quantidade}`;

});

const remover = (e) =>{
    itens -= 1;
    e.target.parentNode.remove();
    areaTotal.innerHTML = `${itens}`;
}