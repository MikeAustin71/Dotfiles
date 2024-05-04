

# Mike's Fedora Server Dot Files



## Disclaimer

These bash scripts are still in development, use them at your own risk.



## Running Bash Scripts



When running individual bash scripts from the command line use the ***source*** command and not the dot operator (***.***) .  With the exception of bash scripts located in directory ***stdAppInstall***, these bash scripts were designed to be called by functions. As as a result, these scripts use the ***return*** command to terminate execution. Consequently, you must call or execute these scripts with the ***source*** command.

