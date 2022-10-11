pragma solidity ^0.4.20;

contract credentialRegistry {

    struct Credential
    {
        string id;
        address officialIssuer;
        string credentialHash;
        string r;
        string e;
        string n1;
    }

    mapping(string => Credential) private credential;

    function issueCredential(
        string _id,
        address _officialIssuer,
        string _credentialHash,
        string _r,
        string _e,
        string _N1
    ) public {
        credential[_id].id = _id;
        credential[_id].officialIssuer = _officialIssuer;
        credential[_id].credentialHash = _credentialHash;
        credential[_id].r = _r;
        credential[_id].e = _e;
        credential[_id].n1 = _N1;
    }

    // use string for credential hash value is for scalability, and also to avoid an error that "cannot return string, string, string, bytes32, string ...".
    function getCredential(string _id)
        public
        view
        returns (
            string __id,
            address __officialIssuer,
            string __credentialHash,
            string __r,
            string __e,
            string __n1
        )
    {
        return (
            credential[_id].id,
            credential[_id].officialIssuer,
            credential[_id].credentialHash,
            credential[_id].r,
            credential[_id].e,
            credential[_id].n1
        );
    }
}
