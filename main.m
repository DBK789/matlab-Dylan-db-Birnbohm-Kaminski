%Author: Dylan Birnbohm-Kaminski
%Email: birnbo63@students.rowan.edu
%Course: MATLAB Programming- Fall 2024
%Assignment: Midterm
%Task: Student Database Management
%Date: November 13th, 2024

% main.m
% Initialize the student database
db = StudentDB();

% Add sample students
db = db.addStudent(Student('001', 'Alice', 20, 3.5, 'Engineering'));
db = db.addStudent(Student('002', 'Bob', 21, 3.8, 'Mathematics'));
db = db.addStudent(Student('003', 'Charlie', 22, 2.9, 'Computer Science'));
db = db.addStudent(Student('004', 'Dylan', 23, 3.6, 'Engineering'));

%Display the students information
student = db.findStudentByID('001');
if ~isempty(student)
    student.displayInfo();
end

% Display students by major
studentsByMajor = db.getStudentsByMajor('Engineering');
fprintf('Students in Engineering: \n')
for i = 1:length(studentsByMajor)
    studentsByMajor{i}.displayInfo();
end

% Save and load the database to a file
db.saveToFile('StudentDatabase.mat');
db = db.loadFromFile('StudentDatabase.mat');