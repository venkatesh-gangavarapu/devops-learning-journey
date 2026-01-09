from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify(
            message="DevOps CI/CD application is running",
            environment=os.getenv("ENV", "local")
    )

@app.route("/health")
def health():
    return jsonify(status="BROKEN"), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
