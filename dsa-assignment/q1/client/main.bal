import ballerina/io;

Client ep = check new;

public function main() {
    LearnerProfessor learner = {
        
        username: "set",
        firstName: "setson",
        lastName: "neumbo",
        preferred_formats: ["text", "audio", "video"],
        past_subjects: [
            {
            score: "A",
            course: "DSA"
        }
        ]
    };

    ResObj|error res = ep->add(learner);
    if res is error {
        io:println("Error encountered when adding user: ", res.message());
    } else {
        io:println("User successfully added: ", res.message);
    }

    learner.firstName = "setson";
    res = ep->update(learner);
    if res is error {
        io:println("Error encountered when updating user: ", res.message());
    } else {
        io:println("User was successfully updated: ", res.message);
    }

    TopicResObj[]|error materials = ep->learningMaterialsBylearner("set");
    if materials is error {
        io:println("Error encountered when retrieving materials: ", materials.message());
    } else {
        io:println("Material successfully retrieved: ", materials);
    }

}
