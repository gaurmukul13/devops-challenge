from flask import Flask, request, jsonify
import datetime

app = Flask(__name__)

@app.route('/')
def get_time_and_ip():
    # Get current timestamp
    current_time = datetime.datetime.now().isoformat()

    # Get the visitor's IP address
    visitor_ip = request.remote_addr

    return jsonify({
        "timestamp": current_time,
        "ip": visitor_ip
    })

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)
#docker push gaurmukul378/simpletimeservice:latest

