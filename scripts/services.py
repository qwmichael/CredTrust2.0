from brownie import credentialRegistry, accounts
import uuid

contractDeployAccount = accounts[0]
hospital = accounts[1]
doctor = accounts[2]
patient = accounts[3]
verifier = accounts[4]

credContract = credentialRegistry.deploy({'from': contractDeployAccount})

def issueCredential(issuingAccount, officialIssuer, credentialHash, r, e, n1):
    id = str(uuid.uuid1())
    credContract.issueCredential(id, officialIssuer, credentialHash, r, e, n1, {'from': issuingAccount})
    return id

def getCredential(id, acc):
    return credContract.getCredential(id, {'from': acc})

def main():
    id = issueCredential(hospital, hospital, "somehash", "somer", "some e", "somen1")
    print("id is ===")
    print(id)

    ret = getCredential(id, verifier)
    print("stuff gotten from registry is ===")
    print(ret)