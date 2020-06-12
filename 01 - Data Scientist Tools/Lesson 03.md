
# Version Control

Version control is a system that records changes that are made to a file or a set of files over time. The most used version contro system is [Git](https://git-scm.com/).

<img src="http://phdcomics.com/comics/archive/phd101212s.gif" height="428" width="321">

This comic from [PHD Comics](http://phdcomics.com/comics/archive.php?comicid=1531) is what we want to avoid using version control.

Also, the version control software keeps track of who, when, and why changes were made, which is very helpful when working in a team.

## Why Git?

From the course notes:
> Git keeps a local copy of your work and revisions, which you can then edit offline, and then once you return to internet service, you can sync your copy of the work, with all of your new edits and tracked changes to the main repository online. Additionally, since all collaborators on a project have their own local copy of the code, everybody can simultaneously work on their own parts of the code, without disturbing that common repository.

The most used Git host used is this very platform, GitHub!

## Version control vocabulary

As the course notes are very good in this part, I'll use them here:
**Repository:**  Equivalent to the project’s folder/directory - all of your version controlled files (and the recorded changes) are located in a repository. This is often shortened to  **repo**. Repositories are what are hosted on GitHub and through this interface you can either keep your repositories private and share them with select collaborators, or you can make them public - anybody can see your files and their history.

**Commit:**  To commit is to save your edits and the changes made. A commit is like a snapshot of your files: Git compares the previous version of all of your files in the repo to the current version and identifies those that have changed since then. Those that have not changed, it maintains that previously stored file, untouched. Those that have changed, it compares the files, logs the changes and uploads the new version of your file. We’ll touch on this in the next section, but when you commit a file, typically you accompany that file change with a little note about what you changed and why.

When we talk about version control systems, commits are at the heart of them. If you find a mistake, you revert your files to a previous  _commit._  If you want to see what has changed in a file over time, you compare the  _commits_  and look at the messages to see why and who.

**Push:**  Updating the repository with your edits. Since Git involves making changes locally, you need to be able to share your changes with the common, online repository. Pushing is sending those committed changes to that repository, so now everybody has access to your edits.

**Pull:**  Updating your local version of the repository to the current version, since others may have edited in the meanwhile. Because the shared repository is hosted online and any of your collaborators (or even yourself on a different computer!) could have made changes to the files and then pushed them to the shared repository, you are behind the times! The files you have locally on  _your_  computer may be outdated, so you pull to check if you are up to date with the main repository.

> Written with [StackEdit](https://stackedit.io/).
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTM1NTQ1OTQ0XX0=
-->