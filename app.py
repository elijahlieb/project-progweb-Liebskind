from flask import Flask, jsonify

app = Flask(__name__)

# Données factices pour l'exemple (en mémoire)
items = [
    {"id": 1, "title": "Machine Learning pour la science des données", "level": "M1"},
    {"id": 2, "title": "Programmation Web & Cloud Native", "level": "M1"}
]

@app.route('/', methods=['GET'])
def home():
    return jsonify({"message": "Bienvenue sur le microservice Python du projet !"}), 200

@app.route('/items', methods=['GET'])
def get_items():
    return jsonify(items), 200

if __name__ == '__main__':
    # Écoute sur toutes les interfaces réseau, port 8080
    app.run(host='0.0.0.0', port=8080)