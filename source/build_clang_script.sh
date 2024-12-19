#check if ran as root
if [ $(id -u) -ne 0 ];
  then (
    echo "Please run this script with sudo"
    echo "(this is to allow files to be moved to the correct install directories)"
    )
  exit
fi

#Default values of arguements
t_flag='6'

#Extract arguements values
while getopts 't:' flag; do
  case "${flag}" in
    t) t_flag="${OPTARG}" ;;
    *) print_usage
       exit 1 ;;
  esac
done

#find start time for calcuation of elapsed time
start=`date +%s.%N`

# if directory does not exist create it
if [ ! -d ./clang_build ]; then
  mkdir ./clang_build
fi

#Generate a build for a release version of clang
CXX=clang++ CC=clang cmake -G Ninja -S ./llvm-project-fyp/clang -B ./clang_build \
      -DLLVM_USE_LINKER=lld \
      -DCMAKE_BUILD_TYPE=Release -DLLVM_INCLUDE_TESTS=OFF \

#Run ninja within the build directory to build the llvm binary
ninja -j ${t_flag} -C ./clang_build/ install

#Calcuate total runtime
end=`date +%s.%N`
runtime=$( echo "$end - $start" | bc -l )
echo "\n==== Total Clang Build Time ====" 
echo "\t$runtime s"
