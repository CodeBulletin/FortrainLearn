#!/bin/bash

Files=""
for folder in $2; do
   for ext in $1; do
      file=$(find $folder -name "*.$ext")
      Files+=" $file"
   done
done

for folder in $(ls -d */); do
   if [[ "$3" =~ .*"$folder".* ]]; then
      echo "Skipped $folder"
   else
      for ext in $1; do
         file=$(find $folder -name "*.$ext")
         Files+=" $file"
      done
   fi
done

for ext in $1; do
   file=$(find -maxdepth 1 -name "*.$ext")
   Files+=" $file"
done

CompileFiles=""
for ext in $Files; do
   if [[ "$4" =~ .*"$ext".* ]]; then
      echo "Skipped $ext"
   else
      echo "compiling $ext"
      CompileFiles+=" $ext"
   fi
done

echo "gfortran -o ./build/${PWD##*/}.out $CompileFiles ${@: 5}"

gfortran -o ./build/${PWD##*/}.out $CompileFiles ${@: 5}

if [ $? -eq 0 ]; then
   echo compilation succeded 
   sleep 0.1
else
   echo "compilation failed exit code - $?"
   exit 1
fi
