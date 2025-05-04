from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import mysql.connector
import joblib
import os

# Initialize app and model 
app = FastAPI()
model_path = os.path.join(os.path.dirname(__file__), "..", "university_recommendation_model.pkl")
model = joblib.load(model_path)
print(f"Model loaded: {model}")  # Debug log

# --------------------- INPUT SCHEMA --------------------- #
class StudentInput(BaseModel):
    track: str
    student_grade: float
    preferred_major: str
    preferred_location: str
    university_type: str
    tuition_budget: float

# --------------------- DATABASE CONNECTION --------------------- #
def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="Boda189**",
        database="uni_rec",
        buffered=True  # Add this line
    )

# --------------------- HELPER FUNCTION --------------------- #
def check_major_and_university(cursor, preferred_major, university_type):
    print(f"Checking major/university info for: {preferred_major}, Type: {university_type}")  # Debug log
    cursor.execute("""
        SELECT m.Major_ID, m.Major_Name, m.Tuition_Fees, m.Acceptance_Grades,
               m.Thanaweya_Track, u.University_ID, u.University_Name,
               u.University_Location, u.University_Type, u.University_Website
        FROM majors m
        JOIN university u ON m.University_ID = u.University_ID
        WHERE LOWER(m.Major_Name) = LOWER(%s) AND LOWER(u.University_Type) = LOWER(%s)
    """, (preferred_major, university_type))
    major_info = cursor.fetchone()
    print(f"Major info fetched: {major_info}")  # Debug log
    if not major_info:
        print(f"No major or university found for: {preferred_major} with type {university_type}")  # Debug log
        raise HTTPException(status_code=404, detail=f"Major or University not found for '{preferred_major}' with type '{university_type}'.")
    return major_info

def check_all_matching_universities(cursor, preferred_major, university_type):
    print(f"Checking all universities for: {preferred_major}, Type: {university_type}")  # Debug log
    cursor.execute("""
        SELECT m.Major_ID, m.Major_Name, m.Tuition_Fees, m.Acceptance_Grades,
               m.Thanaweya_Track, u.University_ID, u.University_Name,
               u.University_Location, u.University_Type, u.University_Website
        FROM majors m
        JOIN university u ON m.University_ID = u.University_ID
        WHERE LOWER(m.Major_Name) = LOWER(%s) AND LOWER(u.University_Type) = LOWER(%s)
    """, (preferred_major, university_type))
    results = cursor.fetchall()
    print(f"All matching universities fetched: {results}")  # Debug log
    if not results:
        raise HTTPException(status_code=404, detail=f"No universities found for '{preferred_major}' with type '{university_type}'.")
    return results

# --------------------- RECOMMENDATION ROUTE --------------------- #
@app.post("/recommend")
def recommend_universities(input: StudentInput):
    try:
        print("Starting recommendation process...")  # Debug log
        db = get_db_connection()
        cursor = db.cursor()

        # Fetch all matching universities for the given major and type
        all_universities = check_all_matching_universities(cursor, input.preferred_major, input.university_type)

        best_university = None
        best_tuition = -1  # Initialize with a value lower than any possible tuition fee

        for university in all_universities:
            (major_id, major_name, tuition, grade_required, track, uni_id, uni_name,
             uni_location, uni_type, uni_website) = university

            print(f"Evaluating university: {uni_name}, Location: {uni_location}")  # Debug log

            # Check if the track matches
            if input.track.lower() not in track.lower():
                print(f"Track mismatch: {input.track} not in {track}")  # Debug log
                continue  # Skip this university if the track does not match

            # Construct input features for ML model
            Is_Location_Match = int(input.preferred_location.lower() == uni_location.lower())
            Is_Budget_Sufficient = int(input.tuition_budget >= float(tuition))
            Grade_Gap = float(input.student_grade - float(grade_required))

            print(f"Is_Location_Match: {Is_Location_Match}, Is_Budget_Sufficient: {Is_Budget_Sufficient}, Grade_Gap: {Grade_Gap}")  # Debug log

            model_input = [[Is_Location_Match, Is_Budget_Sufficient, Grade_Gap]]
            print(f"Model input: {model_input}")  # Debug log

            # Predict using the ML model
            try:
                prediction = model.predict(model_input)[0]
                print(f"Prediction result for {uni_name}: {prediction}")  # Debug log
            except Exception as e:
                print(f"Error during model prediction: {e}")  # Debug log
                raise HTTPException(status_code=500, detail=f"Error during model prediction: {str(e)}")

            # If the model predicts 1, evaluate this university
            if prediction == 1:
                # Check if this university has a higher tuition fee than the current best
                if float(tuition) > best_tuition:
                    best_tuition = float(tuition)
                    best_university = {
                        "name": uni_name,
                        "location": uni_location,
                        "type": uni_type,
                        "website": uni_website,
                        "major": {
                            "name": major_name,
                            "tuition_fees": float(tuition),
                            "required_grade": float(grade_required),
                        }
                    }

        # If a best university is found, return it
        if best_university:
            return {
                "recommended": True,
                "university": best_university
            }

        # If no university matches the preferences
        return {
            "recommended": False,
            "reason": "The selected university or major does not match your Inputs."
        }

    except mysql.connector.Error as err:
        print(f"Database error: {err}")  # Debug log
        raise HTTPException(status_code=500, detail=str(err))
    except Exception as e:
        print(f"Unexpected error: {e}")  # Debug log
        raise HTTPException(status_code=500, detail=str(e))  # Return the actual error message
    finally: # uvicorn main:app --reload
        if db and db.is_connected():
            cursor.close()
            db.close()