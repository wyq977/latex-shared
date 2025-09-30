#!/bin/sh
# Shell script to sync a local latex-shared folder to the texmf tree
# using symbolic links. This allows you to keep your TeX files in a
# version-controlled directory.

# A helper function to create a symlink if it doesn't already exist
create_symlink() {
    local source_path=$1
    local dest_path=$2
    
    # Check if a symbolic link already exists at the destination
    if [ -L "$dest_path" ]; then
        echo "Link already exists for '$(basename "$source_path")'. Skipping."
    # Check if a regular file or directory exists there
    elif [ -e "$dest_path" ]; then
        echo "Warning: A file or directory already exists at '$dest_path'. Please remove it first. Skipping."
    # If nothing is there, create the link
    else
        echo "Creating link: $dest_path -> $source_path"
        ln -s "$source_path" "$dest_path"
    fi
}

SOURCEDIR="$HOME/projects/latex-shared"
DESTDIR=$(kpsewhich -var-value TEXMFHOME)

if [ -z "$DESTDIR" ] || [ ! -d "$SOURCEDIR/bib" ] || [ ! -d "$SOURCEDIR/bst" ] || [ ! -d "$SOURCEDIR/tex" ]; then
    echo "Error: A prerequisite check failed."
    echo "Please ensure that MacTeX is installed and that the source directory"
    echo "'$SOURCEDIR' contains the 'bib', 'bst', and 'tex' subdirectories."
    exit 1
fi

echo "-------------------------------------------------------------"
echo "Source directory: $SOURCEDIR"
echo "TeX destination:    $DESTDIR"


create_symlink "$SOURCEDIR/bib" "$DESTDIR/bib"
create_symlink "$SOURCEDIR/bst" "$DESTDIR/bst"
create_symlink "$SOURCEDIR/tex" "$DESTDIR/tex"

echo "-------------------------------------------------------------"
echo "Updating TeX file database..."
texhash
echo "Setup complete!"