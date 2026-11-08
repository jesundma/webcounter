from flask import Flask, redirect, render_template, request
from counter import Counter

app = Flask(__name__)
cnt = Counter()

@app.route("/")
def index():
    return render_template("index.html", value=cnt.value)

@app.route("/increment", methods=["POST"])
def increment():
    cnt.increase()
    return redirect("/")

@app.route("/reset", methods = ["POST"])
def reset():
    cnt.reset()
    return redirect("/")

@app.route("/submit", methods=["POST"])
def submit():
    value = request.form.get("value", type=int)
    cnt.value = value
    return redirect("/")