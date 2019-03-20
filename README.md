# winradsync
Windows NPS Server sync powershell script

## The setup

You need to ;
- Create a folder in c:\ named scripts which it's way must be c:\scripts at every nps server
- Create a folder named config in c:\scripts at every nps server
- Put this script at the master of your nps servers 
- Add all your servers to a group named nps_servers if there is no such group create your own and edit script accordingly
- Create a scheduled task that invokes this script

Yes that's a single way replication from master to slaves.

Please use it with caution it may overwrite config on slaves that is not in masters database.
