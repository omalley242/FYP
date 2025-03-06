#!/bin/bash
    
# Function to print the correct usage of this script
print_usage() {
  echo "Usage:"
  echo "build.sh [ARGUEMENTS]"
  echo ""
  echo "[ARGUEMENTS]"
  echo "-t            Number of threads to use during the build defaults to 6"
  echo "-b [TYPE]     Build with a specified type defaults to full"
  echo ""
  echo "[TYPES]"
  echo "full          Build both Clang and LLVM"
  echo "llvm          Build just LLVM"
  echo "clang         Build just Clang"
}

#check if ran as root
if [ $(id -u) -ne 0 ]
  then (
    echo "Please run this script with sudo"
    echo "(this is to allow files to be moved to the correct install directories)"
    )
  exit
fi

#Default values of arguements
t_flag='6'
b_flag='full'

#Extract arguements values
while getopts 't:b:' flag; do
  case "${flag}" in
    t) t_flag="${OPTARG}" ;;
    b) b_flag="${OPTARG}" ;;
    *) print_usage
       exit 1 ;;
  esac
done

# Check which build type and run the correct sub-scripts
case "${b_flag}" in 
  full) ./build_llvm_script.sh -t ${t_flag} && ./build_clang_script.sh -t ${t_flag} ;;
  llvm) ./build_llvm_script.sh -t ${t_flag} ;;
  clang) ./build_clang_script.sh -t ${t_flag} ;;
  *) print_usage
       exit 1 ;;
esac
