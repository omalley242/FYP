#check if ran as root
if [ "$EUID" -ne 0 ]
  then (
    echo "Please run this script with sudo"
    echo "(this is to allow files to be moved to the correct install directories)"
    )
  exit
fi

#build llvm
./build_llvm_script.sh

#build clang
./build_clang_script.sh