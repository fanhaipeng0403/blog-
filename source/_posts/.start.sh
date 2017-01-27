#!/bin/bash


hexo_created=`hexo new $1`
vim ${hexo_created##*/}


#http://www.jb51.net/article/47529.html
