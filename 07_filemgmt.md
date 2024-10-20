After the editor battle comes the file management benchmark
-----------------------------------------------------------

When comparing console file managers, there's plenty of options -- dual pane like midnight commander, vifm, single pane like lf, nnn, miller columns like in ranger. Some of them can work in several modes, like ranger in dual pane, vifm in list mode. But once you've made up your mind to choose among thos with vim-like keybindings, the sort narrows down to just a few. In my case, the finalist battle has been between two giant winners: ranger and vifm. Both have some unique features and some lacking tools, but both deserve a tie before starting.

## Where both are equivalent or identical

Navigation follows the typical hjkl vim-like bindings, including yy, pp, dd...

Browsing through sibling directories is similar in both. Use `[` and `]` in ranger. Use `[r` and `]r` in vifm.

Both can use the double pane configuration, which is default in vifm. In ranger you can activate it by typing tilde, and then creating a new tab (`gn`).

Both can use the Miller column view, which is default in ranger. In vifm you can activate it by typing `:set millerview`.

By default you can see filenames and sizes (except with folders, where ranger shows file count). To see extra columns with information like modification time, filetype, etc, you can use shift-M in ranger to set the linemode for all tabs. In vifm you need to type `:set viewcolumns=-{field1},{field2}...`for each pane (example `:set viewcolumns=-{name},{ext},{mtime}`).

Bulk renaming is done by typing a shell command. In ranger it's `:bulkrename`, while in vifm it's `:rename`. You then get the file list in the editor. 
Tagging files is done with `t`, so you can execute commands on the tagged set of files (marked with *).

Renaming a single file is a bit more straighforward in ranger. You can either have the current name with the cursor ready just before the extension (use `a`), at the very end (use `A`) or in an empty field, attempting to write a whole new name (use `cw` for change word, like in vim). Vifm offers the first option by typing `cW` or the second option by typing `cw`.

Changing sort order is also quite different, being a little more straightforward in ranger. You use the `o` (order) command with different suffixes (n for natural, r for reverse, a for atime, c for ctime, m for mtime, t for type, s for size, and any of these will be reversed by using capital). In vifm you type :sor[t] and choose the criteria form the pop-up menu.

## Different approaches for similar features

Space bar in ranger marks successive files to be processed. In vifm space is just like tab, used to focus on the opposite pane.

`a` is used to append text to the filename in ranger. In vifm, `a` means 'all' for several actions.

`v` is used to toggle marked files, which is very useful in some cases. Vifm uses `v` to toggle visual mode (capital V in ranger).

`z` is used for different settings in ranger, while in vifm is used in similar ways to redraw the file list. The results are similar, but they use different bindings. To toggle showing hidden files ranger uses `zh` while vifm uses `za`. `zf` is used to make a permanent filter in vifm. Filtering in ranger is somehow more logical (see next section). In ranger you can use `zd` to list directories first, `zi` to toggle image previews.

## Where ranger wins

Filtering out directories or files is easy. Just type `.f` or `.d`. You can also apply other filters to the stack, like `.l` for symlinks. Filtering by text is like a fast search, which refreshes after the first character is typed, and lets you find any name containing that character. Tab navigates through all the occurrences.

Yanking files from different directories is possible by adding them with the `ya` binding. You can also add files to the delete buffer (`da`). When you're done or want to start over, remember to clear the buffer using `uy` or `ud`.

Symlink management is quite logical and versatile in ranger. You can paste a soft symlink of a yanked file by typing `pl` (absolute) or `pL` (relative). If you type `phl` you get a hard link instead. You can even make a whole subdirectory with hard links to all files by typing `pht`. To paste a relative link in vifm you type `rl`, and `al` for absolute. This syntax doesn't follow the top-down logic in ranger.

The :flat command lets you view the current directory and all the children items in the same list. For instance `:flat 1` shows the first two levels together.

Despite being written in python, and thus being technically slower, ranger behaves in a very fluent manner. Vifm is generally faster, but some processes take longer, like changing to millerview. 

## Where vifm wins

vifm is generally faster than ranger, mainly because it's written in C.

Cut and paste is done differently. Instead of dd and pp, you must use yy and capital P. This has the logic of moving the copied files directly to the destinations, thus avoiding the use of the buffer in the middle. This means dd is not cutting, but trashing in vifm.

File and folder sizes are recalculated using `ga`, or `gA` if you need to force recalculate. Ranger doesn't offer this feature.

Changing names to uppercase (`gUU`) or lowercase (`guu`). This is not available as a ranger funtion, but you can always achieve the same result by bulk renaming in vim.

List view (lsview) can be useful for big amounts of files. This is an exclusive mode of vifm. You activate it with `:set lsview`.

## So which of the two is better overall?

There's a lot of extra functionality in both applications, which can't be covered thoroughly in this article. I must admit there is a technical tie between this giant competitors, and it finally depends on personal preference whether you should use one or another. I'm afraid you will have to decide on your own, depending on your needs and preferences. I bet you'll have guessed which one I'm using.

Using both is of course a possibility, but I would recommend to stay with one for a while. Muscle memory gets a big benefit of using the same tool over and over.
I hope this article has been useful, at least to save you some hours of tinkering and testing. Good luck in your choice!
