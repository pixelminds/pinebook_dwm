# Making it reusable

This article could be perceived as a tribute to bare-bones Linux. Everyone like me who tried Linux in the last years has had in some moment a mixed feeling of true freedom, efficiency, and challenge. This feeling makes it a highly enjoyable experience. Moreover, when you find yourself stripping things down to the core, and then build up a custom setup, you even feel closer to the true essence of open source: each specific task has a specific tool. Any bloat or unnecessary feature is left out.

But let's be honest - using open source software, and particularly Linux, comes with lots of fun and possibilities, but you also get used to stability issues, and even the risk of a broken system once in a while. When you reach the sweet spot of your desired configuration, and start enjoying your productive setup, your start thinking about the next system crash.

In this context, one big concern is to make a particular setup reproducible. For this purpose, Linux experts usually keep  collections of config files, also known as dotfiles (since they usually have a name starting with a dot, and hence hidden by default). Replicating your current setup, therefore, is done by installing the core system, then the rest of applications, and finally recovering the dotfiles with all the tweaks and ricing.

This repository includes all this stories, plus all my dotfiles, so in case a crash happens, I'll be able to replicate the exact same configuration. Feel free to use it as is, or make your own tweaks.
