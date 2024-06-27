const express = require('express');
const fs = require('fs');
const cors = require('cors');
const path = require('path');

const app = express();
app.use(express.json());
app.use(cors());

app.post('/login', (req, res) => {
    const { email, password } = req.body;

    fs.readFile(path.join(__dirname, 'db', 'banco-dados-usuario.json'), 'utf8', (err, data) => {
        if (err) {
            console.error('Erro ao ler o arquivo:', err);
            return res.status(500).json('Erro no servidor');
        }

        const users = JSON.parse(data);
        const existUser = users.find(u => u.email === email);
        if (existUser) {
            const isLoginValid = users.find(u => u.email === email && u.password === password);
            if (isLoginValid) {
                res.status(200).json('Autenticado com Sucesso');
            } else {
                res.status(401).json('Email ou senha incorretos');
            }
        } else {
            res.status(401).json(`Usuario com email ${email} não existe. Considere criar uma conta!`);
        }
    });
});

app.post('/create', (req, res) => {
    const { email, password, username } = req.body;

    fs.readFile(path.join(__dirname, 'db', 'banco-dados-usuario.json'), 'utf8', (err, data) => {
        if (err) {
            console.error('Erro ao ler o arquivo:', err);
            return res.status(500).json('Erro no servidor');
        }

        let users = JSON.parse(data);
        const existUser = users.find(u => u.email === email);
        if (existUser) {
            return res.status(400).json(`Usuario com email ${email} já existe!`);
        }

        const maxId = users.reduce((max, user) => (user.id > max ? user.id : max), 0);
        const newId = maxId + 1;

        users.push({ id: newId, email, password, username });

        fs.writeFile(path.join(__dirname, 'db', 'banco-dados-usuario.json'), JSON.stringify(users, null, 2), 'utf8', (err) => {
            if (err) {
                console.error('Erro ao escrever no arquivo:', err);
                return res.status(500).json('Erro no servidor');
            }

            res.status(201).json('Tudo certo usuario criado com sucesso.');
        });
    });
});

app.listen(3000, () => {
    console.log('Servidor na porta 3000');
});
