#!/usr/bin/env bash

wget https://github.com/pillar-markup/book-skeleton/archive/master.zip && unzip master.zip

mv book-skeleton-master/* .

rm -fr Example book-skeleton-master master.zip createNewBook.sh

cat > README.md << END
New Book
END
