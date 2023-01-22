Feature Toggles
-------------------------------------------

With feature based development and continuous delivery or continuous deployment it is often necessary to be able to deploy new features to a select group of testers or customers.

Within Salesforce there are many ways to create feature toggles; typically, but not always, they will be implimented by one of the mechanisms below 

## Custom Settings
- A custom setting is a single object with fields
- Each field becomes a toggle
- Each field can have a default value
- Custom settings can be stored for the entire org or per profile
- If a custom setting does not exist or has not been configured the field defaults are used
- Deploying a custom setting is as easy as deploying a new sObject
- You cannot deploy custom setting values
- Custom setting values can be copied from org to org using the data loader

Using custom settings
- Supports nearly all Salesforce data types (not picklists)
- Easy to add new fields, i.e. toggles
- Very easy to consume, just instantiate the object and reference the field
- As an actual field is referenced it is hard to make any spelling mistakes or errors in the code
- Easy to mock in a unit test
- Not clear whether the fields, i.e. toggles can be easily removed once deployed

## Custom Metadata Types
- Custom metadata types are similar to an sObject, fields are declared on the type
- Custom metadata types contain many records
- Each custom metadata type record contains all of the fields declared on the type
- Unlike custom settings, custom metadata type records CAN be deployed to orgs
- If packaging a custom metadata type you can control who can make any changes after deployment or protect the records
- Custom metadata types have page layouts and can be embedded in Salesforce pages

Using custom metadata types
- Supports nearly all Salesforce data types including picklist and relationships to other custom metadata types
- Easy to add new fields
- Easy to add new records
- Easy to deploy records
- Extracting the data involves writing SOQL
- Custom metadata SOQL does not count towards the Salesforce execution governor limits
- Records whose values have been overridden may be reverted to the default values when re-deployed 
- Not very easy to mock or use in a unit test
- Not clear whether the records can be removed in a changeset

Custom Permission and Permission Sets
- Custom permission is a single value that can be added in Salesforce
- The custom permission is added to a permission set
- A permission set is assigned to a user or profile

Using custom permissions
- add the permission to a permission set
- apply the permission set to a user, profile or group of users or profiles

Salesforce has facilities built in to interrogate whether a user has an appropriate permission using the FeatureManager class. 
ISV's have other options for long lived settings or features via the Licence Management Organization.

## Example: custom metadata type toggles

