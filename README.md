# README

This project is for :
>Kaisen Linux | Documentation

It's an elixir project build with mix and exdoc.  
This project generates static html files in `doc` folder from markdown files in `md` directory and `documentation.md` in root dir.  

## How to build html documentation

- Open a terminal and enter : `mix docs`

## How to add a new file to the doc

- Create a markdown file in `md\[category]` folder.
- There is 5 `[category]` folders:
    - infos
    - faq
    - start
    - tools
    - tutorials
- Edit your text with `markdown` syntax [More info](https://guides.github.com/features/mastering-markdown/).
- Save your .md file.
- Add an entry for your file in `mix.exs` in the `extras` section like:  
```bash
"md/[catgeory]/[name-of-your-file].md": [ title: "Title your want in the menu"]
```
- save and run `mix docs`
- html file are updated in `doc` folder. Copy to your webfolder.

- index is called documentation.md in md directory
## Requirements to build the documentation

- git
- erlang
- elixir

You can use the following script to install those tools via asdf manager : 

```bash
# you must have a sudo user
chmod +x install-requirements.sh && ./install-requirements.sh
```

```bash
# then restart your shell and enter the following command to install erlang and elixir via asdf
asdf plugin add erlang
asdf plugin add elixir
asdf install erlang latest
asdf install elixir latest
```


## TO DO:

START CATEGORY :  
- add picture  
- format text nicely  
- rephrase if needed  

OTHERS CATEGORY:
- reformatting nicely

- PAGE why are all add services disabled by default
email support ? link real email

..
- hierarchy of menu
- sed to remove .html before anchor
- remove header with old url
## version

- started 13022021  
 

## run

```bash
firefox doc/index.html`
```
