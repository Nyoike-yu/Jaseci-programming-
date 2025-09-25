# fitness_tracker_ai.jac

::py::
import uuid
from datetime import datetime

workouts = []

def get_uuid():
    return str(uuid.uuid4())

def get_timestamp():
    return datetime.utcnow().isoformat()

def log_workout(exercise, duration, intensity):
    workout = {
        "id": get_uuid(),
        "exercise": exercise,
        "duration": duration,   # in minutes
        "intensity": intensity, # low / medium / high
        "logged_at": get_timestamp(),
    }
    workouts.append(workout)
    return workout

def list_workouts():
    return workouts
::py::

import from byllm.llm { Model }

# global LLM instance
glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=False);

# AI helper functions
def analyze_workouts(workout_list: list) -> str by llm();
def suggest_plan(workout_list: list) -> str by llm();

with entry {
    print("Fitness Tracker (AI Edition) online!");

    let w1 = log_workout("Push-ups", 15, "high");
    let w2 = log_workout("Jogging", 30, "medium");

    print("Your workouts:");
    for w in list_workouts() {
        print("[" + w["id"] + "] " + w["exercise"] + " - " + str(w["duration"]) + " mins (" + w["intensity"] + ")");
    }

    # AI analysis
    let analysis = analyze_workouts(list_workouts());
    print("AI Analysis: " + analysis);

    let plan = suggest_plan(list_workouts());
    print("AI Suggested Plan: " + plan);
}
