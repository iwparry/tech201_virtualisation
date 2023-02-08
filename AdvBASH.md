# Advanced Linux/BASH commands

Notes on advanced Linux commands to use in BASH in Tech 201.

### Kernal

The core of our OS i.e. this is what makes 'Windows' Windows.

For us to interact with our OS we use the Command Line, and this is how we'll interact with our VMs as well.

`uname` - gives us the kernel, in the case of our first VM we get `Linux`

In the command line we have 'flags' which are used to specify commands to get specified output e.g.
```
vagrant@ubuntu-xenial:~$ uname -a
```
Here our flag is `-a`, when we run this we get
```
Linux ubuntu-xenial 4.4.0-210-generic #242-Ubuntu SMP Fri Apr 16 09:57:56 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
```
This gives us all the details of our OS (the VM we created).

Other flags include:
`-s`
`-r`
`-m`
`-i`
`-o`

Commands we use:
`ls` - Lists the content of our current folder
`cd` - Change Directory, allows us to navigate through our working directory
`pwd` - Print Working Directory, shows us exactly where we are in the folder structure
`mkdir` - Make Directory, allows us to make a folder from our terminal
`clear` - Clears the terminal
`touch` - Makes a file in current directory
`cat` - Allows us to view the contents of a particular file
`nano` - We can use to edit files from our terminal, can also use this to edit our BASH profile
`cp` - Allows us to copy files
`rm` -  Allows us to delete a file
`rmdir` - Remove Directory, allows us to delete a directory (empty)
`mv` - Moves a file to a target folder. We can also use this command to rename a file.
`grep` - We can search for a word in a filename

```
ls -l
```
Lists files in long format gives us
```
drwxrwxr-x 2 vagrant vagrant 4096 Feb  8 11:43 test_dir
```
This is a good way to check our file permissions.

```
cp -rf
```
Allows us to copy the contents of one folder to an existing/new, `r` means recursive i.e. everything in the folder, `f` stands for force; execute the command regardless of security or whether ther file is in use

```
cd ~
```
Here `~` represents home directory, this will take us back automatically to the root of our directory.
```
cd ..
```
Takes us to the directory above our current directory

```
rsync -r new_folder new_folder2
```
We use this command to copy `new_folder` and its contents into `new_folder2`

```
rm -rf folder_name
```
This will delete a folder and its contents, where the flag `-rf` is the same as previously.

```
command --help
```
How we can get more information on any particular command.

```
ls t*
```
This can be used to list all files and folders with `t`, we refer to this as a wildcard

### Absolute PATH and Relative PATH
#### Absolute
##### Linux/MAC
```
/users/username/Documents/myfile.txt
```
##### Windows
```
C:/users/username/Documents/myfile.txt
```
##### Web URLs
```
https://www.mysite.com/myfolder/subfolder/sub/sub2/page1.ht
```
#### Relative


