from flask import Flask
import google.generativeai as genai
import os
from flask.cli import load_dotenv
# Flask Constructor
app = Flask(__name__)
load_dotenv()
genai.configure(api_key=os.environ["API_KEY"])
model = genai.GenerativeModel('gemini-1.5-flash')
# decorator to associate
# a function with the url
@app.route("/ai/<question>")
def getAIResponse(question):
    # response from the server
    response = model.generate_content(question)
    print(response.text)
    return response.text


if __name__ == "__main__":
    app.run(host="0.0.0.0")
