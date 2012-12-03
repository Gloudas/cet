
This is the readme. It will describe all of the entities of this project, and assist in the transition of code ownership.

-----
#DATABASE ENTITIES#

##Comments:##

##Documents:##
This is the file storage entity for projects. Files are stored in the cloud on Amazon's S3 using the paperclip gem. At the time of the writing of this readme, my own personal aws account is tied to this project; at the handover point, I will disable my access keys. Change them to allow the filesystem to store files correctly. **AWS account keys are stored in config/s3.yaml**. If AWS S3 is undesirable, remove the arguments to the "has attached file" association in the model, and files will be stored locally instead.

##Events:##


##Projects:##


##Schools:##


##Users:##


-----
**General Notes**

*permissions*: Only users who should be allowed to make modifications are allowed to do so. For example, a non-collaborator for a project cannot access or upload/delete files, add/delete comments, or edit any project-related information - some of the buttons won't even show up, and for those that do, nothing happens when clicked and "permission denied" is flashed.
