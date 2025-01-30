# Function to print the correct usage of this script
print_usage() {
  echo "Usage:"
  echo "run_tests.sh [ARGUEMENTS]"
  echo ""
  echo "[ARGUEMENTS]"
  echo "-t [TYPE]     Build with a specified type defaults to full"
  echo ""
  echo "[TYPES]"
  echo "full          Run all Tests"
  echo "early         Run Early Exit Tests"
  echo "cond          Run Conditional Scalar Update Tests"
  echo "cross         Run Cross Iteration Dependacy Tests"

}

full() {
    early
    cond
    cross
}

early() {
    find ./tests/early-loop-termination/*/*.c -type f -print0 | xargs -P 8 -0 -I {} clang -cc1 -emit-llvm -O3 {}
}

cond() {
    find ./tests/conditional-scalar-update/*/*.c -type f -print0 | xargs -P 8 -0 -I {} clang -cc1 -O3 -emit-llvm {}
}

cross() {
    find ./tests/cross-iteration-dependacy/*/*.c -type f -print0 | xargs -P 8 -0 -I {} clang -cc1 -O3 -emit-llvm {}
}

#Default values of arguements
t_flag='full'

#Extract arguements values
while getopts 't:' flag; do
  case "${flag}" in
    t) t_flag="${OPTARG}" ;;
    *) print_usage
       exit 1 ;;
  esac
done

# Check which build type and run the correct sub-scripts
case "${t_flag}" in 
  full) full;;
  early) early;;
  cond)  cond;;
  cross) cross;;
  *) print_usage
       exit 1 ;;
esac
