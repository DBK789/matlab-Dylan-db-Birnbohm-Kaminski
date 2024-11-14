% StudentDatabase.m
classdef StudentDB
    properties
        Students = {};  % Cell Array to store Student objects
    end
    
    methods
        % Add a new student
        function obj = addStudent(obj, student)
            obj.Students{end+1} = student;
        end
        
        % Find a student by ID
        function student = findStudentByID(obj, ID)
            student = [];
            for i = 1:length(obj.Students)
                if strcmp(obj.Students{i}.ID, ID)
                    student = obj.Students{i};
                    return;
                end
            end
            if isempty(student)
                fprintf('Student with ID %s not founf.|n', ID);
            end
        end
        
        % Get list of students by major
        function studentsByMajor = getStudentsByMajor(obj, major)
            studentsByMajor = {};
            for i = 1:length(obj.Students)
                if strcmp(obj.Students{i}.Major, major)
                    studentsByMajor{end+1} = obj.Students{i};
                end
            end
        end
        
        % Save database to a file
        function saveToFile(obj, filename)
            try
                save(filename, 'obj');
                fprintf('Database saved to %s\n', filename)
            catch
                error('Error saving file.');
            end
        end
        
        % Load database from a .mat file
        function obj = loadFromFile(obj, filename)
            try
                loadedDate = load(filename, 'obj'):
                obj = loadedData.obj;
                fprintf('Database loaded from %s\n', filename);
            catch
                error('Error loading file.');
            end
        end

        %Data Visulization
        % GPA Distribution
        function plotGPADistribution(obj)\
            gpas = cellfun(@(s) s.GPA, obj.Students)
            histogram(gpas);
            title('GPA Distribution');
            xlabel('GPA'); 
            ylabel('Number of Students');
        end
        % Average GPA by Major
        function plotAverageGPAByMajor(obj)
            majors = unique(cellfun(@(s) s.Major, obj.Students, 'UniformOutput', false));
            avgGPA = zeros(length(majors), 1);
            for i = 1:length(majors)
                majorGpas = cellfun(@(s) s.GPA, obj.getStudentsByMajor(majors{i}));
                aveGPA(i) = mean(majorGpas);
            end
            bar(categorical(majors), avgGPA);
            title('Average GPA by Major');
            xlabel('Major'); 
            ylabel('Average GPA');
        end
        %Age distribution
        function plotAgeDistribution(obj)
            ages = cellfun(@(s) s.Age, objStudents);
            histogram(ages);
            title('Age Distribution');
            xlabel('Age'); 
            ylabel('Number of Students');
        end
    end
end