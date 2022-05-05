from sklearn.externals import joblib
from sklearn.preprocessing import StandardScaler

class Diagnosis:
    def  __init__(self):
        # rf_best model import 
        self.cbc_model_rf_best = joblib.load('./models/cbc-model1-rf.pkl')
        # self.samples_for_cbc = [
        #     [58.0,3.55,1.66,0.33,1.43,0.12,0.0,3.4,11.6], #thrombocytopenia
        #     [83.0,9.48,7.09,1.12,1.06,0.2,0.0,3.29,13.3], #thrombocytopenia
        #     [433.0,14.08,10.42,0.96,2.6,0.07,0.07,4.29,10.3], #leukocytosis
        #     [382.0,5.88,2.54,0.66,2.61,0.06,0.0,3.53,0.0] #anemia
        # ]

        self.thyroid_model_scaler = joblib.load('./models/thyroid-scaler.pkl')
        self.thyroid_model_rf = joblib.load('./models/thyroid-model-rf.pkl')
        # self.samples_for_thyroid = [
        #     [0, 0, 80, 1, 0.8, 105], #1 => has thyroid
        #     [0, 0, 19, 1, 2.3, 107]  #0 => Normal
        # ]

        self.diabetes_model_scaler = joblib.load('./models/diabetes-scaler-rf-4.pkl')
        self.diabetes_model_rf_4 = joblib.load('./models/diabetes-model-rf-4.pkl')
        # self.samples_for_diabetes = [
        #     [1, 189, 846, 59], #1 => Diabetic
        #     [7, 159, 102.5, 40]  #0 => Normal
        # ]

    def cbc_codeToLabel(self, x):
        if(x == 1): return "Thrombocytopenia"
        elif(x == 2): return "Normal"
        elif(x == 4): return "Leukocytosis"
        elif(x == 5): return "Anemia"

    def cbc(self, features):
        '''
        input to  the model:
        features should be a linear array with these values:
        PLT, WBC, NEUT, MONO, LYMPH, EO, IG, RBC, MPV
        '''
        print(features)
        try:
            result = self.cbc_model_rf_best.predict([features])
            print(result)
            result = self.cbc_codeToLabel(result)
            print(result)
        except:
            result = "-1"
        return result
    
    def diabetes(self, features):
        '''
        input to  the model:
        features should be a linear array with these values:
        'Pregnancies','Glucose','Insulin','Age'
        '''
        print(features)
        try:
            sample = self.diabetes_model_scaler.transform([features])
            print("Scaled input : ", sample)
            result = self.diabetes_model_rf_4.predict(sample)[0]
            print(result)
            if result == 0 : result = "Normal"
            elif result == 1 : result = "Diabetic"
        except:
            result = "Could not make the diagnosis"
        return str(result)


    def thyroid(self, features):
        '''
        input to  the model:
        features should be a linear array with these values:
        'thyroid_surgery', 'pregnant', 'age', 'sex', 'T3','TT4'
        '''
        print(features)
        try:
            sample = self.thyroid_model_scaler.transform([features])
            print("Scaled input : ", sample)
            result = self.thyroid_model_rf.predict(sample)[0]
            print(result)
            if result == 0 : result = "Normal"
            elif result == 1 : result = "Have thyroid disease"
            
        except Exception as e:
            print(e)
            result = "Could not make the diagnosis"
        return str(result)