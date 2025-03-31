import os
from flask import Flask

app = Flask(__name__)  # Corrected __name__

@app.route("/")
def main():
    return "Welcome to Batch15!"

@app.route("/how-are-you")
def hello():
    return "I am good, how about you?"

if __name__ == "__main__":  # Corrected __name__
    app.run()  # Ensure it runs on 0.0.0.0 for container access


    
