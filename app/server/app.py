from diagnosis import Diagnosis
from flask import Flask, request

diagnosis = Diagnosis()
app = Flask(__name__)
static_api_token = "demo-api-token-4F3jpeacm2aRzZw"

@app.route("/")
def home():
    return app.send_static_file('index.html')

def check_token(token):
    #dummy token vaidation
    if(token == static_api_token):
        return True
    return False

@app.route('/predict-cbc', methods=['POST'])
def predict_cbc():
    data = request.get_json()
    try:
        sample = [float(i) for i in data['data'].values()]
        tokenValid = check_token(data['token'])
        if(not tokenValid):raise "Error"
        return{
            "status" : 0,
            "diagnosis" : diagnosis.cbc(sample),
        }
    except Exception as e:
        print(e)
        return{
            "status" : 1,
            "details" : "May be data format error or absence of required number of args",
        }

@app.route('/predict-diabetes', methods=['POST'])
def predict_diabetes():
    data = request.get_json()
    try:
        sample = [float(i) for i in data['data'].values()]
        print(sample)
        if(not check_token(data['token'])):raise "Error"
        return{
            "status" : 0,
            "diagnosis" : diagnosis.diabetes(sample),
        }
    except:
        return{
            "status" : 1,
            "details" : "May be data format error or absence of required number of args",
        }

@app.route('/predict-thyroid', methods=['POST'])
def predict_thyroid():
    data = request.get_json()
    try:
        sample = [float(i) for i in data['data'].values()]
        if(not check_token(data['token'])):raise "Error"
        return{
            "status" : 0,
            "diagnosis" : diagnosis.thyroid(sample),
        }
    except:
        return{
            "status" : 1,
            "details" : "May be data format error or absence of required number of args",
        }

if __name__ == "__main__":
    #app.run(debug=True, port=5000)
    #app.run(debug = True)
    app.run(debug = True, host = '0.0.0.0', port = 5000)


'''
heroku login
git init
heroku git:remote -a final-project-diag-app #using emmanuvelbony@somemail.com account
git add .
git commit -m "good"
git push heroku master
'''