from flask import Flask

app = (Flask(__name__))

@app.route('/')
def home():
    return '<h1>Hello World!</h1>'

@app.route('/usuario')
def buscar_usuario():
    usuario = {
        "nome": "Natalia",
        "idade": 16,
        "telefone": "(19) 99912-6716"
    }
    return usuario


if __name__ == '__main__':
    app.run(debug=True)