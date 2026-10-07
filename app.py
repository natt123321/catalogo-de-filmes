from flask import Flask, request, jsonify

app = (Flask(__name__))

@app.route('/')
def home():
    return '<h1>Hello World!</h1>'

@app.route('/usuario', methods=['GET'])
def buscar_usuario():
    usuario = {
        "nome": "Natalia",
        "idade": 16,
        "telefone": "(19) 99912-6716"
    }
    return usuario

@app.route('/produto', methods=['POST'])
def cadastrar_produto():
    dados = request.get_json()

    if not dados:
        return jsonify({"Erro": "Dados inválidos"}), 400

    print(f'Novo produto: {dados}')

    return jsonify({"Message": "Salvo com sucesso!", "produto_cadastrado": dados }), 201

@app.route('/produto', methods=['PUT'])
def atualizar_produto():
    produto = {
        "descricao": "Lápis de escrever de ponta fina",
        "id": 1,
        "marca": "Faber Castell",
        "nome": "Lápis Grafite",
        "preco": 1.5
    }

    dados = request.get_json()

    if not dados:
        return jsonify({"erro": "Dados Inválidos"}), 400

    if dados['id'] == produto['id']:
        produto = dados
        print(f"Produto atualizado com sucesso!: {produto}")
        return jsonify({"Message": "Produto atualizado com sucesso!"}), 201
    else:
        return jsonify({"Message": "Produto não encontrado!"}), 404


if __name__ == '__main__':
    app.run(debug=True)