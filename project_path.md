# init
<!-- To comply with the format -->
## Create for your own project a project folder in the Linux console (terminal ,bash shell), e.g. in your your own home directory, and then open this folder as a new project in the MS VSCODE program
<!-- To comply with the format -->
```bash <!-- markdownlint-disable-line code-block-style -->
# cd && mkdir <project_name folder> && cd $_
# command 'cd' change to home folder from logged in user
cd && mkdir rust-example-cov && cd $_
```
<!-- To comply with the format -->
<!--- THis empty line inside the block is necessary for correct format -->
>[!TIP]
>TL;DR: What is the Set Command in Linux? [![alt text][1]](https://ioflood.com/blog/set-linux-command/)
>>The set command in Linux is a built-in shell command used to set or unset
>>values of shell options and positional parameters. The basic use syntax is,
>>set [options] [arguments]. It’s like a master control panel
>>for your shell environment.
><!--- THis empty line inside the block is necessary for correct format -->
<!--- THis empty line inside the block is necessary for correct format -->
>[!TIP]
> set command options [![alt text][1]](https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html)
>
>```set -euxo pipefail```  
<!-- -->
>> set -> Modifying Shell Behavior  
<!-- -->
>> -e ->  
>>> Exit immediately if a pipeline,
>>> which may consist of a single simple command  
<!-- -->
>> -u ->  
>>> Treat unset variables and parameters other than the
>>> special parameters ‘@’ or ‘*’, or array variables
>>> subscripted with ‘@’ or ‘*’, as an error when
>>> performing parameter expansion. An error message
>>> will be written to the standard error, and
>>> a non-interactive shell will exit.  
<!-- -->
>> -x ->  
>>> Print a trace of simple commands, for commands, case
>>> commands, select commands, and arithmetic for commands
>>> and their arguments or associated word lists after they
>>> are expanded and before they are executed. The value of
>>> the PS4 variable is expanded and the resultant value
>>> is printed before the command and
>>> its expanded arguments  
<!-- -->
>> -o -> Set the option corresponding to option-name  
<!-- -->  
>> pipefail -> If set, the return value of a pipeline
>>> is the value of the last (rightmost) command
>>> to exit with >>a non-zero status, or zero if all commands
>>> in the pipeline >>exit successfully. This option
>>> is disabled by default.
>
<!--- THis empty line inside the block is necessary for correct format -->
>[!TIP]
>How To Use set and pipefail in Bash Scripts on Linux/Debian [![alt text][1]](https://www.howtogeek.com/782514/how-to-use-set-and-pipefail-in-bash-scripts-on-linux/)  
>>Using the example of installing the package build-essential  
>>see below

<!--- THis empty line inside the block is necessary for correct format -->
<!-- FIXIT https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html -->
><!--- THis empty line inside the block is necessary for correct format -->
>```bash
>#!/bin/bash
>set -euxo pipefail
>```
<!--- THis empty line inside the block is necessary for correct format -->
>[!TIP]
>How to see contents of a .deb Debian / Ubuntu package file [![alt text][1]](https://www.cyberciti.biz/faq/view-contents-of-deb-file/)
><!--- THis empty line inside the block is necessary for correct format -->
>```bash
>set -euxo pipefail && \
>#install/update && \
>sudo apt-get --yes update && \
>sudo apt-get install --yes apt-file && \
>#Updating APT database && \
>sudo apt-file update && \
>#List contents Of a Debian .deb File / Package && \
>#apt-file list packageName && \
>sudo apt-file list build-essential && \
>#change to /tmp folder && \
>cd /tmp
>```
<!--- THis empty line inside the block is necessary for correct format -->
## Initialize a new Rust-based project in the previously created folder for use in the Microsoft Visual Studio Code application
<!-- To comply with the format -->
```bash <!-- markdownlint-disable-line code-block-style -->
set -euxo pipefail && \
touch README.md && \
&& ln -s README.md README && \
&& cargo init "." && \
&& cargo add rustfmt && \
&& rustup component add rustfmt && \
&& mkdir examples && \
&& cp src/main.rs examples/example.rs && \
&& sed -i -e 's/world/example/g' examples/example.rs && \
&& rustup  show && \
&& rustup  check && \
&& rustup toolchain uninstall stable && \
&& rustup toolchain install stable && \
&& rustup update  --force && \
&& rustup show && \
&& mkdir tests && \
&& mkdir -p img && \
&& wget  -P img/ "https://raw.githubusercontent.com/MathiasStadler/link_symbol_svg/360d1327d05280d53de5fa816c522f89a35891ca/img/link_symbol.svg"
if [ ! -d /tmp/img ]; then
    echo "Folder not found!"
fi
test directory="/tmp/img"
if [ ! -f $test_directory ]; then
    echo "Folder $test_directory not found!"
    mkdir $test_directory
fi
```

<!--- THis empty line inside the block is necessary for correct format -->
## Fetch project from GitHub [![Alt-Text][1]](https://github.com/vmatare/thinkfanl)

>[!NOTE]
>Difference between Compiler and Assembler [![alt text][1]](https://www.geeksforgeeks.org/compiler-design/difference-between-compiler-and-assembler/)
><!--- THis empty line is necessary for correct format -->
>[!NOTE]
>llvm_asm

>[!TIP]
><!--- THis empty line inside the block is necessary for correct format -->
>- Download Link symbol via wget [![alt text][1]](https://askubuntu.com/questions/207265/how-to-download-a-file-from-a-website-via-terminal) man page [![alt text][1]](https://linux.die.net/man/1/wget)
>- Command option wget
>   -P ``<dir>``  **P as UPPER LETTER**  
>   --page-requisites  
>   This option causes ``wget`` to download all the files that are necessary to properly display a given HTML page. This includes such things as inlined images, sounds, and referenced stylesheets
<!--- THis empty line inside the block is necessary for correct format -->
>## Command to create folder and download via bash shell
<!--- THis empty line inside the block is necessary for correct format -->
>```bash
>mkdir -p img && wget  -P img/ "https://raw.githubusercontent.com/MathiasStadler/link_symbol_svg/>360d1327d05280d53de5fa816c522f89a35891ca/img/link_symbol.svg"
>```
<!--- THis empty line inside the block is necessary for correct format -->
<!--- THis empty line is necessary for correct format -->
<!-- Link sign - Don't Found a better way :-( - You know a better method? - send me a email -->

[1]: ./img/link_symbol.svg
<!--- THis empty line is necessary for correct format -->
