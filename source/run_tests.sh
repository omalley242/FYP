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
    run ./tests/early-loop-termination/
}

cond() {
    run ./tests/conditional-scalar-update/
}

cross() {
    run ./tests/cross-iteration-dependacy/
}

run() {
    for i in $1**/*.c; do # Whitespace-safe and recursive
        clang -S -g -fsave-optimization-record=yaml -O3 -emit-llvm $i -o "${i%.*}.ll"
    done
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
