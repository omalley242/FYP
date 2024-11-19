#check if ran as root
if [ "$EUID" -ne 0 ]
  then (
    echo "Please run this script with sudo"
    echo "(this is to allow files to be moved to the correct install directories)"
    )
  exit
fi

#find start time for calcuation of elapsed time
start=`date +%s.%N`

#create build dir
mkdir ./llvm_build

#Generate a build for a release verison of llvm
CXX=clang++ CC=clang cmake llvm -S ./llvm-project/llvm  -G Ninja \
    -B ./llvm_build -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_USE_LINKER=lld \

#Run ninja within the build directory to build the llvm binary
ninja -j 6 -C ./llvm_build/ install

#Calcuate total runtime
end=`date +%s.%N`
runtime=$( echo "$end - $start" | bc -l )
echo "\n==== Total Clang Build Time ====" 
echo "\t$runtime s"