The Glamorous Toolkit Book
====================

This is a book describing the Glamorous Toolkit.


Based on the Pillar Book Skeleton [![Build Status](https://travis-ci.org/pillar-markup/book-skeleton.svg?branch=master)](https://travis-ci.org/pillar-markup/book-skeleton)
====================

What is Skeleton
----------------
Pillar Book Skeleton provides a predefined structure for source files, as well as usefull scripts to write books with [Pillar markup](https://github.com/pillar-markup).

How to use Skeleton
-------------------

Simple way:

	cd MyBook
	curl https://raw.githubusercontent.com/pillar-markup/book-skeleton/master/createNewBook.sh | bash

Other way:

* Fork this repository, and start writing your book (explained in the next section).
* Customise `pillar.conf` with your book's title.
* use the `updateBookSkeleton.sh` script. Basically, this script does:
	
	* Add this repository as a remote:

  ```shell
  git remote add skeleton https://github.com/pillar-markup/book-skeleton.git
  ```

	* Then you want to get updates from this repository execute:

  ```shell
  git pull skeleton master
  ```

  You will have to resolve conflicts if updates occurred in the lines that you've changed.

### Continuous Integration suggestions

If you want your book to be built automatically (e.g., by [Jenkins](http://jenkins-ci.org/)), you have to configure the job to execute these lines:

    ./download.sh
    ./compile.sh

and then to archive these artefacts:

    Book.pdf, Book.tex, **/*.pillar, **/*.pillar.tex, **/*.pillar.pdf, **/*.pillar.html,  **/*.pillar.md, **/figures/*, html/**

Also Skeleton comes with [Travis CI](https://travis-ci.org) configuration file. This allows you to start automated testing of your book just by enabling it on Travis CI service. Finally you can follow [Sharing Travis-CI generated files](http://sleepycoders.blogspot.com/2013/03/sharing-travis-ci-generated-files.html) tutorial, to hack GitHub and Travis into storing your artefacts.

<!-- SKELETON-SPECIFIC DATA ENDS HERE -->


How to write a book
-------------------

This book is written in Pillar markup. If you are not familiar with it please check the [pillar-documentation](https://github.com/pillar-markup/pillar-documentation).

###Generating the book

1. Execute `./download.sh` to obtain the Pillar executable that does all the job (do it only ONCE).
2. Execute `./compile.sh` to generate your book in the `book-result` folder (specified in `pillar.conf`)

###Generating one chapter

If you want to generate only one chapter, pass the file's path to the script: `./compile.sh Example/Example.pillar`. If you have `pdflatex` installed and available in your system's `PATH`, the script will also generate pdf files.

###Adding a chapter

To add a chapter create a directory for it (named, e.g., `Example`) and put there a `.pillar` file (named, e.g., `Example.pillar`) which will contain the chapter itself. Put images in the `figures` subdirectory of the new chapter directory.

Add your chapter to:

* `pillar.conf` in the `inputFiles` array as: `"Example/Example.pillar"`, and
* `support/templates/book.latex.template` in `\graphicspath` as `{../Example/}`

###Installing pillar command

If you use `pillar` in different books, you can install it once for all your books and then avoid executing the `download.sh` script anymore to not duplicates all the files (Pillar image, ...) in each repository of each books.

Steps to install `pilar`:

1. You already executed the `./download.sh` script i.e. you have the `pillar` script, ...
2. Copy you the script to your user bin folder
	
		cp pillar ~/bin

3. Copy the ressources to PILLAR_ROOT (wherever you want such as ~/Pillar) 

		cp pharo Pharo.changes Pharo.image pharo-vm $PILLAR_ROOT
	
4. Set these environment variables in your shell start up (`~/.bashrc` or `~/.zshrc`)

		cat >> ~/.zshrc < END
		
		export PHARO_VM="${PILLAR_ROOT}/pharo"
		export PILLAR_IMAGE="${PILLAR_ROOT}/Pharo.image"
		
		END
	
Now, you should be able to use the `pillar` in your shell as any other commands. 
And, when you will clone a book repository, you don't have to execute the `download.sh` and you can directly compile it using `compile.sh`. 

###Fix PNG errors while compiling LaTeX

Some png file may trigger an error when compiling tex to pdf

	libpng warning: iCCP: known incorrect sRGB profile

Solution, convert png file to use the right color profile

	find . -type f -name "*.png" -exec convert {} -strip {} \;
	
###Caveats

* You must neither use spaces nor underscores (`_`) in file names.

Tools
-----

There are mods/bundles/packages for text editors, that provide improvements for pillar files editing:

* Emacs: [pillar-mode](https://github.com/pillar-markup/pillar-mode)
* Vim: [vim-pillar](https://github.com/cdlm/vim-pillar)
* TextMate: [Pillar.tmbundle](https://github.com/pillar-markup/Pillar.tmbundle)
* ATOM: [language-pillar](https://github.com/pillar-markup/language-pillar)
