#README#
This is the readme. It will describe all of the entities of this project, and assist in the transition of code ownership, specifically noting where code needs change for production.

##General Notes##
*permissions*: Only users who should be allowed to make modifications are allowed to do so. For example, a non-collaborator for a project cannot access or upload/delete files, add/delete comments, or edit any project-related information - some of the buttons won't even show up, and for those that do, nothing happens when clicked and "permission denied" is flashed.

*login*:

##DATABASE ENTITIES##
###Documents and Profile Pictures:###
These are the file storage entities for projects/users. Files are stored in the cloud on Amazon's S3 using the paperclip and aws-sdk gems. At the time of the writing of this readme, my own personal aws account is tied to this project; at the handover point, I will disable my access keys. Change them to allow the filesystem to store files correctly. **AWS account keys are stored in *config/s3.yaml***. If AWS S3 is undesirable, remove the arguments to the "has attached file" association in the model, and files will be stored locally instead. Furthermore, **the unique s3 bucket must be specified** in the 'document' and 'profile\_picture' models files, specifically in the has\_attached\_file\_ association.

###Comments:###

###Events:###

###Projects:###

###Schools:###
Currently, Berkeley is the only supported school. It is created in the seed file (*/db/seeds.rb*). The school page shows all events for that school, as well as all projects created by users of that school.

###Users:###
Each user, when instantiated, has its school set to Berkeley by default; see */app/models/user.rb:19*. 


