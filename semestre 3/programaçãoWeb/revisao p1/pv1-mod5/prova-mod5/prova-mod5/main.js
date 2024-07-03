const operando1 = document.querySelector('#operando1');
const operando2 = document.querySelector('#operando2');
const operacaoEscolhida = document.querySelector('#operacao');

const btnSomar = document.querySelector('#btnSoma');
const btnSub = document.querySelector('#btnSub');
const btnMul = document.querySelector('#btnMul');
const btnExecuta = document.querySelector('#btnOperacao');

const resultado = document.querySelector('#numRes');

const alteraOperacao = (e) => {
    operacaoEscolhida.innerHTML = e.target.innerText;
}

btnSomar.addEventListener('click', alteraOperacao);
btnSub.addEventListener('click', alteraOperacao);
btnMul.addEventListener('click', alteraOperacao);

btnExecuta.addEventListener('click', () => {
    let op = operacaoEscolhida.innerHTML;
    if(operando1.value === '' || operando2.value === ''){
        alert('Operandos não podem ser vazios!');
        return;
    }
    let res = 0;
    let op1 = Number(operando1.value);
    let op2 = Number(operando2.value);
    
    switch (op) {
        case '+':
            res = op1 + op2;
            break;
        case '-':
            res = op1 - op2;
            break;
        case '*':
            res = op1 * op2;
            break;
    }
    resultado.innerHTML = res;

});