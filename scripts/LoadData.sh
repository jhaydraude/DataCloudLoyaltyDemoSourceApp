sfdx auth:web:login -a dcwksorg
sfdx force:mdapi:deploy  -d metadataPackage -u dcwksorg -w 10
sfdx force:user:permset:assign -n Loyalty -u dcwksorg
sfdx force:user:permset:assign -n CDPAdmin -u dcwksorg
sf data upsert bulk --sobject Contact --file ./SampleData/DataCloudSampleContacts.csv --external-id id -u dcwksorg
sf data upsert bulk --sobject Loyalty_Profile__c --file ./SampleData/DataCloudSampleLoyalty.csv --external-id id -u dcwksorg
