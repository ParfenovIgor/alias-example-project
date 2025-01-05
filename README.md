# Alias Example Project

This repository will help you quickly get started working with Alias programming language.

## Build Alias Compiler

Follow the [link](https://github.com/ParfenovIgor/alias-c) and do *Building from Source* section.

Most probably, you will need to install `make` and `nasm` using your standard package manager and do:

```
git clone https://github.com/ParfenovIgor/alias-c.git
cd alias-c
make test
```

## Update Environmental Variables

If you will add calias to your *PATH* environmental variable, then you will be able to type `calias` in terminal to execute it. You also need a path to `altlib` in a specific environmental variable `ALTLIB`.

You can enter the following commands in shell every time you need to work with alias.

If you use `bash`, you can add the following commands in file `~/.bashrc`. In this case they will be executed every time automatically.

```
export PATH="<path to repository>/alias-c/build:$PATH"
export ALTLIB="<path to repository>/alias-c/build/altlib_ext"
```

## You Can Build

Clone this repository and build the project:

```
git clone https://github.com/ParfenovIgor/alias-example-project.git
cd alias-example-project
make
```

Run the program:

```
build/main
```

The program reads an array of integers from `stdin` and prints the sorted array in `stdout`. The first integer has to be the size of the array.

### Example

### Input

```
4
6 1 4 7
```

### Output

```
1
4
6
7
```

## Build QAlias

QAlias is an IDE for Alias, which supports language server. Give it a try.

You will need **Qt version 5.\***. Depending on your system the installation can be tricky.

When you installed Qt, build the qalias:

```
git clone https://github.com/ParfenovIgor/qalias.git
cd qalias
qmake
make
```

Preferably add qalias to your *PATH* environmental variable. If you use `bash`, you can add the following command in file `~/.bashrc`.

```
export PATH="<path to repository>/qalias:$PATH"
```

## Run QAlias and Language Server

Open two shells with current working directory in this repository.

In one shell start the language server:

```
calias -ls
```

In another shell start the IDE on the background:

```
qalias &
```
