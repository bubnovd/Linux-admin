[EN - sudo you are doing it wrong](http://repository.root-me.org/Administration/Unix/EN%20-%20sudo%20you%20are%20doing%20it%20wrong.pdf)

- Don't use sudo to edit files – use file permissions and groups
- `id` - членство в группах
- `sudo -l` - show your permissions
- `sudoreplay`
- `sudo -K` - invalidate cache

### Sudo policy format
User Host=(RunAs) Command

- Rules processed in order
- Last matching rule wins
- Sudoers must end in a blank line

### Dangers of wildcars in sudoers
`Pete ALL=/bin/cat /var/log/messages*`
WARN: `sudo cat /var/log/messages /etc/shadow`

Use Aliases instead of * in command
Cmnd_Alias BACKUP = /sbin/dump, /sbin/restore,   /usr/bin/mt
mwlucas ALL=BACKUP

