class Patient:
    def __init__(self, name, age, doctor, appointment_date):
        self.name = name
        self.age = age
        self.doctor = doctor
        self.appointment_date = appointment_date
    
    def display_info(self):
        print(f"Name: {self.name}, Age: {self.age}, Doctor: {self.doctor}, Appointment: {self.appointment_date}")
    
    def to_dict(self):
        return {
            "name": self.name,
            "age": self.age,
            "doctor": self.doctor,
            "appointment_date": self.appointment_date
        }
    
import json


class ClinicManager:
    def __init__(self):
        self.patients = []
        self.file_path = "patients.json"
        self.load_from_file()
        
    def add_patient(self, name, age, doctor, appointment_date):
        self.patients.append(Patient(name, age, doctor, appointment_date))
        self.save_to_file()
        print(f"Patient {name} added successfully.")
        
    def print_all_patients(self):
        if not self.patients:
            print("No patients found.")
        else:
            for patient in self.patients:
                patient.display_info()
    
    def update_appointment_by_name(self, name, new_date):
        for patient in self.patients:
            if patient.name == name:
                patient.appointment_date = new_date
                self.save_to_file()
                print(f"Appointment updated for {name} to {new_date}.")
                return
        print("Patient not found!")
    
    def delete_by_age(self, age):
        self.patients = [patient for patient in self.patients if patient.age != age]
        self.save_to_file()
        print(f"Patients aged {age} have been removed.")
        
    def save_to_file(self):
        with open(self.file_path, "w") as file:
            json.dump([patient.to_dict() for patient in self.patients], file)
    
    def load_from_file(self):
        try:
            with open(self.file_path, "r") as file:
                data = json.load(file)
                self.patients = [Patient(d["name"], d["age"], d["doctor"], d["appointment_date"]) for d in data]
        except (FileNotFoundError, json.JSONDecodeError):
            self.patients = []

class FrontendManager:
    def __init__(self):
        self.manager = ClinicManager()
        
    def display_menu(self):
        while True:
            print("\n\t\tClinic Management System\t\t")
            print("1) Add New Patient")
            print("2) Print All Patients")
            print("3) Delete Patient by Age")
            print("4) Update Appointment by Name")
            print("5) Exit")
            
            choice = input("Enter your choice: ")
            
            if choice == "1":
                name = input("Enter Name: ")
                age = int(input("Enter Age: "))
                doctor = input("Enter Assigned Doctor: ")
                appointment_date = input("Enter Appointment Date (YYYY-MM-DD): ")
                self.manager.add_patient(name, age, doctor, appointment_date)
            
            elif choice == "2":
                self.manager.print_all_patients()
            
            elif choice == "3":
                age = int(input("Enter Age to Delete Patients: "))
                self.manager.delete_by_age(age)
            
            elif choice == "4":
                name = input("Enter Name: ")
                new_date = input("Enter New Appointment Date (YYYY-MM-DD): ")
                self.manager.update_appointment_by_name(name, new_date)
            
            elif choice == "5":
                print("Exiting program...")
                break
            else:
                print("Invalid choice, please try again.")

if __name__ == "__main__":
    frontend = FrontendManager()
    frontend.display_menu()
