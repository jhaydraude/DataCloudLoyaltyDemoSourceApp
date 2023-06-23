export usernum=01
sfdx auth:web:login -a dcwksorg$USERNUM
sfdx force:mdapi:deploy  -d metadataPackage -u dcwksorg$USERNUM -w 10
sfdx force:user:permset:assign -n Loyalty -u dcwksorg$USERNUM
sfdx force:user:permset:assign -n CDPAdmin -u dcwksorg$USERNUM
sf data upsert bulk --sobject Contact --file ./SampleData/DataCloudSampleContacts.csv --external-id id -u dcwksorg$USERNUM
sf data upsert bulk --sobject Loyalty_Profile__c --file ./SampleData/DataCloudSampleLoyalty.csv --external-id id -u dcwksorg$USERNUM


