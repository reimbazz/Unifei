const opcao1 = document.querySelector('#OP1');
const opcao2 = document.querySelector('#OP2');
const btnCalcula = document.querySelector('#btnCalcula');
const btnAdd = document.querySelector('#btnAdd');
const areaOperador = document.querySelector('#operador');
const btnSub = document.querySelector('#btnSub');
const btnMulti = document.querySelector('#btnMulti');
const areaResposta = document.querySelector('#idResposta');

let operador = 0;
let resposta = 0;

btnAdd.addEventListener('click', () =>{
    operador = 1;
    areaOperador.innerHTML = `+`;

});

btnSub.addEventListener('click', () =>{
    operador = 2;
    areaOperador.innerHTML = `-`;
});

btnMulti.addEventListener('click', () =>{
    operador = 3;
    areaOperador.innerHTML = `*`;
});

btnCalcula.addEventListener('click', () =>{
    if (opcao1.value === '' || opcao2.value === '') {
        alert('Operandos nao podem estar vazios!');
        return;
    }

    let OP1 = Number(opcao1.value);
    let OP2 = Number(opcao2.value);

    if (operador === 1) {
        resposta = OP1 + OP2;
        areaResposta.innerHTML = `${resposta}`;
    }
    else if (operador === 2) {
        resposta = OP1 - OP2;
        areaResposta.innerHTML = `${resposta}`;
    }
    else if (operador === 3) {
        resposta = OP1 * OP2;
        areaResposta.innerHTML = `${resposta}`;
    }

});