% main.m
% Initialize the student database
db = StudentDatabase();

% Add sample students
db = db.addStudent(Student(1, 'Alice', 20, 3.5, 'Computer Science'));
db = db.addStudent(Student(2, 'Bob', 21, 3.8, 'Mathematics'));
db = db.addStudent(Student(3, 'Charlie', 22, 2.9, 'Computer Science'));

% Save and load the database
db.saveToFile('StudentDatabase.m');
db = db.loadFromFile('StudentDatabase.m');

% Find a student by ID
student = db.findStudentByID(2);
if ~isempty(student)
    student.displayInfo();
end

% Display students by major
csStudents = db.getStudentsByMajor('Computer Science');
disp('Computer Science Students:');
for i = 1:length(csStudents)
    csStudents(i).displayInfo();
end

% Data visualization
gpas = [db.Students.GPA];
majors = unique({db.Students.Major});

% GPA Distribution
figure;
histogram(gpas);
title('GPA Distribution');
xlabel('GPA'); ylabel('Number of Students');

% Average GPA by Major
avgGPA = arrayfun(@(m) mean([db.getStudentsByMajor(m{1}).GPA]), majors);
figure;
bar(categorical(majors), avgGPA);
title('Average GPA by Major');
xlabel('Major'); ylabel('Average GPA');

% Additional Visualization: Age distribution
ages = [db.Students.Age];
figure;
histogram(ages, 'FaceColor', [0.5 0.7 0.9]);
title('Age Distribution');
xlabel('Age'); ylabel('Number of Students');
