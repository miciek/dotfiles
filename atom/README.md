# Backing up and recovering Atom packages >/dev/null 2>&1

[`atom-backup.sh`](atom-backup.sh) displays list of installed Atom packages. It should be run by `crontab` to save the packages in [`package-list-backup`](package-list-backup) file.

```
*/30 * * * * /Users/miciek/workspace/dotfiles/atom/atom-backup.sh > /Users/miciek/workspace/dotfiles/atom/package-list-backup
```

To recover all the packages stored in `package-list-backup` file, run [`atom-recover.sh`](atom-recover.sh).
