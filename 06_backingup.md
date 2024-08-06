# Backing it all up 

Everyone knows the 3-2-1 rule for backups, but very few people follow it thoroughly - you need at least 3 copies, they should be at least in two different media, and at least one should be in a different physical location.

In my particular setup, copies are made on demand, usually every time I make changes. For work there's a total of three copies: the working copy, the copy on the home NAS, and the GitHub repository. For the system core I keep Timeshift copies, but I don't bother to copy the system on the cloud. My dotfiles should make the job. 

Using git for the remote backup is a good idea for text and code. You get versioning, plus all the goodies involved - commit history, branching, issues, etc.