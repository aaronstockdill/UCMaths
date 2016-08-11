# UCMaths
A LaTeX Class for UC Mathematics and Statistics students. 

## Packages
This class automatically makes available the following packages:
+ `amsmath`
+ `amssymb`
+ `amsthm`
+ `mathtools`

These packages were chosen because they represent the "standard" imports when writing a mathematical document.

UCMaths also makes available `enumitem` and `ifthen`, because they are used internally/set default styles.

## Macros
Several macros over those from the above packages are also included, so make writing the majority of undergraduate course content easier.
These are:
+ `\argmin`
+ `\argmax`
+ `\abs{}`
+ `\norm{}`
+ `\mlv{}` (multi-letter variables)
+ `\diff` (d for derivatives)
+ `\divides`
+ `\sigfig{}` (only a number is required)
+ `\naturals`
+ `\integers`
+ `\rationals`
+ `\reals`
+ `\complex`
+ `\quaternions`
+ `\true`
+ `\false`
+ `\union`
+ `\intersection`
+ `\set{}`
+ `\comp{}` (compliment)
+ `\mat[]{}` (optional argument is a superscript label)
+ `\transpose`
+ `\inverse`
+ `\inversetranspose`
+ `\pseudoinverse`

We also make available by default the environments `theorem`, `lemma`, `corollary`, and `definition`.

## Styling
The class should take care of most of your styling needs.
The basic structure of a file should look like
```
\documentclass[a4paper, 12pt, twosided, signature]{ucmaths}

\title{Assignment}
\author{Eve McCodecracker}
\studentid{12345678}
\coursecode{MATH123}
\coursetitle{Maths and Stats}
\due{5pm on Friday 1 January 2134}

\coverinfo{
    Something
}

\begin{document}
    \maketitle
    Something
\end{document}
```

The class options are:
+ `twosided`, which inserts a blank page between the coversheet and the main content, so that when printing twosided the coversheet is singlesided.
+ `signature` inserts a signature line at the bottom of each (noncover) page.
+ `a4paper` and `12pt` are as for article, recommended for New Zealand.

The preamble declarations are:
+ `title`, setting the title of the document (e.g. Assignment 1, Project, etc.). Required
+ `author`, the student's name. This can be skipped by assignment authors.
+ `studentid`, the student's UC Student ID. This can also be skipped by assignment authors.
+ `coursecode`, to specify the course this is for. Required.
+ `coursetitle`, the "natural" name of the course. Requred.
+ `due`, the date the project is due. Required.

`\maketitle` will insert the coversheet and title.
