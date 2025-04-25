from presidio_analyzer import AnalyzerEngine
from flask import Flask, request, jsonify

app = Flask(__name__)
analyzer = AnalyzerEngine()

@app.route("/analyze", methods=["POST"])
def analyze():
    data = request.get_json()
    text = data.get("text", "")
    language = data.get("language", "en")
    results = analyzer.analyze(text=text, language=language)
    return jsonify([r.to_dict() for r in results])

@app.route("/", methods=["GET"])
def home():
    return "Presidio Analyzer is running."

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=3000)
