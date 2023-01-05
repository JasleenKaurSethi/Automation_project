# Automation_project
This Project hosts a web server and then automates certain maintenance tasks.

## Prerequisites for running the bash file
1) Install awscli
2) Configure aws with Access Key ID and Secret access key

## Contents Covered:
1) It first checks if apache server is installed, in case not, installs it and ensures apache2 server is active and enabled.
2) Tar file of apache2 access logs and error logs according to timestamp is then added to /tmp directory and added to s3 bucket.
3) inventory.html is created to serve as a web page to get the metadata of the archived logs.
4) The final script is then automated and scheduled to run everyday using cronjob.
