public type LearningObj record {
    MaterialObj[] audio;
    MaterialObj[] video;
    MaterialObj[] text;
};

public type MaterialObj record {
    string name;
    string description;
    string difficulty;
};

public type TopicResObj record {
    string name;
    string description;
    string difficulty;
};

public type ReqObj record {
    string message;
};

public type ResObj record {
    string message;
};

public type LearnerProfessor record {
    string username;
    string firstName;
    string lastName;
    string[] preferred_formats;
    record  { string course; string score;} [] past_subjects;
};

public type LearningMat record {
    string course;
    LearningObj learning_objects;
};
