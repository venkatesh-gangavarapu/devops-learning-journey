from flask import Flask
import redis
import psycopg2
import os

app = Flask(__name__)

redis_client = redis.Redis(
    host=os.getenv("REDIS_HOST"),
    port=6379,
    decode_responses=True
)

@app.route("/health")
def health():
    return {"status": "UP"}, 200

@app.route("/")
def home():
    redis_client.set("visits", redis_client.get("visits") or 0)
    redis_client.incr("visits")

    try:
        conn = psycopg2.connect(
            host=os.getenv("DB_HOST"),
            database=os.getenv("DB_NAME"),
            user=os.getenv("DB_USER"),
            password=os.getenv("DB_PASSWORD")
        )
        db_status = "DB Connected"
        conn.close()
    except Exception as e:
        db_status = f"DB Error: {e}"

    visits = redis_client.get("visits")
    return {
        "message": "Production App Running",
        "redis_visits": visits,
        "database": db_status
    }

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
