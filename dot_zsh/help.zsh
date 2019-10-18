# See From Bash to Z Shell,  Page: 101 
if [[ $(whence -v run-help) == 'run-help is a shell function' ]]; then
        unalias run-help
fi
autoload -Uz run-help
# From zsh-helpfiles (see fink)
alias help=run-help

# From zsh-lovers
# Function Usage: doc packagename

# We can only easily use one documentation directory, so
# these are in priority order
docdirs=(/sw/share/doc /usr/local/share/doc /usr/share/doc)

foreach dir ($docdirs) {
   if [[ -d $dir ]] then
       doc() { cd $dir/$1 && ls }
       gdoc() { cd $dir/$1 && $EDITOR . }
       _doc() { _files -W $dir -/ }
       break
   fi
}

# provide useful information on globbing
H-Glob() {
     echo -e "
     /      directories
     .      plain files
     @      symbolic links
     =      sockets
     p      named pipes (FIFOs)
     *      executable plain files (0100)
     %      device files (character or block special)
     %b     block special files
     %c     character special files
     r      owner-readable files (0400)
     w      owner-writable files (0200)
     x      owner-executable files (0100)
     A      group-readable files (0040)
     I      group-writable files (0020)
     E      group-executable files (0010)
     R      world-readable files (0004)
     W      world-writable files (0002)
     X      world-executable files (0001)
     s      setuid files (04000)
     S      setgid files (02000)
     t      files with the sticky bit (01000)
     print *(m-1)          # List files modified today.
     print *(a1)           # List files accessed one day ago.
     print *(@)            # Print links.
     print *(Lk+50)        # List files > 50 Kilobytes.
     print *(Lk-50)        # List files < 50 Kilobytes.
     print **/*.c          # Recursively list all c files.
     print **/*.c~file.c   # List all c files, except file.c
     print (foo|bar).*     # List files whos names start foo or bar.
     print *~*.*           # 
     chmod 644 *(.^x)      # make all non-executable files publically readable
     print -l *(.c|.h)     # List all c and header files on their own lines. 
     print **/*(g:users:)  # Recursively list files with the group 'users'
     echo /proc/*/cwd(:h:t:s/self//) # Analogue of >ps ax | awk '{print $1}'<"
}
# vim: set syn=zsh:
