restruct() {
  for f in $(ls $1)
  do
    if [ -d $1/$f ]
    then
      restruct $1/$f $2
    else
      fnew=$f
      while [ -f "$2/$fnew" ]
      do
        fnew+="(copy)"
      done
      cp $1/$f $2/$fnew
    fi
  done
}

rm -rf $2
mkdir $2
restruct $1 $2