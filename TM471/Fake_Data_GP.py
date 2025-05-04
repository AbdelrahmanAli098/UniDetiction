import mysql.connector
import pandas as pd
import random
import numpy as np

# Connect to your database
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Boda189**",
    database="uni_rec"
)
cursor = conn.cursor(dictionary=True)

# Define eligible tracks for each faculty
track_eligibility = {
    "Faculty of Medicine": ["Science"],
    "Faculty of Pharmacy": ["Science"],
    "Faculty of Dentistry": ["Science"],
    "Faculty of Engineering": ["Math"],
    "Faculty of Computer Sciences": ["Math"],
    "Faculty of Media": ["Literary", "Math", "Science"],
    "Faculty of Business": ["Literary", "Math", "Science"],
    "Faculty of Al-Alsun": ["Literary"],
    "Faculty of Law": ["Literary", "Math", "Science"],
    "Faculty of Applied Sciences and Arts": ["Science"],
    "Faculty of Nursing": ["Science"],
    "Faculty of Science": ["Science"],
    "Faculty of Education": ["Literary", "Math", "Science"],
    "Faculty of Agriculture": ["Science", "Math"],
    "Faculty of Arts": ["Literary"],
    "Faculty of Biotechnology": ["Science"],
    "Faculty of Veterinary Medicine": ["Science"],
    "Faculty of Physical Therapy": ["Science"],
    "Faculty of Arts and Design": ["Literary"],
    "Faculty of Languages": ["Literary"],
    "Faculty of Informatics": ["Math"],
    "Faculty of Energy Engineering": ["Math"],
    "Faculty of languages": ["Literary"],
    "Faculty of Graphic Design and Multimedia": ["Science", "Math"],
}

# Map University_ID to University_Name
university_map = {
    1: "Ain Shams University",
    2: "Alexandria University",
    3: "Assiut University",
    4: "Aswan University",
    5: "Banha University",
    6: "Beni-Suef University",
    7: "Cairo University",
    8: "Damanhour University",
    9: "Damietta University",
    10: "Egypt-Japan University of Science and Technology",
    11: "Fayoum University",
    12: "Helwan University",
    13: "Kafrelsheikh University",
    14: "Luxor University",
    15: "Mansoura University",
    16: "Military Technical College",
    17: "Minia University",
    18: "Minufiya University",
    19: "New Valley University",
    20: "Port Said University",
    21: "Sadat Academy for Management Sciences",
    22: "Sohag University",
    23: "South Valley University",
    24: "Suez Canal University",
    25: "Suez University",
    26: "Tanta University",
    27: "University of Sadat City",
    28: "Zagazig University",
    29: "Zewail City of Science, Technology and Innovation",
    30: "King Salman International University",
    31: "Galala University",
    32: "Alamein International University",
    33: "New Mansoura University",
    34: "Nile University",
    35: "Heliopolis University",
    36: "German International University",
    37: "German University in Cairo",
    38: "Ahram Canadian University",
    39: "Arab Academy for Science, Technology and Maritime Transport",
    40: "Arab Open University",
    41: "British University in Egypt",
    42: "Canadian International College",
    43: "Delta University for Science and Technology",
    44: "Egyptian Chinese University",
    45: "Egyptian e-Learning University",
    46: "Egyptian Russian University",
    47: "Future University in Egypt",
    48: "Misr International University",
    49: "Misr University for Science and Technology",
    50: "October 6 University",
    51: "Pharos University in Alexandria",
    52: "Sinai University",
    53: "French University of Egypt",
    54: "University of Canada in Egypt",
    55: "University of Hertfordshire hosted by Global Academic Foundation",
    56: "University of Modern Sciences and Arts",
    57: "Badr University in Cairo",
    58: "Nahda University in Beni Suef",
    59: "Badr University in Assiut",
    60: "New Giza University",
    61: "El Shorouk Academy",
    62: "The American University in Cairo",
}

# Acceptance grades for each major at each university
acceptance_grades = [
    385.00,335.00,376.50,357.50,381.00,333.50,373.50,301.00,348.00,293.50,275.00,283.50,300.50,280.50,350.00,382.00,330.00,374.00,355.00,378.00,330.00,370.00,298.00,345.00,290.00,270.00,298.00,278.00,348.00,379.00,328.00,372.00,353.00,375.00,368.00,296.00,268.00,296.00,276.00,345.00,377.00,326.00,370.00,350.00,365.00,294.00,266.00,294.00,274.00,343.00,376.00,325.00,368.00,348.00,363.00,292.00,264.00,292.00,272.00,340.00,380.00,332.00,375.00,355.00,378.00,370.00,299.00,272.00,297.00,277.00,347.00,386.00,338.00,378.00,360.00,382.00,335.00,375.00,303.00,350.00,295.00,278.00,302.00,282.00,352.00,378.00,330.00,374.00,352.00,376.00,369.00,297.00,270.00,295.00,275.00,344.00,328.00,350.00,295.00,268.00,293.00,273.00,290.00,342.00,370.00,355.00,300.00,335.00,377.00,328.00,372.00,352.00,375.00,368.00,296.00,268.00,296.00,276.00,345.00,376.00,330.00,371.00,350.00,374.00,366.00,295.00,267.00,294.00,275.00,344.00,378.00,332.00,373.00,353.00,376.00,369.00,297.00,269.00,295.00,277.00,346.00,328.00,348.00,293.00,265.00,292.00,272.00,330.00,382.00,333.00,374.00,355.00,378.00,371.00,298.00,270.00,296.00,278.00,348.00,380.00,360.00,350.00,378.00,327.00,371.00,352.00,374.00,366.00,295.00,267.00,295.00,275.00,344.00,376.00,325.00,369.00,350.00,372.00,364.00,293.00,265.00,293.00,273.00,342.00,322.00,347.00,290.00,263.00,290.00,270.00,375.00,324.00,368.00,349.00,371.00,362.00,292.00,264.00,292.00,272.00,341.00,290.00,262.00,346.00,374.00,323.00,366.00,348.00,370.00,360.00,291.00,261.00,291.00,271.00,340.00,373.00,322.00,365.00,347.00,369.00,358.00,290.00,260.00,290.00,270.00,339.00,372.00,321.00,364.00,346.00,368.00,357.00,289.00,259.00,289.00,269.00,338.00,371.00,320.00,363.00,345.00,367.00,356.00,288.00,258.00,288.00,268.00,337.00,378.00,330.00,373.00,354.00,376.00,369.00,297.00,269.00,297.00,277.00,346.00,365.00,320.00,295.00,270.00,288.00,280.00,345.00,379.00,332.00,374.00,355.00,377.00,370.00,298.00,270.00,298.00,278.00,347.00,287.00,287.00,266.50,225.50,303.40,299.30,295.20,278.80,266.50,266.50,246.00,255.00,225.50,315.70,311.60,303.40,291.10,225.50,225.50,225.50,225.50,270.60,250.10,225.50,303.40,311.60,291.10,225.50,270.60,250.10,225.50,225.50,348.50,336.40,299.30,319.80,287.00,266.50,266.50,225.50,225.50,287.00,225.50,266.50,225.50,328.00,328.00,254.20,303.40,225.50,328.00,233.70,254.20,225.50,263.20,233.70,303.40,278.80,303.40,328.00,233.70,254.20,233.70,225.50,225.50,328.00,303.40,303.40,328.00,225.50,225.50,217.30,237.00,287.00,328.00,361.00,361.00,287.00,266.50,266.50,266.50,246.00,246.00,348.50,217.30,233.70,217.30,217.30,217.30,217.30,217.30,278.80,225.50,254.20,225.50,328.00,303.40,225.50,328.00,328.00,303.40,278.80,254.20,233.70,278.80,217.30,328.00,295.20,294.40,271.40,278.80,276.10,278.80,253.10,268.30,271.40,225.50,311.60,278.80,295.20,225.50,246.40,217.30,328.00,278.80,303.40,225.50,254.20,233.70,225.50,317.70,290.10,278.80,246.00,217.30,328.00,303.40,278.80,254.20,233.70,217.30,233.70,348.50,328.00,328.00,328.00,246.10,266.50
,287.20
,226.50
,266.50
,238.60
,287.20
,266.50
,246.10
,336.60
,328.00
,303.40
,319.70
,217.60
,226.50
,278.80
,226.50
,246.10
,226.50
,226.50
,217.60
,226.50
,226.50
,328.00
,303.40
,317.60
,319.70
,217.30
,278.80
,246.10
,226.50
,217.30
,217.60
,226.50
,217.60
,226.50
,319.80
,299.30
,278.80
,246.00
,246.00
,217.30
,217.30
,227.50
,238.00
,217.30
,319.70
,295.40
,312.60
,246.00
,217.30
,278.80
,217.30
,217.30
,217.30
,251.10
,262.40
,246.00
,246.00
,217.30
,217.30
,246.00
,226.00
,246.00
,369.00
,369.00
,287.00
,328.00
,287.00
,287.00
,246.00
,246.00
,246.00
,328.00
,319.80
,303.40
,295.20
,287.00
,225.50
,225.50
,278.80
,225.50
,225.50
,225.50
,225.50
,225.50
,225.50
,348.50
,336.40
,299.30
,319.80
,287.00
,266.50
,237.80
,237.80
,328.00
,319.80
,295.20
,348.50
,311.60
,278.80
,278.80
,254.20
,225.50
,225.50
,225.50
,225.50
,225.50
,225.50
,328.00
,319.80
,295.20
,278.80
,217.30
,217.30
,246.00
,217.30
,322.00
,337.50
,306.50
,210.00
,210.00
,210.00
,348.00
,336.00
,328.00
,328.00
,287.00
,258.00,287.00,258.00,246.00,246.00,226.00,226.00,226.00,226.00,226.00,226.00,226.00,226.00
]

# Get all majors + corresponding university info
cursor.execute("""
    SELECT 
        m.Major_Name, m.Tuition_Fees, m.Thanaweya_Track, 
        u.University_Name, u.University_Location, u.University_Type
    FROM majors m
    JOIN university u ON m.University_ID = u.University_ID
""")
offerings = cursor.fetchall()

# Generate fake student data
data = []
student_id = 1
for major in offerings:
    major_name = major['Major_Name']
    tuition_fee = float(major['Tuition_Fees'])
    allowed_tracks = track_eligibility.get(major_name, [])
    university_location = major['University_Location']

    if not allowed_tracks:
        continue

    for _ in range(15):  # Simulate 10 students per major
        track = random.choice(allowed_tracks)
        preferred_type = major['University_Type']
        all_locations = list(set([m['University_Location'] for m in offerings]))

        preferred_loc = random.choices(
            [university_location] + [loc for loc in all_locations if loc != university_location],
            weights=[0.7] + [0.3 / (len(all_locations) - 1)] * (len(all_locations) - 1)
        )[0]

        acceptance_grade = round(random.uniform(280, 390), 2)
        student_grade = round(random.uniform(250, 410), 2)
        budget = random.randint(800, int(tuition_fee + 50000))

        # Derived features
        grade_gap = student_grade - acceptance_grade
        is_budget_sufficient = int(budget >= tuition_fee)
        is_location_match = int(preferred_loc == university_location)

        # Define Match with clean logic
        match = int(
            student_grade >= acceptance_grade and
            budget >= tuition_fee and
            preferred_loc == university_location
        )

        data.append({
            'Student_ID': student_id,
            'Track': track,
            'Preferred_Location': preferred_loc,
            'Preferred_Type': preferred_type,
            'Major_Name': major_name,
            'Tuition_Budget': budget,
            'Student_Grade': student_grade,
            'University_Name': major['University_Name'],
            'University_Location': university_location,
            'Tuition_Fees': tuition_fee,
            'Acceptance_Grade': acceptance_grade,
            'Grade_Gap': grade_gap,
            'Is_Budget_Sufficient': is_budget_sufficient,
            'Is_Location_Match': is_location_match,
            'Match': match
        })
        student_id += 1

# Save to CSV
df = pd.DataFrame(data)

# Balance the classes if needed (optional)
match_1 = df[df['Match'] == 1]
match_0 = df[df['Match'] == 0]

if len(match_1) > 0 and len(match_0) > 0:
    if len(match_1) > len(match_0):
        match_0 = match_0.sample(len(match_1), replace=True)
    else:
        match_1 = match_1.sample(len(match_0), replace=True)
    df = pd.concat([match_1, match_0]).sample(frac=1).reset_index(drop=True)

df.to_csv("Test1.csv", index=False)
print("✅ Test.csv generated successfully with improved logic.")
