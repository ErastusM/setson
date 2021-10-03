import  ballerina/http;

public type TopicResObjArr TopicResObj[];

# dsa
#
# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    public isolated function init(http:ClientConfiguration clientConfig =  {}, string serviceUrl = "http://localhost:8080/studentManagment") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # 
    #
    # + payload - Parameter Description
    # + return - successfully added user
    remote isolated function  add(LearnerProfessor payload) returns ResObj|error {
        string  route = string `/user/add`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ResObj response = check self.clientEp->post(route, request, targetType=ResObj);
        return response;
    }
    # 
    #
    # + payload - Parameter Description
    # + return - successfully updated learner
    remote isolated function  update(LearnerProfessor payload) returns ResObj|error {
        string  route = string `/user/update`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ResObj response = check self.clientEp->post(route, request, targetType=ResObj);
        return response;
    }
    #
    # + learner - existing learner profile
    # + return - successfully retrieved material
    remote isolated function  learningMaterialsBylearner(string learner) returns TopicResObjArr|error {
        string  route = string `/learningMaterials/${learner}`;
        TopicResObjArr response = check self.clientEp-> get(route, targetType = TopicResObjArr);
        return response;
    }
}
